package net.genieworks.api;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import net.genieworks.api.bean.ApiResultBean;
import net.genieworks.api.exception.LoginException;
import net.genieworks.api.exception.ValidCheckerException;
import net.genieworks.util.AuthMgntException;
import net.genieworks.util.MessageUtil;
import net.genieworks.util.ValidChecker;


/**
 * TODO scyun 
 * 
 * RequestUtil 의  isJsonRequest 를 이용해서 content negotiation 기능을 추가해야 하지 않을가???
 *
 */
@ControllerAdvice
public class ExceptionControllerAdvice {
	
	private Logger logger = LoggerFactory.getLogger(getClass());
    
    @Autowired
    private MessageUtil messageUtil;
    
    @ExceptionHandler(ValidCheckerException.class) 
    @ResponseBody
    public ResponseEntity<ApiResultBean<Void>> handleValidCheckerException(ValidCheckerException e) {

		ApiResultBean<Void> result = new ApiResultBean<>(e.getHttpStatus().value());
		result.setMessageCode(e.getErrorCode());
		if ( ValidChecker.isEmpty(e.getErrorMsg())) {
		    result.setMessageDesc(messageUtil.getMessage(e.getErrorCode()));
		} else {
            result.setMessageDesc(e.getErrorMsg());
		}
        return new ResponseEntity<>(result, e.getHttpStatus());
    }
    
    @ExceptionHandler(Exception.class)
    @ResponseBody
    public ResponseEntity<ApiResultBean<Void>> handleException(Exception e) {
        e.printStackTrace();
        ApiResultBean<Void> result = new ApiResultBean<>(ApiResultBean.INTERNAL_SERVER_ERROR);
        result.setMessageCode("error.500");
        result.setMessageDesc(messageUtil.getMessage("error.500"));
        return new ResponseEntity<>(result, HttpStatus.INTERNAL_SERVER_ERROR);
    }
    
    @ExceptionHandler(LoginException.class)
    public ResponseEntity<ApiResultBean<Void>> handleLoginException(LoginException le) {
		String authChkCode = le.getAuthChkCode();
        ApiResultBean<Void> result = new ApiResultBean<>(ApiResultBean.UNAUTHORIZED_ERROR);
        result.setMessageCode(authChkCode);
        result.setMessageDesc(messageUtil.getMessage("error." + authChkCode));
        return new ResponseEntity<>(result, HttpStatus.UNAUTHORIZED);
    }
    
    @ExceptionHandler(AuthMgntException.class)
    public ModelAndView handleAuthMgntException(AuthMgntException ame) {
        ModelAndView mav = new ModelAndView();
        if (Const.AUTH_NEED_LOGIN.equals(ame.getAuthChkCode())) {
            mav.setViewName("redirect:" + Const.AUTH_LOGIN_URL);
        } else {
            mav.setViewName("redirect:" + Const.COMMON_ERROR_URL);
        }
        return mav;
    }
    
}
