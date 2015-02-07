package com.webstar365.pojo;

public class AttrSynonym {
    
    private Long attrSynonymId;      //属性近义词编号
    private String attrSynonymName;  //属性近义词名
    private Long attrId;  //属性近义词所对应的属性编号

    public Long getAttrSynonymId() { return attrSynonymId; }
    public String getAttrSynonymName() { return attrSynonymName; }
    public Long getAttrId() { return attrId; }
    public void setAttrSynonymId(Long attrSynonymId) { this.attrSynonymId = attrSynonymId; }
    public void setAttrSynonymName(String attrSynonymName) { this.attrSynonymName = attrSynonymName; }
    public void setAttrId(Long attrId) { this.attrId = attrId; }
    
}
