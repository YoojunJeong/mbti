package net.genieworks.api.bean;

import java.util.ArrayList;
import java.util.List;

public class DataResultBean<ITEM> {

    private Integer totalCount;
    public Integer getTotalCount()
    {
        return totalCount;
    }
    public void setTotalCount(Integer totalCount)
    {
        this.totalCount = totalCount;
    }
    private List<ITEM> list = new ArrayList<>();
    public List<ITEM> getList()
    {
        return list;
    }
    public void setList(List<ITEM> list)
    {
        this.list = list;
    }
}
