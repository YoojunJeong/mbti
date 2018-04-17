package net.genieworks.api.bean;

public class ApiResultBean<BODY> {
    
    public static final String SUCCESS_MSG_KEY = "200";
    
    // 응답에 대한 상태코드 정의 
    public static final Integer SUCCESS = 200;
    public static final Integer BAD_REQUEST = 400;
    public static final Integer VALID_CHECK_ERROR = 400;
    public static final Integer UNAUTHORIZED_ERROR = 401;
    public static final Integer INTERNAL_SERVER_ERROR = 500;
	
	// 요청에 대한 상태코드.
	private Integer status = ApiResultBean.SUCCESS;
	private String  messageCode = null;
	private String  messageDesc = null;
	
	// 요청 성공/실패에 대한 추가 정보.
	private BODY body;

	// 생성자
	public ApiResultBean() 
	{
	    this(ApiResultBean.SUCCESS);
	}
	public ApiResultBean(Integer status) 
	{
	    this(status, null, null);
	}
	public ApiResultBean(Integer status, String messageCode)
	{
	    this(status, messageCode, null);
	}
	public ApiResultBean(Integer status, String messageCode, String messageDesc) {
	    this.status = status;
	    this.messageCode = messageCode;
	    this.messageDesc = messageDesc;
	}

	public String getMessageCode() 
	{
		return messageCode;
	}

	public void setMessageCode(String messageCode) 
	{
		this.messageCode = messageCode;
	}

	public String getMessageDesc() 
	{
		return messageDesc;
	}

	public void setMessageDesc(String messageDesc) 
	{
		this.messageDesc = messageDesc;
	}


	public BODY getBody() 
	{
		return body;
	}

	public void setBody(BODY body) 
	{
		this.body = body;
	}

    public Integer getStatus()
    {
        return status;
    }

    public void setStatus(Integer status)
    {
        this.status = status;
    }


}
