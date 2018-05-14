package com.ajou05.api.service;

import com.ajou05.api.repository.TestRepository;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DemoService {

	@Autowired
	private TestRepository testRepository;
	
	private final Logger logger = LoggerFactory.getLogger(getClass());

	public JSONObject demoService() {

		JSONObject rtnObj = new JSONObject();
		rtnObj.put("result", testRepository.selectProduct());

		return rtnObj;
	}
}
