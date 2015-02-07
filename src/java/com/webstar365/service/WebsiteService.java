package com.webstar365.service;

import com.webstar365.pojo.SearchCondition;
import com.webstar365.pojo.Website;
import com.webstar365.pojo.WebsiteRecommend;
import java.util.List;

public interface WebsiteService {
    
    public boolean checkWebsiteDomain(String websiteDomain);  //核对网站域名
    public boolean checkWebsiteRecommendDomain(WebsiteRecommend websiteRecommend);  //核对网站推荐域名
    public Website findWebsiteByWebsiteId(long websiteId);  //查询单个网站（按网站编号）
    public List<Website> findWebsitesByCatId(SearchCondition searchCondition);  //查询网站的集合（按分类编号）
    public List<Website> findWebsitesByAttrId(SearchCondition searchCondition);  //查询网站的集合（按属性编号）
    public List<Website> findWebsitesByKeywords(SearchCondition searchCondition);  //查询网站的集合（按关键词）
    public List<Website> findWebsitesBySearchCondition(SearchCondition searchCondition);  //查询网站的集合（按多种搜索条件的组合）
    public List<WebsiteRecommend> findWebsiteRecommendsByWebsiteCheckStatus(SearchCondition searchCondition);  //查询推荐网站（按网站审核状态）
    public Long addWebsite(Website website);  //添加一个网站
    public List<Website> addWebsites(List<Website> websites);  //添加多个网站
    public Long addWebsiteRecommend(WebsiteRecommend websiteRecommend);  //添加推荐网站
    public void modifyWebsiteByWebsiteId(Website website);  //修改网站（按网站编号）
    public boolean modifyWebsiteRecommendCheckStatusByWebsiteId(WebsiteRecommend websiteRecommend);  //修改推荐网站的审核状态（按网站编号）
    public Long countWebsiteNumByCatId(Integer catId);  //统计网站数量（按分类编号）
    public Long countWebsiteNumByAttrId(Long attrId);  //统计网站数量（按属性编号）
    public Long countWebsiteNumByKeywords(SearchCondition searchCondition);  //统计网站数量（按关键词）
    public Long countWebsiteRecommendNumByWebsiteCheckStatus(Integer websiteCheckStatus);  //统计网站推荐数量（按网站审核状态）
     
}
