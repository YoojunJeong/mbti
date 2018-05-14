package com.ajou05.api.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.json.simple.JSONObject;

/**
 * Created by yoojun.jeong on 2018. 5. 14..
 */
@Mapper
public interface DemoMapper {

    @Select("select * from mbti_entry limit 1")
    JSONObject selectAll();
}
