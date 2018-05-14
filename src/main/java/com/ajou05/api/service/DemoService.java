package com.ajou05.api.service;

import com.ajou05.api.dao.CommonDao;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
@SuppressWarnings({"unchecked","rawtypes","unused" })
public class DemoService {

	@Autowired
	private CommonDao commonDao;
	
	private final Logger logger = LoggerFactory.getLogger(getClass());

	public JSONObject demoService() {

		JSONObject rtnObj = new JSONObject();
		rtnObj.put("result1", commonDao.selectProduct());

//		Map<String, String> data = new HashMap();
//		data.put("query","SELECT * FROM FAQS LIMIT 1");
//		rtnObj.put("result2", commonDao.getQuery(data));

		return rtnObj;
	}
}//end of class
