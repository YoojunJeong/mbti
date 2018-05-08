package com.ajou05.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

public class StringUtil {

    public static byte[] sha256(String input) throws NoSuchAlgorithmException {
        MessageDigest mDigest = MessageDigest.getInstance("SHA-256");
        byte[] result = mDigest.digest(input.getBytes());
        return result;
    }

// 아래 php5의 $base64encoded 와 같은결과를 return 합니다.
// <?php
//     $input = 'apple256';
//     $hashed = hash('sha256', $input, true);
//     $base64encoded = base64_encode( $hashed );
// ?> 
    public static String sha256Base64Encoded(String input) throws NoSuchAlgorithmException {
        byte[] sha256Data = sha256(input);
        return Base64.getEncoder().encodeToString(sha256Data);
    }
    
    public static Boolean isDev() {

        boolean rtnBln = false;
        String profile = System.getProperty("spring.profiles.active");
        // dev => 로컬 개발환경
        // stg => 장비 테스트환경
        // prd => 상용 
        if (profile == null || "dev-noverify".equals(profile)|| "dev".equals(profile) || "stg".equals(profile)) {
            rtnBln = true;
        }

        return rtnBln;
    }
}
