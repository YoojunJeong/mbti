package net.genieworks.util;

public class AuthMgntException extends RuntimeException {
    
    private String authType;
    private String authChkCode;
    
    public String getAuthChkCode()
    {
        return authChkCode;
    }

    public void setAuthChkCode(String authChkCode)
    {
        this.authChkCode = authChkCode;
    }

    

    public String getAuthType()
    {
        return authType;
    }

    public void setAuthType(String authType)
    {
        this.authType = authType;
    }
   
    public AuthMgntException(String authChkCode)
    {
        this.authChkCode = authChkCode;
    }
    
    public AuthMgntException(String authChkCode, String authType) {
        this.authChkCode = authChkCode;
        this.authType = authType;
    }
    
    public AuthMgntException(String authChkCode,String authType, Exception e) {
        super(e);
        this.authChkCode = authChkCode;
        this.authType = authType;
    }
    
}
