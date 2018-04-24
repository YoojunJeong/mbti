package net.genieworks.api.mapper;

import org.apache.ibatis.annotations.*;
import org.json.simple.JSONObject;

import java.util.List;

/**
 * Created by yoojun.jeong on 2018. 4. 23..
 */
@Mapper
public interface DemoMapper {

    @Select("select * from product limit 2")
    List<JSONObject> selectProduct();
}
