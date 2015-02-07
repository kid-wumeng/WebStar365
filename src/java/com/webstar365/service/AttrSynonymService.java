package com.webstar365.service;

import com.webstar365.pojo.AttrSynonym;
import java.util.List;

public interface AttrSynonymService {
    
    public List<AttrSynonym> findAttrSynonymsByAttrId(Long attrId);  //查询属性近义词（按属性编号）
    public Long addAttrSynonym(AttrSynonym attrSynonym);  //添加属性近义词
    public AttrSynonym modifyAttrSynonymByAttrSynonymId(AttrSynonym attrSynonym);  //修改属性近义词（按属性近义词编号）
    public boolean deleteAttrSynonymByAttrSynonymId(Long attrSynonymId);  //删除属性近义词（按属性近义词编号）
    
}
