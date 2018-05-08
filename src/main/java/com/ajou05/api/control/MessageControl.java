package com.ajou05.api.control;

import com.ajou05.api.Const;
import com.ajou05.api.service.EmailService;
import com.ajou05.util.MessageUtil;
import com.ajou05.util.ValidChecker;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ajou05.api.bean.ApiResultBean;
import com.ajou05.api.bean.message.EmailMessageBean;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;

@RestController
public class MessageControl {
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private Environment env;
	
	@Autowired
	private EmailService emailService;
	
	@Autowired
	private MessageUtil messageUtil;
	
	@Autowired
	private ObjectMapper objectMapper;

	
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value="/{version}/message/email/{templateName}", method=RequestMethod.POST)
	public ResponseEntity<ApiResultBean<String>> sendEmail(  
                                            @RequestHeader HttpHeaders headers
					                      , @PathVariable("version") String version
					                //      , @PathVariable("templateName")  EmailTemplateEnum templateName
					                      , @RequestBody JSONObject body
					                      , HttpServletRequest request) throws Exception {

		// for logging
		String ipAddress = request.getHeader("X-FORWARDED-FOR");
		if (ipAddress == null)
		{
			ipAddress = request.getRemoteAddr();
		}
		logger.info("#==============================================");
		logger.info("# API URL : /{version}/message/email/{templateId} - POST");
		logger.debug("## Connected IP : " + ipAddress );
		logger.info("## API PathVariable Value");
		logger.info("=== version : " + version);
//		logger.info("=== templateName : " + templateName);
		logger.info("## API RequestBody");
		logger.info("=== " + body.toString());
		

		// 현재 서비스 버전목록에 존재하지 않으면 지원하지 않는 버전입니다 return.
		String[] serviceVersion = env.getProperty("checker.api.version").split(",");
		ValidChecker.isInvalid( !ValidChecker.isValidApiKeyHeader(headers.get(Const.X_API_KEY)) , HttpStatus.UNAUTHORIZED , Const.X_API_KEY + "header.required" , messageUtil.getMessage("error.api.key.invalid"));
		ValidChecker.isInvalid( !ValidChecker.hasValue(serviceVersion , version) , HttpStatus.UPGRADE_REQUIRED , "error.426" , messageUtil.getMessage("error.426")); 
		
		ApiResultBean<String> result = new ApiResultBean<>(ApiResultBean.SUCCESS
		                                                , ApiResultBean.SUCCESS_MSG_KEY 
		                                                , messageUtil.getMessage(ApiResultBean.SUCCESS_MSG_KEY));

		try {
		    //---- Validation Start.. 
            Object corpName = body.get("corpName");
            Object corpSerial = body.get("corpSerial");
            Object name = body.get("name");
            Object tel = body.get("tel");
            Object email = body.get("email");
            Object title = body.get("title");
            Object content = body.get("content");

            // ~~ Required Parameter Validation
            ValidChecker.isEmpty(HttpStatus.BAD_REQUEST, "corpName.parameter.required", this.messageUtil.getMessageWithArgumentKeys("parameter.required", "const.corpName"),corpName);
            ValidChecker.isEmpty(HttpStatus.BAD_REQUEST, "corpSerial.parameter.required", this.messageUtil.getMessageWithArgumentKeys("parameter.required", "const.corpSerial"),corpSerial);
            ValidChecker.isEmpty(HttpStatus.BAD_REQUEST, "name.parameter.required", this.messageUtil.getMessageWithArgumentKeys("parameter.required", "const.name"), name);
            ValidChecker.isEmpty(HttpStatus.BAD_REQUEST, "tel.parameter.required", this.messageUtil.getMessageWithArgumentKeys("parameter.required", "const.tel"), tel);
            ValidChecker.isEmpty(HttpStatus.BAD_REQUEST, "email.parameter.required", this.messageUtil.getMessageWithArgumentKeys("parameter.required", "const.email"), email);
            ValidChecker.isEmpty(HttpStatus.BAD_REQUEST, "title.parameter.required", this.messageUtil.getMessageWithArgumentKeys("parameter.required", "const.title"), title);
            ValidChecker.isEmpty(HttpStatus.BAD_REQUEST, "content.parameter.required", this.messageUtil.getMessageWithArgumentKeys("parameter.required", "const.content"), content);

            ValidChecker.isInvalid(!ValidChecker.isValidCorpSerial(corpSerial.toString()), HttpStatus.BAD_REQUEST , "corpSerial.parameter.invalid", this.messageUtil.getMessageWithArgumentKeys("parameter.invalid", "const.corpSerial"));
            ValidChecker.isInvalid(!ValidChecker.isValidEmail(email.toString()), HttpStatus.BAD_REQUEST , "email.parameter.invalid", this.messageUtil.getMessageWithArgumentKeys("parameter.invalid", "const.email"));
            ValidChecker.isInvalid(corpName.toString().length() > 100 , HttpStatus.BAD_REQUEST, "corpName.parameter.length.exceed", this.messageUtil.getMessageWithArgumentKeys("parameter.length.exceed","const.corpName", "const.length.100" ));
            ValidChecker.isInvalid(name.toString().length() > 50, HttpStatus.BAD_REQUEST, "name.parameter.length.exceed", this.messageUtil.getMessageWithArgumentKeys("parameter.length.exceed","const.name", "const.length.50" ));
            ValidChecker.isInvalid(title.toString().length() > 50, HttpStatus.BAD_REQUEST, "title.parameter.length.exceed", this.messageUtil.getMessageWithArgumentKeys("parameter.length.exceed","const.title", "const.length.50" ));
            ValidChecker.isInvalid(content.toString().length() > 10000, HttpStatus.BAD_REQUEST, "content.parameter.length.exceed", this.messageUtil.getMessageWithArgumentKeys("parameter.length.exceed","const.content", "const.length.10000" ));

            //보내고 싶은 메일 내용및받는 사람 세팅 필요 
			EmailMessageBean emailMessageBean = new EmailMessageBean();;

			// 실제로 발송...
			this.emailService.sendEmail(emailMessageBean);

		} catch (MessagingException me) {
			result.setStatus(HttpStatus.INTERNAL_SERVER_ERROR.value());
			result.setMessageCode("error.500");
			result.setMessageDesc(messageUtil.getMessage("error.500"));
			return new ResponseEntity<>(result, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return new ResponseEntity<>(result , HttpStatus.OK);
	}

}
