package net.genieworks.util;

import net.genieworks.api.bean.message.EmailMessageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

@Component
public class MailUtil {
     
	@Autowired
	private JavaMailSender mailSender;
    
    public void send(EmailMessageBean emailMessage) throws MessagingException {
        
		MimeMessage mimeMessage = mailSender.createMimeMessage();

		MimeMessageHelper helper = new MimeMessageHelper(mimeMessage);
		helper.setFrom(emailMessage.getFrom());
		helper.setTo(emailMessage.getTo());
		
		if (! ValidChecker.isEmptyArray(emailMessage.getCc())) {
            helper.setCc(emailMessage.getCc());
		}
		if (! ValidChecker.isEmptyArray(emailMessage.getBcc())) {
            helper.setBcc(emailMessage.getBcc());
		}
		
		helper.setSubject(emailMessage.getSubject());
		helper.setText(emailMessage.getContent(), true);
//		this.mailSender.send(mimeMessage);
    }

}
