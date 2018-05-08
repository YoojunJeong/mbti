package com.ajou05.api.bean;

public class MessageTemplateBean {
    private Integer idx;
    private String eventType;
    private String type;
    private String title;
    private String content;
    private String typeDesc;

    public Integer getIdx()
    {
        return idx;
    }
    public void setIdx(Integer idx)
    {
        this.idx = idx;
    }
    public String getEventType()
    {
        return eventType;
    }
    public void setEventType(String eventType)
    {
        this.eventType = eventType;
    }
    public String getType()
    {
        return type;
    }
    public void setType(String type)
    {
        this.type = type;
    }
    public String getTitle()
    {
        return title;
    }
    public void setTitle(String title)
    {
        this.title = title;
    }
    public String getContent()
    {
        return content;
    }
    public void setContent(String content)
    {
        this.content = content;
    }
    public String getTypeDesc()
    {
        return typeDesc;
    }
    public void setTypeDesc(String typeDesc)
    {
        this.typeDesc = typeDesc;
    }
}
