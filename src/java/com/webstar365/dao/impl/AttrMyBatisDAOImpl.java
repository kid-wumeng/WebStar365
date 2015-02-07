package com.webstar365.dao.impl;

import com.webstar365.dao.AttrDAO;
import com.webstar365.pojo.Attr;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

public class AttrMyBatisDAOImpl extends SqlMapClientDaoSupport implements AttrDAO {
    
    /**
     * 查询属性（按属性编号）
     * @param attrId 属性编号
     * @return 
     */
    public Attr findAttrByAttrId(Long attrId) {
        return (Attr) getSqlMapClientTemplate().queryForObject("findAttrByAttrId", attrId);
    }

    /**
     * 查询全部属性
     * @return 成功：全部属性的集合 | 失败：null
     */
    public List<Attr> findAllAttrs() {
        return getSqlMapClientTemplate().queryForList("findAllAttrs");
    }
    
    /**
     * 查询热门属性
     * @return 成功：热门属性的集合 | 失败：null
     */
    public List<Attr> findHotAttrs() {
        return getSqlMapClientTemplate().queryForList("findHotAttrs");
    }
    
    /**
     * 查询属性（按网站编号）
     * @param websiteId 网站编号
     * @return 成功：网站属性的集合 | 失败：null
     */
    public List<Attr> findAttrsByWebsiteId(int websiteId) {
        return getSqlMapClientTemplate().queryForList("findAttrsBywebsiteId", websiteId);
    }
    
    /**
     * 添加属性
     * @param attr 要添加的属性
     * @return 成功：新属性的编号 | 失败：null
     */
    public Long addAttr(Attr attr) {
        return (Long) getSqlMapClientTemplate().queryForObject("addAttr", attr);
    }
    
    /**
     * 修改属性名（按属性编号）
     * @param attr 要修改的属性（包含属性编号和属性名）
     */
    public void modifyAttrNameByAttrId(Attr attr) {
        getSqlMapClientTemplate().queryForObject("modifyAttrNameByAttrId", attr);
    }

    /**
     * 修改属性介绍（按属性编号）
     * @param attr 要修改的属性（包含属性编号和属性介绍）
     */
    public void modifyAttrIntroByAttrId(Attr attr) {
        getSqlMapClientTemplate().queryForObject("modifyAttrIntroByAttrId", attr);
    }
    
    /**
     * 删除属性（按属性编号）
     * @param attrId 属性编号
     */
    public void deleteAttrByAttrId(Long attrId) {
        getSqlMapClientTemplate().queryForObject("deleteAttrByAttrId", attrId);
    }

}
