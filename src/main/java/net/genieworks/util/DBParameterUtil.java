package net.genieworks.util;

import net.genieworks.api.Const;

public class DBParameterUtil {
    
    public static String applySingleQuote(Object value) {
        if (value == null) return Const.NULL_STRING;
        
        if (value.toString().indexOf("'") != -1) {
            value = value.toString().replaceAll("'", "\\\\'");
        }
        
        return "'"+ value + "'";
    }
}
