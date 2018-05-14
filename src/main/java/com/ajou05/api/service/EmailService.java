package com.ajou05.api.service;

import javax.mail.MessagingException;

import com.ajou05.util.MailUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ajou05.api.bean.message.EmailMessageBean;
import com.ajou05.api.repository.CommonDao;

@Service
public class EmailService 
{
	@Autowired
	private MailUtil mailUtil;
	
	/**
	 * 메일발송.
	 * @param messageBean
	 * @throws MessagingException
	 */
	public void sendEmail(EmailMessageBean messageBean) throws MessagingException 
	{
		//기존에 디비와 연동하여 템블릿을 가져와서 구성하는 방식이 아니라하나 하나 세팅해서 보내기....
        mailUtil.send(messageBean);

	}
	
}
