package com.ajou05.api.dao;

import java.util.ArrayList;
import java.util.Map;

import org.json.simple.JSONObject;

@SuppressWarnings("rawtypes")
public interface CommonDao {
	ArrayList<JSONObject> getTables();
	ArrayList<JSONObject> getQuery(Map data);
	JSONObject selectOne(Map data);
	void insert(Map data);
	Integer update(Map data);
	
	void delete(Map data);
}
