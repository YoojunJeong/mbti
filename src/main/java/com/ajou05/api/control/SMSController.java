package com.ajou05.api.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ajou05.api.service.SMSService;
import com.ajou05.util.MessageUtil;
import com.ajou05.util.ValidChecker;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;

import com.ajou05.api.bean.ApiResultBean;

@RestController
public class SMSController {
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private Environment env;
	@Autowired
	private MessageUtil messageUtil;
	@Autowired
	private ObjectMapper objectMapper;

	@Autowired
	private SMSService smsService;
	

	//TODO kws 20170916 멀티파트 지원 필요...이미지 업로드 
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value="/{version}/message/sms", method=RequestMethod.POST)
	public ResponseEntity<ApiResultBean<String>> sendSMS(  @RequestHeader HttpHeaders headers
					                      , @PathVariable("version") String version
					                      , @RequestBody JSONObject body
					                      , HttpServletResponse response // response 객체를 직접 컨트롤 해야할까요?? , request, response 를 controller 에서 직접 컨트롤 하지 않는것이 단위테스트도 편하고 좋을거같은데..
					                      , HttpServletRequest request) throws Exception {

		// for logging
		String ipAddress = request.getHeader("X-FORWARDED-FOR");
		if (ipAddress == null) {
			ipAddress = request.getRemoteAddr();
		}
		logger.info("#==============================================");
		logger.info("# API URL : /{version}/message/sms - POST");
		logger.debug("## Connected IP : " + ipAddress );
		logger.info("## API PathVariable Value");
		logger.info("=== version : " + version);
		logger.info("## API RequestBody");
		logger.info("=== " + body.toString());
		
		
		// 현재 서비스 버전목록에 존재하지 않으면 지원하지 않는 버전입니다 return.
		String[] serviceVersion = env.getProperty("checker.api.version").split(",");
		ValidChecker.isInvalid( !ValidChecker.hasValue(serviceVersion , version)
		                      , HttpStatus.UPGRADE_REQUIRED
		                      , "error.426"
		                      , messageUtil.getMessage("error.426"));

        ValidChecker.isInvalid( !ValidChecker.isValidApiKeyHeader(headers.get("x-api-key"))
                              , HttpStatus.UNAUTHORIZED
                              , "x-api-key.header.required"
                              , messageUtil.getMessage("error.api.key.invalid"));
		
		// Default Success Result Set.
	    String successMessageKey = "200";
		ApiResultBean<String> result = new ApiResultBean<>(ApiResultBean.SUCCESS
		                                                , successMessageKey
		                                                , messageUtil.getMessage(successMessageKey));
        //---- Validation Start.. 
        Object send_phone = body.get("send_phone");
        Object recv_phone = body.get("recv_phone");
        Object subject = body.get("subject");
        Object content = body.get("content");
        
        //validation
        ValidChecker.isEmpty(HttpStatus.BAD_REQUEST, "send_phone.parameter.required" , this.messageUtil.getMessageWithArgumentKeys("parameter.required", "const.send.tel"),send_phone);
        ValidChecker.isEmpty(HttpStatus.BAD_REQUEST, "recv_phone.parameter.required" , this.messageUtil.getMessageWithArgumentKeys("parameter.required", "const.recv.tel"),recv_phone);
        ValidChecker.isEmpty(HttpStatus.BAD_REQUEST, "subject.parameter.required" , this.messageUtil.getMessageWithArgumentKeys("parameter.required", "const.title"),subject);
        ValidChecker.isEmpty(HttpStatus.BAD_REQUEST, "content.parameter.required" , this.messageUtil.getMessageWithArgumentKeys("parameter.required", "const.content"),content);
        
        this.smsService.sendSMS(send_phone.toString(), recv_phone.toString(), subject.toString(), content.toString() );
		
		return new ResponseEntity<>(result , HttpStatus.OK);
	}

}
