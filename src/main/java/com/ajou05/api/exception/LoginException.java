package com.ajou05.api.exception;

public class LoginException extends RuntimeException {

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

	public LoginException(String authChkCode)
	{
		this.authChkCode = authChkCode;
	}

	public LoginException(String authChkCode, String authType) {
		this.authChkCode = authChkCode;
		this.authType = authType;
	}

	public LoginException(String authChkCode, String authType, Exception e) {
		super(e);
		this.authChkCode = authChkCode;
		this.authType = authType;
	}
	
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("authChkCode:").append(this.authChkCode).append("authType:").append(this.authType);
		builder.append("\nExceptionMsg : " + super.getMessage());

		return builder.toString();
	}
}
