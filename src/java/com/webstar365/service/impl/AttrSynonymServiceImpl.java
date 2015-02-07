package com.webstar365.service.impl;

import com.webstar365.dao.AttrSynonymDAO;
import com.webstar365.pojo.AttrSynonym;
import com.webstar365.service.AttrSynonymService;
import java.util.List;

public class AttrSynonymServiceImpl implements AttrSynonymService {

    private AttrSynonymDAO attrSynonymDAO;
    private AttrSynonym attrSynonym;
    
    /**
     * 查询属性近义词（按属性编号）
     * @param attrId 属性编号
     * @return 成功：符合条件的属性近义词的集合 | 失败：null
     */
    public List<AttrSynonym> findAttrSynonymsByAttrId(Long attrId) {
        return attrSynonymDAO.findAttrSynonymsByAttrId(attrId);
    }

    /**
     * 添加属性近义词
     * @param attrSynonym 属性近义词
     * @return 成功：新属性近义词的编号 | 失败：null
     */
    public Long addAttrSynonym(AttrSynonym attrSynonym) {
        return attrSynonymDAO.addAttrSynonym(attrSynonym);
    }
    
    /**
     * 修改属性近义词（按属性近义词编号）
     * @param attrSynonym 属性近义词
     * @return 成功：1 | 失败：0
     */
    public AttrSynonym modifyAttrSynonymByAttrSynonymId(AttrSynonym attrSynonym) {
        Long flag = attrSynonymDAO.modifyAttrSynonymByAttrSynonymId(attrSynonym);
        if(flag != 0) {
            attrSynonym = attrSynonymDAO.findAttrSynonymByAttrSynonymId(attrSynonym.getAttrSynonymId());
            if(attrSynonym != null) {
                return attrSynonym;
            }
            else {
                return null;  //修改成功后查询失败
            }
        }
        else {
            return null;  //修改失败
        }
    }

    /**
     * 删除属性近义词（按属性近义词编号）
     * @param attrSynonymId 属性近义词编号
     * @return 成功：true | 失败：false
     */
    public boolean deleteAttrSynonymByAttrSynonymId(Long attrSynonymId) {
        Long flag = attrSynonymDAO.deleteAttrSynonymByAttrSynonymId(attrSynonymId);
        if(flag == 1) {
            return true;
        } 
        else {
            return false;
        }
    }
    
    /* getter */
    public AttrSynonymDAO getAttrSynonymDAO() { return attrSynonymDAO; }
    /* setter */
    public void setAttrSynonymDAO(AttrSynonymDAO attrSynonymDAO) { this.attrSynonymDAO = attrSynonymDAO; }

}
