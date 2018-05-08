package com.ajou05.api;

import java.util.HashMap;
import java.util.LinkedHashMap;

public interface Const {

    public static final String EMPTY_STRING = "";
    public static final String EMPTY_DATETIME = "0000-00-00 00:00:00";
    public static final String NULL_STRING = "NULL";
    public static final String COMMA = ",";
    public static final String ASTERISK = "*";
    
    public static final String CONTRACT_TYPE_NORMAL = "1"; // 계약구분 : 일반 
    public static final String CONTRACT_TYPE_BLUEMEMBERS = "2";// 계약구분 : 블루멤버스.
    
    public static final String SERVICE_STATUS_USING = "0";
    public static final String SERVICE_STATUS_DONE  = "1";
    
    @SuppressWarnings("serial")
    public static final LinkedHashMap<String, String> bankCodeMap = new LinkedHashMap<String, String>()
    {{
        put("bank.cd.01","01"); //    /*국민은행*/
        put("bank.cd.02","02"); //    /*신한은행*/
        put("bank.cd.03","03"); //    /*우리은행*/
        put("bank.cd.04","04"); //    /*한미은행*/
        put("bank.cd.05","05"); //    /*시티은행*/
        put("bank.cd.06","06"); //    /*조흥은행*/
        put("bank.cd.07","07"); //    /*제일은행*/
        put("bank.cd.08","08"); //    /*하나은행*/
        put("bank.cd.09","09"); //    /*외환은행*/
        put("bank.cd.10","10"); //    /*부산은행*/
        put("bank.cd.11","11"); //    /*광주은행*/
        put("bank.cd.12","12"); //    /*경남은행*/
        put("bank.cd.13","13"); //    /*전북은행*/
        put("bank.cd.14","14"); //    /*대구은행*/
        put("bank.cd.15","15"); //    /*제주은행*/
        put("bank.cd.16","16"); //    /*기업은행*/
        put("bank.cd.17","17"); //    /*농협은행*/
        put("bank.cd.18","18"); //    /*수협은행*/
        put("bank.cd.19","19"); //    /*우체국*/
    }};
    
	// The Constant DATE_FORMAT.
	public static final String DATE_FORMAT = "yyyy-MM-dd HH:mm:ss";
	public static final String MYSQL_DATE_FORMAT = "yyyy-MM-dd HH:mm:ss";
	public static final String DATE_FORMAT_yyyyMMddWithHipen = "yyyy-MM-dd";
    
    public static final String EMAIL_PATTERN = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
//    public static final String EMAIL_PATTERN = "[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\\.[_0-9a-zA-Z-]+){1,2}$";
    
    public static final String ID_PATTERN = "^[a-zA-z0-9\\(\\)\\_\\-\\.,&#@]{2,20}$";
                                        //       ;
    public static final String TEL_PATTERN = "^(01[016789]{1}|070|02|0[3-9]{1}[0-9]{1})-[0-9]{3,4}-[0-9]{4}$";

	// 메세지 발송 방법  (SMS, EMAIL) 
	public static final String SMS = "sms";
	public static final String EMAIL = "email";
	
	// SKT AOA SMS 타입별 전달 구분자값 
	public static final String SMS_TYPE_AOA_VALUE = "S"; // SMS 
	public static final String LMS_TYPE_AOA_VALUE = "L"; // LMS
	public static final String MMS_TYPE_AOA_VALUE = "M"; // MMS
	
	
	public static final String X_API_KEY_VALUE = "SpammerGoHome";
	public static final String X_API_KEY = "x-api-key";
	
	public static final Integer[] EACH_DAYS_BY_MONTH = new Integer[]{-1, 31, 28, 31, 30, 31, 30, 31 , 31, 30, 31, 30, 31};
	
//	public static final String VALID_SEARCH_TXT_PATTERN ="^[a-zA-Z0-9ㄱ-ㅎ가-힣ㅏ-ㅣ]*$"; 
	public static final String VALID_INPUT_FORM_TXT_PATTERN ="^[\\x20\\f\\r\\n\\t\\(\\)_\\-\\.,&#@a-zA-Z0-9ㄱ-ㅎ가-힣ㅏ-ㅣ]*$"; 

	public static final String SQL_INJECTION_WORD_PATTERN = "(union|select|from|where)";
	
	public static final String SEQUENCE_KEY = "___SELECT_KEY___";
	 
	
	public static final String AUTH_USER_PROFILE_KEY = "___AUTH_USER_PROFILE_KEY___";
	public static final String LOGIN_ERROR_MSG_KEY = "___LOGIN_ERROR_MSG_KEY___";
	public static final String AUTH_LOGIN_URL = "/auth/login";
	public static final String COMMON_ERROR_URL = "/error";
            
	public static final String USERNAME_REQUIRED = "username.required";
	public static final String PASSWORD_REQUIRED = "pwd.required";
	public static final String AUTH_USER_NOT_FOUND = "user.not.found";
	public static final String AUTH_USER_PWD_MISMATCH = "pwd.mismatch";
	public static final String AUTH_NEED_LOGIN = "need.login";

	//현대 블루 멤버스 포인트 연동 관련 
	public static final String POINT_SEARCH 	= "05"; //포인트 조회 
	public static final String POINT_USE 	= "04"; //포인트 사용 
	public static final String POINT_SAVE 	= "03"; //포인트 적립 
	public static final String POINT_APPROVAL = "0200"; //전문 구분에 승인 
	public static final String POINT_CALCEL 	 = "0420"; //전문 구분에 취소
	
	
	public static final String POINT_PROCESS_SUCESS = "0";
	public static final String POINT_PROCESS_FAILE = "1";


	public static final String PUSH_NORMAL = "503";
	public static final String PUSH_VALET = "132";
	
	public static final Integer TRUE = 1;
	public static final Integer FALSE = 0;
}



