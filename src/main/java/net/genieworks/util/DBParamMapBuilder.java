package net.genieworks.util;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DBParamMapBuilder {
    
    private Map<String, Object> paramMap = null;
    
    private DBParamMapBuilder() 
    {
        paramMap = new HashMap<String, Object>();
    }

    public static DBParamMapBuilder build()
    {
        return new DBParamMapBuilder();
    }

    public DBParamMapBuilder setTable(String tableName) {
        this.paramMap.put("tableName",tableName); 
        return this;
    }

    public DBParamMapBuilder setColumns(String[] columns) {
        this.paramMap.put("columnNames", Arrays.<String>asList(columns));
        return this;
    }

    public DBParamMapBuilder addColumns(String[] columns) {
        List<String> columnNames = (List<String>)this.paramMap.get("columnNames");
        columnNames.addAll(Arrays.<String>asList(columns));
        return this;
    }
    
}
