package com.ajou05;

import com.ajou05.util.ObjectUtil;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;

@SpringBootApplication
public class BaseRootApplication {

    public static void main(String[] args) {
        String profile = System.getProperty("spring.profiles.active");
        // dev => 로컬 개발환경
        // stg => 장비 테스트환경
        // prd => 상용 
        if (profile == null) {
            System.setProperty("spring.profiles.active", "dev");
        }
        ConfigurableApplicationContext ctx = SpringApplication.run(BaseRootApplication.class, args);
        System.out.println(":: MBTI [" + ObjectUtil.join(ctx.getEnvironment().getActiveProfiles()) + "]Server ON");
    }
}
