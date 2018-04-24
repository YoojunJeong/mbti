package net.genieworks.api.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;

@SuppressWarnings("rawtypes")
public interface CommonDao {
	List<JSONObject> selectProduct();
	ArrayList<JSONObject> getTables();
	ArrayList<JSONObject> getQuery(Map data);
	JSONObject selectOne(Map data);
	void insert(Map data);
	Integer update(Map data);
	
	void delete(Map data);
}
