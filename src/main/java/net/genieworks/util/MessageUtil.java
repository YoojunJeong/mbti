package net.genieworks.util;

import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Locale;

public class MessageUtil {

    private MessageSourceAccessor messageSourceAccessor;

    public MessageUtil(MessageSourceAccessor messageSourceAccessor) {
        this.messageSourceAccessor = messageSourceAccessor;
    }

    public void setMessageSourceAccessor(MessageSourceAccessor messageSourceAccessor) {
        this.messageSourceAccessor = messageSourceAccessor;
    }

    public String getMessage(String key) {
        HttpServletRequest httpRequest = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        return this.messageSourceAccessor.getMessage(key, httpRequest.getLocale());
    }

    public String getMessage(String key, String defaultMessage) {
        HttpServletRequest httpRequest = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        return this.messageSourceAccessor.getMessage(key, defaultMessage, httpRequest.getLocale());
    }

    public String getMessage(String key, Object... args) {
        HttpServletRequest httpRequest = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        return this.messageSourceAccessor.getMessage(key, args, httpRequest.getLocale());
    }

    public String getMessageWithArgumentKeys(String key, String... keys) {
        HttpServletRequest httpRequest = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        Locale locale = httpRequest.getLocale();
        
        String[] args = new String[keys.length];
        for (int i=0;i < keys.length;++i ) {
            String _key = keys[i];
            args[i] = this.messageSourceAccessor.getMessage(_key, locale);
        }
        return this.messageSourceAccessor.getMessage(key, args , locale);
    }
}
