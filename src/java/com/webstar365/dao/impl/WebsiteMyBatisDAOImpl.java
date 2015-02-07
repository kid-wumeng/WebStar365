package com.webstar365.dao.impl;

import com.webstar365.dao.WebsiteDAO;
import com.webstar365.pojo.Attr;
import com.webstar365.pojo.SearchCondition;
import com.webstar365.pojo.Website;
import com.webstar365.pojo.WebsiteRecommend;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

public class WebsiteMyBatisDAOImpl extends SqlMapClientDaoSupport implements WebsiteDAO {
    
    /**
     * 查询全部网站
     * @param searchCondition 搜索条件（包含页码、页尺寸）
     * @return 成功：全部网站的集合 | 失败：null
     */
    public List<Website> findAllWebsites(SearchCondition searchCondition) {
        return getSqlMapClientTemplate().queryForList("findAllWebsites", searchCondition);
    }
    
    /**
     * 查询单个网站（按网站编号）
     * @param websiteId 网站编号
     * @return 成功：符合条件的网站 | 失败：null
     */
    public Website findWebsiteByWebsiteId(long websiteId) {
        return (Website) getSqlMapClientTemplate().queryForObject("findWebsiteByWebsiteId", websiteId);
    }
    
    /**
     * 查询单个网站（按网站域名）
     * @param websiteDomain 网站域名
     * @return 成功：符合条件的网站 | 失败：null
     */
    public Website findWebsiteByWebsiteDomain(String websiteDomain) {
        return (Website) getSqlMapClientTemplate().queryForObject("findWebsiteByWebsiteDomain", websiteDomain);
    }
    
    /**
     * 查询网站的集合（按分类编号）
     * @param searchCondition 搜索条件（包含分类编号、页码、页尺寸）
     * @return 成功：符合条件的网站的集合 | 失败：null
     */
    public List<Website> findWebsitesByCatId(SearchCondition searchCondition) {
        return getSqlMapClientTemplate().queryForList("findWebsitesByCatId", searchCondition);
    }

    /**
     * 查询网站的集合（按属性编号）
     * @param searchCondition 搜索条件（包含属性编号、页码、页尺寸）
     * @return 成功：符合条件的网站的集合 | 失败：null
     */
    public List<Website> findWebsitesByAttrId(SearchCondition searchCondition) {
        return getSqlMapClientTemplate().queryForList("findWebsitesByAttrId", searchCondition);
    }

    /**
     * 查询网站的集合（按关键词）
     * @param searchCondition 搜索条件（包含关键词、页码、页尺寸）
     * @return 成功：符合条件的网站的集合 | 失败：null
     */ 
    public List<Website> findWebsitesByKeywords(SearchCondition searchCondition) {
        return getSqlMapClientTemplate().queryForList("findWebsitesByKeywords", searchCondition);
    }

    /**
     * 查询网站的集合（按多种搜索条件的组合）
     * @param searchCondition 搜索条件
     * @return 成功：新网站的编号 | 失败：null
     */
    public List<Website> findWebsitesBySearchCondition(SearchCondition searchCondition) {
        return getSqlMapClientTemplate().queryForList("findWebsitesBySearchCondition", searchCondition);
    }
    
    /**
     * 查询推荐网站（按网站审核状态）
     * @param searchCondition 搜索条件（包含网站审核状态、页码、页尺寸）
     * @return 成功：符合条件的网站推荐的集合 | 失败：null
     */
    public List<WebsiteRecommend> findWebsiteRecommendsByWebsiteCheckStatus(SearchCondition searchCondition) {
        return getSqlMapClientTemplate().queryForList("findWebsiteRecommendsByWebsiteCheckStatus", searchCondition);
    }
    
    /**
     * 查询推荐网站（按网站域名、用户编号）
     * @param websiteRecommend 网站推荐（包含网站域名、用户编号）
     * @return 成功：符合条件的网站推荐 | 失败：null
     */
    public WebsiteRecommend findWebsiteRecommendByWebsiteDomainAndUserId(WebsiteRecommend websiteRecommend) {
        return (WebsiteRecommend) getSqlMapClientTemplate().queryForObject("findWebsiteRecommendByWebsiteDomainAndUserId", websiteRecommend);
    }
        
    /**
     * 添加网站
     * @param website 要添加的网站
     * @return 成功：新网站的编号 | 失败：null
     */
    public long addWebsite(Website website) {
        Long websiteId = (Long) getSqlMapClientTemplate().queryForObject("addWebsite", website);  //添加网站
        website.setWebsiteId(websiteId);
        /* 添加网站属性 */
        if(website.getWebsiteAttrs() != null) {
            for(Attr attr : website.getWebsiteAttrs()) {
                try {
                    website.setWebsiteAttr(attr);
                    getSqlMapClient().queryForObject("addWebsiteAttrsByWebsiteIdAndAttrId", website);
                } catch (SQLException ex) {
                    Logger.getLogger(WebsiteMyBatisDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return websiteId;
    }
    
    /**
     * 添加推荐网站
     * @param websiteRecommend 推荐网站
     * @return 成功：新推荐网站的编号 | 失败：null
     */
    public Long addWebsiteRecommend(WebsiteRecommend websiteRecommend) {
        return (Long) getSqlMapClientTemplate().queryForObject("addWebsiteRecommend", websiteRecommend);
    }
    
    /**
     * 修改网站（按网站编号）
     * @param website 要修改的网站
     */
    public void modifyWebsiteByWebsiteId(Website website) {
        getSqlMapClientTemplate().queryForObject("modifyWebsiteByWebsiteId", website);  //修改网站
        getSqlMapClientTemplate().queryForObject("deleteWebsiteAttrsByWebsiteId", website.getWebsiteId());  //删除网站的原有属性
        /* 添加网站的新属性 */
        if(website.getWebsiteAttrs() != null){
            for(Attr attr : website.getWebsiteAttrs()) {
                try {
                    website.setWebsiteAttr(attr);
                    getSqlMapClient().queryForObject("addWebsiteAttrsByWebsiteIdAndAttrId", website);
                } catch (SQLException ex) {
                    Logger.getLogger(WebsiteMyBatisDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }
    
    /**
     * 修改推荐网站的审核状态（按网站编号）
     * @param websiteRecommend 网站推荐
     * @return 成功：1 | 失败：null
     */
    public Long modifyWebsiteRecommendCheckStatusByWebsiteId(WebsiteRecommend websiteRecommend) {
        return (Long) getSqlMapClientTemplate().queryForObject("modifyWebsiteRecommendCheckStatusByWebsiteId", websiteRecommend);
    }

    /**
     * 统计全部网站数量
     * @return 成功：全部网站的数量 | 失败：null
     */
    public Long countWebsiteNum() {
        return (Long) getSqlMapClientTemplate().queryForObject("countWebsiteNum");
    }
    
    /**
     * 统计网站数量（按分类编号）
     * @param catId 分类编号
     * @return 成功：符合条件的网站的数量 | 失败：null
     */
    public Long countWebsiteNumByCatId(Integer catId) {
        return (Long) getSqlMapClientTemplate().queryForObject("countWebsiteNumByCatId", catId);
    }
    
    /**
     * 统计网站数量（按属性编号）
     * @param attrId 属性编号
     * @return 成功：符合条件的网站的数量 | 失败：null
     */
    public Long countWebsiteNumByAttrId(Long attrId) {
        return (Long) getSqlMapClientTemplate().queryForObject("countWebsiteNumByAttrId", attrId);
    }
    
    /**
     * 统计网站数量（按关键词）
     * @param searchCondition 搜索条件（包含关键词）
     * @return 成功：符合条件的网站的数量 | 失败：null
     */
    public Long countWebsiteNumByKeywords(SearchCondition searchCondition) {
        return (Long) getSqlMapClientTemplate().queryForObject("countWebsiteNumByKeywords", searchCondition);
    }

    /**
     * 统计网站推荐数量（按网站审核状态）
     * @param websiteCheckStatus 网站审核状态
     * @return 成功：符合条件的网站推荐的数量 | 失败：null
     */
    public Long countWebsiteRecommendNumByWebsiteCheckStatus(Integer websiteCheckStatus) {
        return (Long) getSqlMapClientTemplate().queryForObject("countWebsiteRecommendNumByWebsiteCheckStatus", websiteCheckStatus);
    }

}
