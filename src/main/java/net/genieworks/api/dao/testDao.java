/*
 * Copyright (c) 2018. All rights reserved By Genieworks
 *
 */

package net.genieworks.api.dao;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.Map;

@Repository
public class testDao implements CommonDao {

    @Override
    public ArrayList<JSONObject> getTables() {
        return null;
    }

    @Override
    public ArrayList<JSONObject> getQuery(Map data) {
        return null;
    }

    @Override
    public JSONObject selectOne(Map data) {
        return null;
    }

    @Override
    public void insert(Map data) {

    }

    @Override
    public Integer update(Map data) {
        return null;
    }

    @Override
    public void delete(Map data) {

    }
}