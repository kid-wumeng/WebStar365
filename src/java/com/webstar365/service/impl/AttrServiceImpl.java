package com.webstar365.service.impl;

import com.webstar365.dao.AttrDAO;
import com.webstar365.pojo.Attr;
import com.webstar365.service.AttrService;
import java.util.List;

public class AttrServiceImpl implements AttrService {
    
    private AttrDAO attrDAO;
    private Attr attr;

    /**
     * 查询属性（按属性编号）
     * @param attrId 属性编号
     * @return 
     */
    public Attr findAttrByAttrId(Long attrId) {
        return attrDAO.findAttrByAttrId(attrId);
    }
    
    /**
     * 查询全部属性
     * @return 成功：全部属性的集合 | 失败：null
     */
    public List<Attr> findAllAttrs() {
        return attrDAO.findAllAttrs();
    }
    
    /**
     * 查询热门属性
     * @return 成功：热门属性的集合 | 失败：null
     */
    public List<Attr> findHotAttrs() {
        return attrDAO.findHotAttrs();
    }
    
    /**
     * 查询属性（按网站编号）
     * @param websiteId 网站编号
     * @return 成功：网站属性的集合 | 失败：null
     */
    public List<Attr> findAttrsByWebsiteId(int websiteId) {
        return attrDAO.findAttrsByWebsiteId(websiteId);
    }

    /**
     * 添加一个属性
     * @param attr 要添加的属性
     * @return 成功：新属性的编号 | 失败：null
     */
    public Long addAttr(Attr attr) {
        return attrDAO.addAttr(attr);
    }
    
    /**
     * 修改一个属性名（按属性编号）
     * @param attr 要修改的属性（包含属性编号和属性名）
     */
    public Attr modifyAttrNameByAttrId(Attr attr) {
        attrDAO.modifyAttrNameByAttrId(attr);
        return attrDAO.findAttrByAttrId(attr.getAttrId());
    }

    /**
     * 修改一个属性介绍（按属性编号）
     * @param attr 要修改的属性（包含属性编号和属性介绍）
     */
    public Attr modifyAttrIntroByAttrId(Attr attr) {
        attrDAO.modifyAttrIntroByAttrId(attr);
        return attrDAO.findAttrByAttrId(attr.getAttrId());
    }
    
    /**
     * 删除一个属性（按属性编号）
     * @param attrId 属性编号
     */
    public void deleteAttrByAttrId(Long attrId) {
        attrDAO.deleteAttrByAttrId(attrId);
    }
    
    /* getter */
    public AttrDAO getAttrDAO() { return attrDAO; }
    /* setter */
    public void setAttrDAO(AttrDAO attrDAO) { this.attrDAO = attrDAO; }

}
