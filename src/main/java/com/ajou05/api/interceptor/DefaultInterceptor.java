package com.ajou05.api.interceptor;

import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ajou05.util.MessageUtil;
import com.ajou05.util.ValidChecker;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.http.HttpStatus;
import org.springframework.web.servlet.AsyncHandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.ajou05.api.exception.ValidCheckerException;

public class DefaultInterceptor implements AsyncHandlerInterceptor {
    
    private Logger logger = LoggerFactory.getLogger(getClass());
    
    @Autowired
    private Environment env;
    
    @Autowired
    private MessageUtil messageUtil;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        // 1. request header 에 x-api-key 헤더가 존재하고 해당 헤더값이 valid한지 확인한다.
        logger.info("#== Interceptor (preHandle)============================================");
		
        // prd 환경에서만 체크한다.
		if (ValidChecker.hasValue(env.getActiveProfiles(), "prd")) {
            String apiKey = request.getHeader("x-api-key");
            // 여기서 controller 처리전 확인처리 수행합니다.
            logger.info("#=== headerCheck [name=x-api-key]", apiKey );
            if (ValidChecker.isEmpty(apiKey)) {
                throw new ValidCheckerException(HttpStatus.UNAUTHORIZED
                                               ,"x-api-key.header.required"
                                               ,messageUtil.getMessage("error.api.key.invalid"));
            }
		} else {
            logger.info("#=== ignore headerCheck [activeProfile : {}]", Arrays.toString(env.getActiveProfiles()));
		}
		
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        logger.info("do postHandle");
        // controller 수행 후 view 생성전 수행됩니다. 
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        // TODO Auto-generated method stub
        logger.info("do afterCompletion");
        
    }

    @Override
    public void afterConcurrentHandlingStarted(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // WebAsyncTask 사용시에만 수행됩니다.
        // ParkingON API 프로젝트에서는 사용되지 않습니다.
        throw new UnsupportedOperationException();
    }

}
