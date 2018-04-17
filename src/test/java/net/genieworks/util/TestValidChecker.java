package net.genieworks.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.junit.Assert;
import org.junit.Test;

import net.genieworks.api.Const;

public class TestValidChecker {

    @Test
    public void testEmailPattern() {

        String[] validEmails = new String[] { "firstname.lastname@domain.com", "email@subdomain.domain.com", "firstname+lastname@domain.com",
                "1234567890@domain.com", "email@domain-one.com", "_______@domain.com", "email@domain.name",
                "email@domain.co.jp", "firstname-lastname@domain.com" };

        String[] invalidEmails = new String[] { "plainaddress", "\"email\"@domain.com", "#@%^%#$@#$@#.com", "@domain.com", "Joe Smith <email@domain.com>",
                "email.domain.com", "email@domain@domain.com", ".email@domain.com", "mail.@domain.com",
                "email..email@domain.com", "あいうえお@domain.com", "email@domain.com (Joe Smith)", "email@123.123.123.123",
                "email@[123.123.123.123]", "email@domain", "email@111.222.333.44444", "email@domain..com" };

        for (String email : validEmails) {
            Assert.assertTrue(ValidChecker.isValidEmail(email));
        }

        for (String email : invalidEmails) {
            Assert.assertFalse(ValidChecker.isValidEmail(email));
        }

    }
    
    @Test
    public void testPhoneNumber() {
        
        String[] validPhoneNumbers = new String[] {"010-6803-1993","080-3993-2122", "02-939-9499","031-0993-9494","018-0930-0399","019-9389-0494", "080-2222-1111"};
        String[] invalidPhoneNumbers = new String[] {"010999394949", "02-9020-09000","tel-phonenumber"};
        
        for (String phoneNumber : validPhoneNumbers) {
            Assert.assertTrue(ValidChecker.isValidPhoneNumber(phoneNumber));
        }

        for (String phoneNumber : invalidPhoneNumbers) {
            Assert.assertFalse(ValidChecker.isValidPhoneNumber(phoneNumber));
        }
        
    }

    
    @Test
    public void testCorpSerial() {
        Assert.assertTrue(ValidChecker.isValidCorpSerial("551-88-00073"));
        Assert.assertFalse(ValidChecker.isValidCorpSerial("111-11-11111"));
    }
    
    
    @Test
    public void testValidInputFormPattern() {
        
        String[] validTxts = new String[] {" \t\r\n ", "abced" ,"1230123" ,"1210sd" ,"무궁화-_-" ,"무궁화 무궁화 " , "ㅑ","무궁(화 무궁화 " ,"무궁화 무)궁화 " ,"무궁화 무(궁)화 "  };
        String[] invalidTxts = new String[] {"+ \t\r\n ", "\\*abced" ,"\\^1230123" ,"%1210sd" ,"$무궁화-_-" ,"!무궁화 무궁화 " , "!@#$!@$#!@#$ㅑ" };

        Pattern inputFormPattern = Pattern.compile(Const.VALID_INPUT_FORM_TXT_PATTERN);
        for (String validTxt : validTxts) {
            Matcher m = inputFormPattern.matcher(validTxt);
            Assert.assertTrue(m.matches());
        }
        
        for (String invalidTxt : invalidTxts) {
            Matcher m = inputFormPattern.matcher(invalidTxt);
            Assert.assertTrue(m.matches() == false);
        }
    }
}
