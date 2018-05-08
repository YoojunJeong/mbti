package com.ajou05.api.service;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.nio.ByteBuffer;
import java.nio.charset.Charset;
import java.util.Base64;
import java.util.UUID;

import com.ajou05.util.ValidChecker;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.amazonaws.util.StringUtils;
import com.fasterxml.jackson.dataformat.xml.XmlMapper;

import com.ajou05.api.bean.SMSResult;


@Service
public class SMSService 
{
	@Autowired
	private Environment env;
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	/**
	 * Send SMS.
	 * @param recv_phone,send_phone,title,content
	 * @throws MessagingException
	 */
	public SMSResult sendSMS(String send_phone , String recv_phone, String title, String content)  
	{
		//TODO kws 20170916 sms and lms 차이를 content 의 길이로 분기 해야하나???? 
	    // getByte로 길이 구할경우 utf-8 에서는 2~4byte 사이로 한글이 가변길이이므로
	    // euc-kr 로 인코딩 된 byte 배열을 가지고 길이를 구해야 한다. 
        Charset euckrCharset = Charset.forName("euc-kr");
        ByteBuffer byteBuffer = euckrCharset.encode(content);    
	    String gubun = byteBuffer.remaining() > 80 ? "L" : "S";
	    
	    byte[] _byteContent = new byte[byteBuffer.remaining()];
	    byteBuffer.get(_byteContent);
	    
	    String _title = this.toEucKrAndBase64String(title);
	    String _content = this.base64EncodeString(_byteContent);

		return sms(gubun,send_phone,recv_phone,_title,_content,null);
	}

	public SMSResult sendSMS(String send_phone , String recv_phone, String title, String content,String file_path)  
	{
	    String _title = this.toEucKrAndBase64String(title);
	    String _content = this.toEucKrAndBase64String(content);
		return sms("M",send_phone,recv_phone,_title,_content,file_path);
	}
	
	/**
	 * 
	 * @param gubun
	 * @param send_phone
	 * @param recv_phone
	 * @param subject  BASE64Encoding 된 문자열을 전달해야 함.
	 * @param txt      BASE64Encoding 된 문자열을 전달해야 함.
	 * @param file_path
	 * @return
	 */
	private SMSResult sms(String gubun, String send_phone, String recv_phone, String subject, String txt, String file_path)
	{

//	    boolean isPrd = false; // ValidChecker.<String>hasValue(env.getActiveProfiles(), "prd");
//	    String id = "genieworks";// env.getProperty("sms.id").toString();
//	    String pwd = "QKfJ5YuA4y6M";//env.getProperty("sms.pwd").toString();

	    boolean isPrd = ValidChecker.<String>hasValue(env.getActiveProfiles(), "prd");
	    String id = env.getProperty("sms.id").toString();
	    String pwd = env.getProperty("sms.pwd").toString();
	    
		MultiValueMap<String, Object> valueMap = new LinkedMultiValueMap<>();
		valueMap.add("id", id);
		valueMap.add("pwd", pwd);
		valueMap.add("gubun", gubun);
		valueMap.add("send_phone", send_phone);
		//prd 가 아닐경우 윤희한에게 문자메세지 발송. 
//		valueMap.add("recv_phone", isPrd ? recv_phone : "01068031993");
		valueMap.add("recv_phone", isPrd ? recv_phone : "01053347385");
		valueMap.add("subject", subject );
		valueMap.add("txt", txt);
		valueMap.add("returntype", "XML");//TODO kws 20170916 다른 형식으로 꼭 받아야 하나?...xml 로 받는게 맘에 안듬... 
		valueMap.add("send_key", UUID.randomUUID().toString());

		InputStream imageIs = null;
		ByteArrayOutputStream baos = null;
		byte[] buf = new byte[1024 * 32]; // 32k read buffer
		int len = -1;

		try 
		{
			if (!ValidChecker.isEmpty(file_path)) 
			{
				URL url = new URL(file_path);
				imageIs = url.openStream();

				BufferedInputStream bis = new BufferedInputStream(imageIs);
				baos = new ByteArrayOutputStream();

				while(( len = bis.read(buf) ) >= 0) {
					baos.write(buf , 0 , len);
				}
				baos.flush();

				byte[] file = baos.toByteArray();

				ByteArrayResource bar = new ByteArrayResource(baos.toByteArray()){
					public String getFilename(){
						return "MMS_FILE";
					}
				};
				valueMap.add("file", bar);
			}
		}
		catch (IOException ioe) 
		{
			logger.warn("이미지 로딩에 실패했습니다. url=["+ file_path +"] SMS 또는 LMS 로 발송됩니다.");
		}
		finally
		{
			if (baos != null) 
			{
				try 
				{
					baos.close();
					baos = null; 
				}
				catch (Exception e) {}
			}

			if (imageIs != null) 
			{
				try 
				{
					imageIs.close();
					imageIs = null;
				} catch (Exception e) {}
			}
		}
	    RestTemplate restTemplate = new RestTemplate();
		String resString = restTemplate.postForObject("http://aoa.sktelecom.com/newmms/ext_message.html", valueMap, String.class);
		SMSResult result = new SMSResult();
		result.setCode("9999");
		try
		{
			if(!StringUtils.isNullOrEmpty(resString))
			{
				XmlMapper objM = new XmlMapper();
				result = objM.readValue(resString, SMSResult.class);
				logger.debug(result.toString());
			}
		}
		//TODO SMS error 처리를 어떻게 진행해야하나...
		// 전체 발송 대비 성공/실패 건수를 구하기 위해 익셉션을 던지지 않음 
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return result;
	}
	
	private String toEucKrAndBase64String(String source) 
	{
		String tmp = null;
		Charset euckrCharset = Charset.forName("euc-kr");
		ByteBuffer byteBuffer = euckrCharset.encode(source);	
		byte[] euckrStringBuffer = new byte[byteBuffer.remaining()];
		byteBuffer.get(euckrStringBuffer);
		tmp = new String(Base64.getEncoder().encode(euckrStringBuffer));	
		return tmp;
	}
	
	private String base64EncodeString(byte[] buf)
	{
	    return new String(Base64.getEncoder().encode(buf));	
	}
}
