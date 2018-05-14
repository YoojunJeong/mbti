package com.ajou05.api.bean;

import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlProperty;

public class SMSResult {
	String code;
	String code_msg;
	String error_code;
	String remain;
	String unique;
	String send_key;
	@JacksonXmlProperty(isAttribute = false)
	String msgkey;
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getCode_msg() {
		return code_msg;
	}
	public void setCode_msg(String code_msg) {
		this.code_msg = code_msg;
	}
	public String getError_code() {
		return error_code;
	}
	public void setError_code(String error_code) {
		this.error_code = error_code;
	}
	public String getRemain() {
		return remain;
	}
	public void setRemain(String remain) {
		this.remain = remain;
	}
	public String getUnique() {
		return unique;
	}
	public void setUnique(String unique) {
		this.unique = unique;
	}
	public String getSend_key() {
		return send_key;
	}
	public void setSend_key(String send_key) {
		this.send_key = send_key;
	}
	@Override
	public String toString() {
		return "result [code=" + code + ", code_msg=" + code_msg + ", error_code=" + error_code + ", remain=" + remain
				+ ", unique=" + unique + ", send_key=" + send_key + ", msgkey=" + msgkey + "]";
	}

}
