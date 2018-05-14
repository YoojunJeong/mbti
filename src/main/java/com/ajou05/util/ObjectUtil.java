package com.ajou05.util;

import com.ajou05.api.Const;
import com.ajou05.api.exception.ValidCheckerException;
import org.springframework.http.HttpStatus;

public class ObjectUtil {
    /**
     * @param src  변환대상 
     * @param defaultValue 변환과정중 에러발생시 사용할 기본값 
     * @return
     */
    public static Integer parseInt(Object src, Integer defaultValue) {
        if (ValidChecker.isEmpty(src))
            return defaultValue;
        Integer result = defaultValue;
        try 
        {
            result = Integer.parseInt(src.toString());
        }
        catch (NumberFormatException nfe) {}
        return result;
    }
    
    /**
     * 
     * @param src  변환대상 
     * @param defaultValue : null, 또는 공백문자열일경우 사용할 기본값.
     * @param httpStatus  : 숫자변환중 에러발생시 사용할 http에러 상태코드 
     * @param messageCode  :  클라이언트에 전달할 messageCode,
     * @param messageDesc  :  messageCode 에 대한 설명.
     * @return
     */
    public static Integer parseInt(Object src, Integer defaultValue, HttpStatus httpStatus, String messageCode, String messageDesc) {
        if (ValidChecker.isEmpty(src))
            return defaultValue;
        Integer result = defaultValue;
        try {
            result = Integer.parseInt(src.toString());
        } catch (NumberFormatException nfe) {
            throw new ValidCheckerException(httpStatus, messageCode, messageDesc);
        }
        return result;
    }
    
    /**
     * @param src  변환대상 
     * @param defaultValue src가 null 이거나 공백 문자열일경우 사용할 기본값 
     * @return
     */
    public static String parseString(Object src, String defaultValue) {

        if (ValidChecker.isEmpty(src))
            return defaultValue;
        return src.toString();
    }
    
    /**
     * 배열을 합친다.
     * @param array : 합칠 배열
     * @return
     */
    public static <T> String join(T[] array)
    {
        return join(array, Const.COMMA );
    }
    
    /**
     * 배열을 합친다.
     * @param array : 합칠 배열. 
     * @param delim : 구분자 
     * @return
     */
    public static <T> String join(T[] array, String delim) {

        if (ValidChecker.isEmptyArray(array)) {
            return Const.EMPTY_STRING;
        }

        StringBuilder builder = new StringBuilder();
        
        for(T t : array) {
            builder.append(t.toString()).append(delim);
        }
        
        return builder.substring(0, builder.length() - 1);
        
    }
    
}
