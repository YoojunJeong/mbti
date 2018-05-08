package com.ajou05.util;

import com.ajou05.api.Const;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import javapns.communication.exceptions.CommunicationException;
import javapns.communication.exceptions.KeystoreException;
import javapns.devices.Device;
import javapns.devices.implementations.basic.BasicDevice;
import javapns.notification.AppleNotificationServerBasicImpl;
import javapns.notification.PushNotificationManager;
import javapns.notification.PushNotificationPayload;
import javapns.notification.PushedNotification;
import org.json.JSONException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Component
public class PushUtil {
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	Map<String,String> body = new HashMap<String,String>();
	private String key			 = "";
	private String name 			= "";
	private String phoneNumber	= "";
	
	private String itile 	= "";
	private String text 		= "";
	private String type  	= "";
	/*
	 * 사용법 
	 *    @Autowired
	 *    PushUtil pu;   <-- 임포트 
	 * 
	 * 	pu.setName("권우석"); 보내는 사람 이름  <--의미가 없어 보임 
		pu.setPhoneNumber("01092155817"); <---의미가 없어보임 
		pu.makeBody("임시 테스트 용 ", text); <-- 제목, 내용 
		// 아래 메소드 분리 각 키만 넣어서 보내면 됨 
	PointControl 에 가면 예시 있음 
		if("a".equals(phone))
		{
			pu.setKey("APA91bEshJWhfZTZ2lcx8d8Xwcj7pxiFGFozEb_WnRp4j81xoA22VLiJLUQGy5G9RgPyWoQ8oKZugNy4z2j6vjS3KDDwpZHgzmO8jG_zw5L8CPZpk_1jbhs0E5MZFmTubx1X3sTmUNzc");
			pu.sendPushAnoroid();
		}
		else if("i".equals(phone))
		{
			pu.setKey("c16380812691426933ac0308c55a24f20369fbab4874e2b9cee275c6a100d288");
			pu.sendPushIOS();
		}
	 * 
	 */
	public static void main (String[] args) throws Exception {
		PushUtil pu = new PushUtil();
		//pu.setKey("APA91bEshJWhfZTZ2lcx8d8Xwcj7pxiFGFozEb_WnRp4j81xoA22VLiJLUQGy5G9RgPyWoQ8oKZugNy4z2j6vjS3KDDwpZHgzmO8jG_zw5L8CPZpk_1jbhs0E5MZFmTubx1X3sTmUNzc");
		pu.setKey("c16380812691426933ac0308c55a24f20369fbab4874e2b9cee275c6a100d288");
		pu.setName("권우석");
		pu.setPhoneNumber("01092155817");
		pu.makeBody("임시 테스트 용 ", "푸쉬가 잘 나가는지 테스트합니다.");
//		pu.makeBody("임시 테스트 용 ", "푸쉬가 잘 나가는지 테스트합니다.",Const.PUSH_VALET);
		System.err.println(pu.sendPushAnoroid());
//		System.err.println(pu.sendPushAnoroid());
		

	}

	public InputStream getKeyFilePath() {

		Resource resource = new ClassPathResource("PKDistCk.p12");
		InputStream input= null;

		try {
			input = resource.getInputStream();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return input;
	}

	public void makeBody(String titile, String text)
	{
		makeBody(titile,text,Const.PUSH_NORMAL);
	}
	
	public void makeBody(String title, String text, String type) {

		body.put("title",title);
		body.put("text" ,text);
		body.put("type" ,type);
		
	}
	
	public Boolean sendPushAnoroid() {
		
//		if(StringUtil.isDev())
//		{
//			setKey("APA91bEO4QR29v_lQgzspJ-hDv9YwCCj0ZMmJaz0_lHkw_pS5a2GtFPe9-d6ov9Nt6lgpMsvN5i1T8UoHk2q2TXQa2upt1kg6qKeqwbivxDin24JWzicXGM0tdGhQDf0_WfUedvKLYim");
//		}
		Map<String , Object> pushMsg = new HashMap<String, Object>();
		pushMsg.put("data", body);
		pushMsg.put("to",  getKey());
		
		RestTemplate restTemplate = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
		headers.add(HttpHeaders.AUTHORIZATION, "key=AIzaSyCQNHKEjKNt0lEKlL3CXH9THClJPTjAyOw");
		headers.add(HttpHeaders.CONTENT_TYPE, "application/json; charset=UTF-8");
		ObjectMapper mapper = new ObjectMapper();
		boolean isGo = true;
		HttpEntity<String> requestEntity =  null;

		try {
			requestEntity = new HttpEntity<>(mapper.writeValueAsString(pushMsg), headers);
		} catch (JsonProcessingException e) {
			isGo = false;
			e.printStackTrace();
			logger.debug(String.format("JsonProcessingException-> 이름 : %s , 전화번호 : %s, PushKey : %s" ,new Object[] {getName(), getPhoneNumber(), getKey()} ));
		}

		if(isGo) {
			ResponseEntity<String> resEntity = restTemplate.postForEntity("https://fcm.googleapis.com/fcm/send", requestEntity, String.class);
			String resBody = resEntity.getBody();
	
			if (resEntity.getStatusCode() == HttpStatus.OK) {
				logger.debug(String.format("이름 : %s , 전화번호 : %s" ,new Object[] {getName(), getPhoneNumber()} ));
			} else {
				logger.debug(String.format("ERROR-> 이름 : %s , 전화번호 : %s, PushKey : %s" ,new Object[] {getName(), getPhoneNumber(), getKey()} ));
				isGo = false;
			}
		}
		return isGo;
	}
	
	public boolean sendPushIOS() {

		Map<String, String> aps = new HashMap<String, String>();
		aps.put("alert", body.get("text"));
		aps.put("sound", "default");
		
		Map<String, Object> body = new HashMap<String, Object>();
		body.put("aps"		, aps);
		body.put("title"		, body.get("title"));
		body.put("content"	, "");
		body.put("type"		, "2");
		
		ObjectMapper mapper = new ObjectMapper();
		String bodyString = null;

		try {
			bodyString = mapper.writeValueAsString(body);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    
		// true : 단일 발송, false : 다중 발송
		List<String> tokens = new ArrayList<String>();
		tokens.add(getKey());
		boolean isGo = true; 
		PushNotificationManager pushManager = new PushNotificationManager();
		Device device = new BasicDevice();
		device.setToken(tokens.get(0));
		PushedNotification notification = null;
//		String keyFilePath = getKeyFilePath();

		try {
			pushManager.initializeConnection(new AppleNotificationServerBasicImpl(getKeyFilePath(), "Cnfqkf0601", true));
			notification = pushManager.sendNotification(device, PushNotificationPayload.fromJSON(bodyString));
		} catch (CommunicationException | KeystoreException | JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			isGo = false;
			logger.debug(String.format("CommunicationException | KeystoreException | JSONException-> 이름 : %s , 전화번호 : %s, PushKey : %s" ,new Object[] {getName(), getPhoneNumber(), getKey()} ));
		}
		 
	    if(isGo) {
		    if ( notification.isSuccessful() && notification.isTransmissionCompleted()) {
				logger.debug(String.format("이름 : %s , 전화번호 : %s" ,new Object[] {getName(), getPhoneNumber()} ));
		    } else {
				logger.error(String.format("ERROR-> 이름 : %s , 전화번호 : %s, PushKey : %s" ,new Object[] {getName(), getPhoneNumber(), getKey()} ));
				isGo =  false;
		    }
	    }
	    
	    return isGo;
	}
	
	//==============================
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getItile() {
		return itile;
	}
	public void setItile(String itile) {
		this.itile = itile;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
   
	
	
}
