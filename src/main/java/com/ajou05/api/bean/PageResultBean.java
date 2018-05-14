package com.ajou05.api.bean;

import java.util.ArrayList;
import java.util.List;

public class PageResultBean<ITEM> {

    private Integer totalCount;
    private Integer totalPage;
    private Integer currentPage;
    private List<ITEM> list = new ArrayList<>();
    public Integer getTotalCount()
    {
        return totalCount;
    }
    public void setTotalCount(Integer totalCount)
    {
        this.totalCount = totalCount;
    }
    public Integer getTotalPage()
    {
        return totalPage;
    }
    public void setTotalPage(Integer totalPage)
    {
        this.totalPage = totalPage;
    }
    public Integer getCurrentPage()
    {
        return currentPage;
    }
    public void setCurrentPage(Integer currentPage)
    {
        this.currentPage = currentPage;
    }
    public List<ITEM> getList()
    {
        return list;
    }
    public void setList(List<ITEM> list)
    {
        this.list = list;
    }
}
