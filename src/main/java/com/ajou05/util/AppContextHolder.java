package com.ajou05.util;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Component;

@Component
public class AppContextHolder implements ApplicationContextAware {
    
    private static ApplicationContext ctx;
    
    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        ctx = applicationContext;
    }
    
    public static ApplicationContext getContext() 
    {
        return ctx;
    }
    
    public static Environment getEnv() 
    {
        return ctx.getBean(Environment.class);
    }

}
