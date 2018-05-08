package com.ajou05.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.net.URLEncoder;
import java.util.Enumeration;

public class RequestUtil {
    
    private static final Logger logger = LoggerFactory.getLogger(RequestUtil.class);
    
    public static String getRemoteIp() {

        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        // for logging 
        String ipAddress = request.getHeader("X-FORWARDED-FOR");
        if (ipAddress == null) {
            ipAddress = request.getRemoteAddr();
        }

        return ipAddress;
    }
    
    public static boolean isApplicationJsonRequest() {
        
        boolean isJsonRequest = false;

        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        Enumeration<String>  accepts = request.getHeaders("Accept");

        while(accepts.hasMoreElements()) {

            String accept = accepts.nextElement();
            if (accept.indexOf("json") != -1  || accept.indexOf("javascript") != -1) {
                isJsonRequest = true;
                break;
            }
        }
        
        return isJsonRequest;
    }
    
    public static String getHost() {

        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        String host = request.getHeader("host");
        if (host.lastIndexOf(":") > 0 ) {
            host = host.substring(0,host.lastIndexOf(":"));
        }
        return host;
    }
    
    public static HttpSession popSession() {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        return request.getSession() ;
    }
    
    public static String getBrowser() {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        
        String header =request.getHeader("User-Agent");
        logger.debug("#-- UserAgent={}", header);
        if (header.contains("Edge") || header.contains("MSIE") || header.contains("Trident")) {
               return "MSIE";
        } else if(header.contains("Chrome")) {
               return "Chrome";
        } else if(header.contains("Opera")) {
               return "Opera";
        }

        return "Firefox";
    }
    
    public static String changeFileNameForDownload(String fileName) {
        
        String browser = getBrowser();
        logger.debug("#-- browser={}", browser);
        String docName = fileName;
        try {
            if (browser.contains("MSIE")) {
                logger.debug("#-- match IE ");
                docName = URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", "%20");
            } else if (browser.contains("Firefox")) {
                logger.debug("#-- match Firefox ");
                docName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
            } else if (browser.contains("Opera")) {
                logger.debug("#-- match Opera ");
                docName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
            } else if (browser.contains("Chrome")) {
                logger.debug("#-- match Chrome ");
                docName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
            }
        } catch(Exception e) {
            logger.warn("Filename change is fail..{}", e.getMessage());
        }
        
        return docName;
        
    }

}
