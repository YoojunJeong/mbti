package com.ajou05.util;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.junit4.SpringRunner;


@RunWith(SpringRunner.class)
@SpringBootTest
@ActiveProfiles(value = { "stg" })
public class TestMessageUtil {
    @Autowired
    private MessageUtil messageUtil;

    @Test
    public void testGetMessageWithKeys()
    {
        String message = messageUtil.getMessageWithArgumentKeys("parameter.required", "const.email");
        Assert.assertEquals("E-Mail을(를) 입력해주세요.", message);
    }
}
