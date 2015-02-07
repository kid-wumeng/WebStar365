package com.webstar365.pojo;

public class Attr {
    
    private Long attrId;  //属性编号
    private String attrName;  //属性名
    private String attrIntro;  //属性介绍
    private long attrFindNum;  //属性被查询的次数
    
    /* getter */
    public Long getAttrId() { return attrId; }
    public String getAttrName() { return attrName; }
    public String getAttrIntro() { return attrIntro; }
    public Long getAttrFindNum() { return attrFindNum; }
    /* setter */
    public void setAttrId(Long attrId) { this.attrId = attrId; }
    public void setAttrName(String attrName) { this.attrName = attrName; }
    public void setAttrIntro(String attrIntro) { this.attrIntro = attrIntro; }
    public void setAttrFindNum(Long attrFindNum) { this.attrFindNum = attrFindNum; }
    
}
