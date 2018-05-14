/*
 * Copyright (c) 2018. All rights reserved By Genieworks
 *
 */

package com.ajou05.api.repository;

import com.ajou05.api.mapper.DemoMapper;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TestRepository {

    @Autowired
    DemoMapper demoMapper;

    public JSONObject selectProduct() {
        return demoMapper.selectAll();
    }

}