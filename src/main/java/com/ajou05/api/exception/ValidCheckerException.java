package com.ajou05.api.exception;

import org.springframework.http.HttpStatus;

public class ValidCheckerException extends RuntimeException {

    private static final long serialVersionUID = -5475413193510008831L;
    
    private HttpStatus httpStatus;
    private String propertyName;
    private String errorCode;
    private String errorMsg;
    
    public ValidCheckerException(Exception e, HttpStatus httpStatus, String errorCode) {
        super(e);
        this.httpStatus   = httpStatus;
        this.errorCode    = errorCode;
    }
    
    public ValidCheckerException(HttpStatus httpStatus,String errorCode, String errorMsg) {
        this.httpStatus   = httpStatus;
        this.errorCode    = errorCode;
        this.errorMsg     = errorMsg;
    }
    
    public HttpStatus getHttpStatus()
    {
        return httpStatus;
    }
    public void setHttpStatus(HttpStatus httpStatus)
    {
        this.httpStatus = httpStatus;
    }
    public String getErrorMsg()
    {
        return errorMsg;
    }
    public void setErrorMsg(String errorMsg)
    {
        this.errorMsg = errorMsg;
    }

    public String getPropertyName()
    {
        return propertyName;
    }

    public void setPropertyName(String propertyName)
    {
        this.propertyName = propertyName;
    }

    public String getErrorCode()
    {
        return errorCode;
    }

    public void setErrorCode(String errorCode)
    {
        this.errorCode = errorCode;
    }
}
