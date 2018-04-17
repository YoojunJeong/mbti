package net.genieworks.util;

import net.genieworks.api.Const;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.*;
import java.util.*;


/**
 * 엑셀파일 생성에 필요한 기능을 정의한 유틸리티 클래스 
 * @author yunhuihan
 */
public class ExcelUtil {
    
    public static final Integer MAX_ROW_ACCESS_WINDOW_SIZE = 1000;
    
    // TODO scyun 
    // alphabet 인덱스를 52개만 넣었음, 이정보면 충분할 것으로 보이는데...
    public static final String[] alphabet = new String[] {"A" , "B" , "C" , "D" , "E" , "F" , "G" , "H" , "I" , "J" , "K" , "L" , "M" , "N" , "O" , "P" , "Q" , "R" , "S" , "T" , "U",  "V",  "W",  "X",  "Y",  "Z"
                                                        , "AA", "AB", "AC", "AD", "AE", "AF", "AG", "AH", "AI", "AJ", "AK", "AL", "AM", "AN", "AO", "AP", "AQ", "AR", "AS", "AT", "AU", "AV", "AW", "AX", "AY", "AZ"
                                                        };
    @SuppressWarnings("serial")
    public static final HashMap<String , Integer> alphabetCharColIdxAMap = new HashMap<String, Integer>() {{
        for (int i=0;i<alphabet.length;++i)
        {
            put(alphabet[i],i); 
        }
    }};
    
    private ExcelUtil() { }
    public static WorksheetConfigurer newWorksheetConfigurer() 
    {
        return new ExcelBuilder();
    }
    
    public static ExcelReader newExcelReader()
    {
        return new ExcelReader();
    }

    public static interface WorksheetConfigurer {
        public WorksheetConfigurer addWorksheet(String name);
        public CursorConfigurer setActiveWorksheet(String name);
    }
    
    public static interface CursorConfigurer {
        public DataHandler setCursor(String columnAlphabet, Integer rowIdx) ;
    }
    
    public static interface DataHandler {
        public DataHandler addHeaders(ColumnHeader... headers) ;
        public DataHandler addTempHeaders(ColumnHeader... headers);
        public DataHandler doneAddTempHeaders();
        public DataHandler addRowData(ColumnData... datas) ;
        public DataHandler addTempRowData(ColumnData... datas);
        public DataHandler doneAddTempRowData();
        public ExcelWriter done();
        public CursorConfigurer changeWorksheet(String name);
        
    }
    
    public static interface ExcelWriter {
        public File write(File parent) throws IOException ;
        public void write(OutputStream os) throws IOException ;
    }
    
    
    public static interface ExcelReaderCallback {
        void callback (List<Map<String, String>> rows);
    }
    
    
    /**
<pre>

    public static class LoggingExcelReaderCallback implements ExcelReaderCallback 
    {
        @Override
        public void callback(List<Map<String, String>> rows)
        {
            System.out.println("rowsCount ->" + rows.size());
        }
    }

            ExcelUtil.newExcelReader().setInputStream(is) // 엑셀파일 데이터를 읽을  inputStream  설정.. 
                       .setWorksheet("SHEET_1") // 시트명 입력..
                       .setCursor("B", 3) // cursor 설정. 
                       .setHeaders(
                               new ColumnHeader("관리번호", "STRING"),  // 읽을 헤더정보.
                               new ColumnHeader("법인명", "STRING"), 
                               new ColumnHeader("별명", "STRING") )
                       .checkHeader() // 스트림으로부터 읽어들인 데이터 헤더가 맞는지 확인 
                       .setFetchSize(10) // 엑셀에서 한번에 읽어들일 데이터 사이즈.
                       .setCallback(new LoggingExcelReaderCallback()) // fetch 사이즈만큼 읽은 뒤 처리될 callback 
                       .doStart(); // 실제 수행 START 
</pre>
     * @author yunhuihan
     */
    public static class ExcelReader {
        XSSFWorkbook wb = null; 
        Sheet sheet = null;
        String alphabetIdx = null;
        Integer rowIdx = null;
        ColumnHeader[] headers = null;
        
        Integer fetchSize = null;
        
        ExcelReaderCallback ercb = null;

        private ExcelReader() { }
        
        public static ExcelReader newinstance() 
        {
            return new ExcelReader();
        }
        
        public ExcelReader setInputStream(InputStream is) throws IOException {
            wb = new XSSFWorkbook(is);
            return this;
        }

        public ExcelReader setWorksheet(String sheetName) {
            sheet = wb.getSheet(sheetName);
            return this;
        }
        
        private void nextRow()
        {
            this.rowIdx++;
        }

        /**
         * 
         * @param alphabetIdx
         * @param rowIdx : 1부터 시작합니다. 
         * @return
         */
        public ExcelReader setCursor(String alphabetIdx, Integer rowIdx) {
            this.alphabetIdx = alphabetIdx;
            this.rowIdx = rowIdx;
            return this;
        }
        
        public ExcelReader setHeaders(ColumnHeader... columnHeaders) {
            this.headers = columnHeaders;
            return this;
        }
        
        public ExcelReader checkHeader() {
            // HEADER 이름비교..다르면 우리가 제공한 포멧이 아님..
            Row row = sheet.getRow(rowIdx - 1);
            for (int i=0;i< this.headers.length; ++i) {
                //String headerName :
                Cell cell = row.getCell(alphabetCharColIdxAMap.get(alphabetIdx) + i);
                if(!cell.getStringCellValue().equals(headers[i].getTxt())) {
                    throw new RuntimeException("format mismatch..");
                }
            }
            this.nextRow();
            return this;
        }

        public ExcelReader setFetchSize(Integer fetchSize) {
            this.fetchSize = fetchSize;
            return this;
        }

        public ExcelReader setCallback(ExcelReaderCallback cb) {
            this.ercb = cb;
            return this;
        }

        public void doStart() {

            List<Map<String, String>> fetchResult = new ArrayList<>();

            while(true) {

                Map<String, String> rowData = new HashMap<>();
                boolean isEmptyRow = true;
                Row __row = sheet.getRow(rowIdx-1);

                if (__row == null) {
                    ercb.callback(fetchResult);// .write(fetchResult);
                    break;
                }

                for (int k=0;k<headers.length;++k) {
                    System.out.println("k =>" + k + ", headerName ->" +headers[k].getTxt());
                    Cell cell = __row.getCell(alphabetCharColIdxAMap.get(alphabetIdx) + k);
                    String cellValue =  Const.EMPTY_STRING;

                    if(cell.getCellTypeEnum() == CellType.NUMERIC) {
                        cellValue = String.valueOf(cell.getNumericCellValue());
                    } else if (cell.getCellTypeEnum() == CellType.FORMULA) {
                        cellValue = cell.getStringCellValue();
                    } else {
                        cellValue = cell.getStringCellValue();
                    }
                    
                    rowData.put(headers[k].getTxt(), cellValue);
                    isEmptyRow = isEmptyRow && Const.EMPTY_STRING.equals(cellValue);
                }
                // 
                nextRow();

                if (!isEmptyRow) {

                    fetchResult.add(rowData);

                    if (fetchResult.size() == fetchSize ) {
                        ercb.callback(fetchResult);
                        fetchResult = new ArrayList<>();
                    }
                }
            }
        }
    }
    
    private static class ExcelBuilder implements WorksheetConfigurer, CursorConfigurer,  DataHandler , ExcelWriter {

        private SXSSFWorkbook wb = null;

        private String uniqueId = null;
        private Map<String, Sheet> workSheetMap = null;

        private Sheet activeWorksheet = null;

        private Integer cursorRowIdx;
        private String cursorColumnAlphabet;

        private List<ColumnHeader> columnHeaders = new ArrayList<>();
        private List<ColumnData> columnDatas = new ArrayList<>();

        private ExcelBuilder() {
            this.workSheetMap = new HashMap<>();
            this.wb = new SXSSFWorkbook(MAX_ROW_ACCESS_WINDOW_SIZE);
            this.setUniqueId(UUID.randomUUID().toString()); // 서버 내부에 저장할 파일명.
        }

        // ~~~ 엑셀파일 생성 process
        // 1. worksheet 생성..
        public WorksheetConfigurer addWorksheet(String name) {
            Sheet sheet = this.wb.createSheet(name);
            this.activeWorksheet = sheet;
            this.workSheetMap.put(name, sheet);
            return this;
        }

        public CursorConfigurer setActiveWorksheet(String name) {

            if (!this.workSheetMap.containsKey(name)) {
                addWorksheet(name);
            }
            this.activeWorksheet = this.workSheetMap.get(name);
            return this;
        }

        // 2. set position
        /**
         * @param columnAlphabet
         * @param rowIdx
         *            : 1부터 시작함.
         * @return
         */
        public ExcelBuilder setCursor(String columnAlphabet, Integer rowIdx) {
            this.cursorColumnAlphabet = columnAlphabet;
            this.cursorRowIdx = rowIdx - 1;
            return this;
        }

        // 3. header setting
        public ExcelBuilder addHeaders(ColumnHeader... headerTxt) {
            
            CellStyle cellStyle = this.wb.createCellStyle();//.setAlignment(HorizontalAlignment.CENTER);
            cellStyle.setAlignment(HorizontalAlignment.CENTER);
            cellStyle.setBorderTop(BorderStyle.MEDIUM);
            cellStyle.setBorderBottom(BorderStyle.MEDIUM);
            cellStyle.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
            cellStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
            
            int cursorAlphabetIdx = alphabetCharColIdxAMap.get(this.cursorColumnAlphabet);
            Row row = this.activeWorksheet.createRow(this.cursorRowIdx);

            for (int i = 0; i < headerTxt.length; ++i) {
                this.activeWorksheet.setColumnWidth(cursorAlphabetIdx + i, headerTxt[i].getSize() * 512);

                Cell cell = row.createCell(cursorAlphabetIdx + i);
                cell.setCellValue(headerTxt[i].getTxt());
                cell.setCellStyle(cellStyle);
            }
            this.moveNextRow();
            return this;
        }

        public ExcelBuilder addTempHeaders(ColumnHeader... headers) {
            for (ColumnHeader header : headers)
            {
                columnHeaders.add(header);
            }
            return this;
        }

        public ExcelBuilder doneAddTempHeaders() {
            addHeaders( columnHeaders.toArray(new ColumnHeader[columnHeaders.size()]));
            columnHeaders.clear();
            return this;
        }

        @Override
        public DataHandler addRowData(ColumnData... datas) {

            int cursorAlphabetIdx = alphabetCharColIdxAMap.get(this.cursorColumnAlphabet);
            Row row = this.activeWorksheet.createRow(this.cursorRowIdx);

            for (int i = 0; i < datas.length; ++i) {
                CellStyle cellStyle = this.wb.createCellStyle();
                cellStyle.setBorderBottom(BorderStyle.THIN);
                cellStyle.setAlignment(datas[i].getAlignType());
                Cell cell = row.createCell(cursorAlphabetIdx + i);
                cell.setCellValue(datas[i].getTxt());
                cell.setCellStyle(cellStyle);
            }
            this.moveNextRow();
            return this;
        }

        @Override
        public DataHandler addTempRowData(ColumnData... datas) {

            for (ColumnData data : datas) {
                columnDatas.add(data);
            }
            return this;
        }

        @Override
        public DataHandler doneAddTempRowData() {
            addRowData( columnDatas.toArray(new ColumnData[columnDatas.size()]));
            columnDatas.clear();
            return this;
        }

        public void setUniqueId(String uniqueId)
        {
            this.uniqueId = uniqueId;
        }

        public ExcelBuilder moveNextRow() {
            this.cursorRowIdx++;
            return this;
        }

        @Override
        public ExcelWriter done()
        {
            return this;
        }

        @Override
        public File write(File parent) throws IOException {

            File writeFile = new File(parent, this.uniqueId + ".xlsx");
            if (writeFile.exists()) {
                throw new IOException("## duplicate file name");
            }

            boolean isCreated = writeFile.createNewFile();
            if (!isCreated) {
                throw new RuntimeException("## create New file fail");
            }

            BufferedOutputStream bos = null;
            try {
                bos = new BufferedOutputStream(new FileOutputStream(writeFile));
                this.wb.write(bos);
                bos.flush();
                bos.close();
                bos = null;
                this.wb.dispose();
            } catch (Exception e) {
                throw new IOException("## write Excel data fail", e);
            } finally {

                if (bos != null) {
                    try {
                        bos.close();
                        bos = null;
                    } catch (Exception e) {

                    }
                }
            }
            return writeFile;
        }

        @Override
        public void write(OutputStream os) throws IOException {
            BufferedOutputStream bos = null;
            try {
                bos = new BufferedOutputStream(os);
                this.wb.write(bos);
                bos.flush();
                bos.close();
                bos = null;
                this.wb.dispose();
            } catch (Exception e) {
                throw new IOException("## write Excel data fail", e);
            } finally {
                if (bos != null) {
                    try {
                        bos.close();
                        bos = null;
                    } catch (Exception e) {

                    }
                }
            }
        }

        @Override
        public CursorConfigurer changeWorksheet(String name) {
            this.setActiveWorksheet(name);
            return this;
        }

    }
    
    public static class ColumnHeader {

        public static String COLUMN_TYPE_STRING = "STRING";
        public static String COLUMN_TYPE_NUMBER = "NUMBER";
        public static String COLUMN_TYPE_DATE   = "DATE";

        private String txt;
        private Integer size;
        private String dataType;
        private String dateFormat;
        
        /**
         * 엑셀 타이틀 데이터 
         * @param txt   Display될 문자열 
         * @param size  너비 (글자수)
         */
        public ColumnHeader(String txt, Integer size) {
            this.txt = txt;
            this.size = size;
        }

        /**
         * @param txt String : 헤더 타이틀. 
         * @param dataType   : 해당 헤더의 값 타입 (STRING, NUMBER,  DATE 중 하나만 올 수 있음 )
         */
        public ColumnHeader(String txt, String dataType) {
            this.txt = txt;
            this.dataType = dataType;
        }
        
        /**
         * @param txt String : 헤더 타이틀. 
         * @param dataType   : 해당 헤더의 값 타입 (STRING, NUMBER,  DATE 중 하나만 올 수 있음 )
         * @param dateFormat : DATE 타입일 경우 dataFormat 
         */
        public ColumnHeader(String txt, String dataType, String dateFormat) {
            this.txt = txt;
            this.dataType = dataType;
            this.dateFormat = dateFormat;
        }
        
        public String getTxt()
        {
            return txt;
        }
        public void setTxt(String txt)
        {
            this.txt = txt;
        }
        public Integer getSize()
        {
            return size;
        }
        public void setSize(Integer size)
        {
            this.size = size;
        }
        public String getDataType()
        {
            return dataType;
        }
        public void setDataType(String dataType)
        {
            this.dataType = dataType;
        }
        
        public String dateFormat() 
        {
            return this.dateFormat;
        }
        public void setDateFormat(String dateFormat)
        {
            this.dateFormat = dateFormat;
        }
    }
    
    public static class ColumnData {

        private String txt;
        private HorizontalAlignment alignType;
        
        public ColumnData(Object txt, HorizontalAlignment alignType) {
            this.txt = txt == null ? Const.EMPTY_STRING : txt.toString();
            this.alignType = alignType;
        }
        public String getTxt()
        {
            return txt;
        }
        public void setTxt(String txt)
        {
            this.txt = txt;
        }
        public HorizontalAlignment getAlignType()
        {
            return alignType;
        }
        public void setAlignType(HorizontalAlignment alignType)
        {
            this.alignType = alignType;
        }
        
        public String toString() 
        {
            return this.txt;
        }
    }
    
}
