package com.ajou05.api.control;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.setup.MockMvcBuilders.standaloneSetup;

import java.util.HashMap;
import java.util.Map;

import com.ajou05.api.Const;
import com.ajou05.api.ExceptionControllerAdvice;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;

import com.fasterxml.jackson.databind.ObjectMapper;

import com.ajou05.api.interceptor.DefaultInterceptor;

@RunWith(SpringRunner.class)
@SpringBootTest
@ActiveProfiles(value = { "dev" })
public class TestSMSControl
{
     private MockMvc mockMvc;

    @Autowired
    private SMSControl smsControl;
    
    @Autowired
    private DefaultInterceptor defaultInterceptor;
    
    @Autowired
    private ExceptionControllerAdvice exceptionControllerAdvice;

    @Autowired
    private ObjectMapper objectMapper;

    @Before
    public void setup() {
        this.mockMvc = standaloneSetup(smsControl)
                .setControllerAdvice(exceptionControllerAdvice)
                .addInterceptors(defaultInterceptor)
                .build();
    }
   
    
    @Test
    public void autoWiredTest ()
    {
        Assert.assertNotNull(exceptionControllerAdvice);
    }
    
    @Test
    public void testSendSms_sendPhoneIsNull_shouldBadRequest() {

        try {
            Map<String, String> reqBody = new HashMap<>();
//            reqBody.put("send_phone", "18001011");
            reqBody.put("recv_phone", "01068031993");
            reqBody.put("subject", "SUBJECT");
            reqBody.put("content", "CONTENT");
            
            this.mockMvc
                    .perform(post("/1.0/message/sms").contentType(MediaType.APPLICATION_JSON_UTF8)
                            .header(Const.X_API_KEY , Const.X_API_KEY_VALUE)
                            .content(objectMapper.writeValueAsString(reqBody)))
                    .andDo(print());
        } catch (Exception e) {
            e.printStackTrace();
            Assert.fail();
        }
        
    }

}
