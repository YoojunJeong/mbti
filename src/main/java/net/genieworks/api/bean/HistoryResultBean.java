package net.genieworks.api.bean;

public class HistoryResultBean<ITEM> extends PageResultBean<ITEM> {
    private Integer totalAmount;
    public Integer getTotalAmount()
    {
        return totalAmount;
    }
    public void setTotalAmount(Integer totalAmount)
    {
        this.totalAmount = totalAmount;
    }
}
