package com.webstar365.dao.impl;

import com.webstar365.dao.AttrSynonymDAO;
import com.webstar365.pojo.AttrSynonym;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

public class AttrSynonymMyBatisDAOImpl extends SqlMapClientDaoSupport implements AttrSynonymDAO {

    /**
     * 查询属性近义词（按属性近义词编号）
     * @param attrSynonymId 属性近义词编号
     * @return 成功：符合条件的属性近义词的集合 | 失败：null
     */
    public AttrSynonym findAttrSynonymByAttrSynonymId(Long attrSynonymId) {
        return (AttrSynonym) getSqlMapClientTemplate().queryForObject("findAttrSynonymByAttrSynonymId", attrSynonymId);
    }
    
    /**
     * 查询属性近义词（按属性编号）
     * @param attrId 属性编号
     * @return 成功：符合条件的属性近义词的集合 | 失败：null
     */
    public List<AttrSynonym> findAttrSynonymsByAttrId(Long attrId) {
        return getSqlMapClientTemplate().queryForList("findAttrSynonymsByAttrId", attrId);
    }
    
    /**
     * 添加属性近义词
     * @param attrSynonym 属性近义词
     * @return 成功：新属性近义词的编号 | 失败：null
     */
    public Long addAttrSynonym(AttrSynonym attrSynonym) {
        return (Long) getSqlMapClientTemplate().queryForObject("addAttrSynonym", attrSynonym);
    }

    /**
     * 修改属性近义词（按属性近义词编号）
     * @param attrSynonym 属性近义词
     * @return 成功：1 | 失败：0
     */
    public Long modifyAttrSynonymByAttrSynonymId(AttrSynonym attrSynonym) {
        return (Long) getSqlMapClientTemplate().queryForObject("modifyAttrSynonymByAttrSynonymId", attrSynonym);
    }

    /**
     * 删除属性近义词（按属性近义词编号）
     * @param attrSynonymId 属性近义词编号
     * @return 成功：1 | 失败：0
     */
    public Long deleteAttrSynonymByAttrSynonymId(Long attrSynonymId) {
        return (Long) getSqlMapClientTemplate().queryForObject("deleteAttrSynonymByAttrSynonymId", attrSynonymId);
    }

    
}
