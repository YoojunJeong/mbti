package com.ajou05.util;

import static org.junit.Assert.fail;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.junit4.SpringRunner;


@RunWith(SpringRunner.class)
@SpringBootTest
@ActiveProfiles(value = { "prd" })
public class TestExcelWriter {

    @Test
    public void test()
    {
        fail("Not yet implemented");
    }

}
