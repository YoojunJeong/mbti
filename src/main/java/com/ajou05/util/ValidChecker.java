package com.ajou05.util;

import com.ajou05.api.Const;
import com.ajou05.api.exception.ValidCheckerException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
 
public class ValidChecker {

    private static Logger logger = LoggerFactory.getLogger(ValidChecker.class);
    
    public static void isEmpty(HttpStatus httpStatus, String err_code, String err_msg, Object data) {
        isInvalid(isEmpty(data), httpStatus, err_code, err_msg);
    }
    
    public static void isInvalidEmail(HttpStatus httpStatus, String err_code, String err_msg, Object data) {
        isInvalid(!isValidEmail(data.toString()), httpStatus, err_code, err_msg);
    }

    public static void isInvalidId(HttpStatus httpStatus, String err_code, String err_msg, Object data) {
        isInvalid(!isValidId(data.toString()), httpStatus, err_code, err_msg);
    }
    
    public static void isInvalid(boolean isInvalid, HttpStatus httpStatus, String err_code, String err_msg) {

        if (isInvalid) {
            throw new ValidCheckerException(httpStatus, err_code, err_msg );
        }
    }

    public static void isOnlySpace(HttpStatus httpStatus, String err_code, String err_msg, Object data) {
        isInvalid(isOnlySpace(data), httpStatus, err_code, err_msg);
    }
    
    public static void checkLogin() {

        HttpSession session = RequestUtil.popSession();
        Object authUserProfile = session.getAttribute(Const.AUTH_USER_PROFILE_KEY);
        if (authUserProfile == null) {
            throw new AuthMgntException(Const.AUTH_NEED_LOGIN);
        }
    }
    
    public static boolean isEmpty(Object source) {
        if (source == null) 
            return true;
        
        return Const.EMPTY_STRING.equals(source.toString());
    }

    public static boolean isInvalidNumber(Integer source) {
    	if(source == null) {
            return true;
        }

    	return source == -1;
    }

    public static boolean isOnlySpace(Object source) {
        if (source == null) {
            return true;
        }

        return Const.EMPTY_STRING.equals(source.toString().trim());
    }
    
    public static <T> boolean isEmptyArray(T[] array) {
        if (array == null) {
            return true;
        }

        return array.length == 0;
    }

    public static boolean isValidApiKeyHeader(List xApiHeaderValue) {
        if (xApiHeaderValue == null || xApiHeaderValue.size() != 1) {
            return false;
        }
        return Const.X_API_KEY_VALUE.equals(xApiHeaderValue.get(0)) ;
    }


    public static boolean isValidEmail(Object source) {
        if (isEmpty(source)){
            return false;
        }

        Pattern pattern = Pattern.compile(Const.EMAIL_PATTERN);
        Matcher matcher = pattern.matcher(source.toString());

        return matcher.matches();
    }

    public static boolean isValidId(Object source) {
        if (isEmpty(source)){
            return false;
        }

        Pattern pattern = Pattern.compile(Const.ID_PATTERN);
        Matcher matcher = pattern.matcher(source.toString());
        return matcher.matches();
    }
    
    public static boolean isValidPhoneNumber(String source) {
        if (isEmpty(source)) {
            return false;
        }
        Pattern pattern = Pattern.compile(Const.TEL_PATTERN);
        Matcher matcher = pattern.matcher(source);
        return matcher.matches();
    }
    
    public static boolean isValidCorpSerial(String bizId) {
        if (isEmpty(bizId)) {
            return false;
        }
        bizId = bizId.replaceAll("-", "");
        if(bizId.length()!=10) { // 문자열.length() : 문자열의 길이를 구한다.
            return false;
        }
        // 여기까지 내려오면 숫자로만 이루어진 10자리이다.
        int sum=0;
        // 1. 각각의 자리에 1 3 7 1 3 7 1 3 5 를 곱한 합을 구한다. 
        String checkNo="137137135";
        for(int i=0;i<checkNo.length();i++) {
            sum += (bizId.charAt(i)-'0') * (checkNo.charAt(i)-'0');
        }
        // 2. 마지막에서 두번째 숫자에 5를 곱하고 10으로 나누어 나온 몫을 더한다.
        sum += ((bizId.charAt(8)-'0') * 5)/10;
        // 3. 매직키인 10로 나누어 나머지만 취한다. 
        sum %= 10;
        // 4. 매직키인 10에서 나머지를 빼면
        sum = 10 - sum;

        return sum==bizId.charAt(9)-'0';
    }
    
    public static <T> boolean hasValue(T[] src, T val) {
        if (src == null || src.length == 0) {
            return false;
        }

        boolean hasValue = false;
        
        for (T value : src) {
            if (value.equals(val)) {
                hasValue = true;
                break;
            }
        }
        
        return hasValue;
    }
    
    /**
     * yyyy-MM-dd 인지 확인 
     * @param txt
     * @return
     */
    public static boolean isValidYYYYMMDDWithHipenPattern(String txt) {
        String[] arr = txt.split("-");
        if (arr.length != 3) {
            return false;
        }
        return isValidDate(arr[0], arr[1], arr[2]);
    }
    
    /**
     * yyyyMMdd 인지 확인 
     * @param txt
     * @return
     */
    public static boolean isValidYYYYMMDDPattern(String txt) {
        if (txt.length() != 8) {
            return false;
        }
        return isValidDate(txt.substring(0, 4), txt.substring(4,2), txt.substring(6,2));
    }
    
    private static boolean isValidDate(String year, String month, String day ) {

        try {
            Integer yyyy = Integer.parseInt(year);
            Integer MM   = Integer.parseInt(month);
            Integer dd   = Integer.parseInt(day);
            // 월은 12월까지만 존재함..
            if (MM > 12) {
                return false;
            } 
            Integer MAX_DD = Const.EACH_DAYS_BY_MONTH[MM];
            // 2월이고 윤년이면 2월 날짜는 29일임 
            if ( MM == 2 && ValidChecker.isLeafYear(yyyy) ) {
                MAX_DD++;
            }

            // 해당 월의 최대날짜보다 큰 수가 들어오면 잘못된 입력.
            if (dd > MAX_DD) {
                return false;
            }
        } catch (NumberFormatException nfe) {
            return false;
        }

        return true;
    }
    
    // 윤년체크 
    public static boolean isLeafYear(Integer yyyy)
    {
        return yyyy % 4 == 0 && yyyy % 100 != 0 || yyyy % 400 == 0;
    }
    
    // sqlInjection pattern 확인  
    public static boolean isValidCorpSearchTxt(String source) {
        Pattern sqlInjectPattern = Pattern.compile(Const.SQL_INJECTION_WORD_PATTERN);
        Matcher sqlInjectMatcher = sqlInjectPattern.matcher(source);

        // TODO scyun CHECK.
        // 검색어 입력시에는 특수문자를 아예 배제해야하지 않을까???...
        Pattern pattern = Pattern.compile(Const.VALID_INPUT_FORM_TXT_PATTERN);
        Matcher matcher = pattern.matcher(source);
        return matcher.matches() && !sqlInjectMatcher.find();
    }
    
    public static boolean isValidInputFormTxt(String src) {
        Pattern inputFormPattern = Pattern.compile(Const.VALID_INPUT_FORM_TXT_PATTERN);
        Matcher m = inputFormPattern.matcher(src);
        return m.matches();
    }
    
}