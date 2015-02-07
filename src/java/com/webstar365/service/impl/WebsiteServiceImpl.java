package com.webstar365.service.impl;

import com.webstar365.common.Rule;
import com.webstar365.common.utils.WebUtils;
import com.webstar365.dao.UserActDAO;
import com.webstar365.dao.WebsiteDAO;
import com.webstar365.pojo.*;
import com.webstar365.service.UploadService;
import com.webstar365.service.WebsiteService;
import java.io.File;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

public class WebsiteServiceImpl implements WebsiteService {

    private WebsiteDAO websiteDAO;
    private UserActDAO userActDAO;
    private Website website;
    private List<Website> websites;
    private UserAct userAct;
    private WebsiteRecommend websiteRecommend;
    
    /**
     * 核对网站域名
     * @param websiteDomain 网站域名
     * @return 域名已存在：true | 域名不存在：false
     */
    public boolean checkWebsiteDomain(String websiteDomain) {
        website = websiteDAO.findWebsiteByWebsiteDomain(websiteDomain);
        if(website != null) {
            return true;
        }
        else {
            return false;
        }
    }
    
    /**
     * 核对网站推荐域名
     * @param websiteRecommend 网站推荐（包含网站域名、用户编号）
     * @return 成功：true | 失败：false
     */
    public boolean checkWebsiteRecommendDomain(WebsiteRecommend websiteRecommend) {
        websiteRecommend = websiteDAO.findWebsiteRecommendByWebsiteDomainAndUserId(websiteRecommend);
        if(websiteRecommend != null) {
            return true;
        }
        else {
            return false;
        }
    }
    
    /**
     * 查询单个网站（按网站编号）
     * @param websiteId 网站编号
     * @return 成功：符合条件的网站 | 失败：null
     */
    public Website findWebsiteByWebsiteId(long websiteId) {
        website = websiteDAO.findWebsiteByWebsiteId(websiteId);
        if(website != null) {
            /* 将网站详细介绍中的换行符换成<br /> */
            if(website.getWebsiteDetailedIntro() != null) {
                website.setWebsiteDetailedIntro(website.getWebsiteDetailedIntro().replaceAll("\n", "<br />"));
            }
            /* 利用星数计算网站分数，且根据得分再改变星数 */
            Float star = website.getWebsiteStar();  //获取星数
            float score = Rule.starToScore(star);   //用星数换算分数
            star = Rule.scoreToStar(score);         //用分数换算星数
            website.setWebsiteStar(star);    //设置星数
            website.setWebsiteScore(score);  //设置分数
            /* 按星数求星星个数 */
            website.setWebsiteStarNum(website.getWebsiteStar().intValue());
            /* 判断网站封面是否存在，如果不存在，设封面为默认（defaultWebsiteCover.jpg） */
            String websiteCoverPath = WebUtils.getRootPath() + UploadService.WEBSITE_COVERS_SAVE_PATH + "\\" + website.getWebsiteId() + ".png";
            File websiteCover = new File(websiteCoverPath);
            website.setWebsiteCoverPath(websiteCover.getName());
        }
        return website;
    }
    
    /**
     * 查询网站的集合（按分类编号）
     * @param searchCondition 搜索条件（包含分类编号、页码、页尺寸）
     * @return 成功：符合条件的网站的集合 | 失败：null
     */
    public List<Website> findWebsitesByCatId(SearchCondition searchCondition) {
        searchCondition.getPage().setPageSize(searchCondition.getPage().getWebsitePageSize());  //使用网站页尺寸
        websites = websiteDAO.findWebsitesByCatId(searchCondition);
        if(websites != null) {
            for(Website website : websites) {
                /* 利用星数计算网站分数，且根据得分再改变星数 */
                Float star = website.getWebsiteStar();  //获取星数
                float score = Rule.starToScore(star);   //用星数换算分数
                star = Rule.scoreToStar(score);         //用分数换算星数
                website.setWebsiteStar(star);    //设置星数
                website.setWebsiteScore(score);  //设置分数
                /* 按星数求星星个数 */
                website.setWebsiteStarNum(website.getWebsiteStar().intValue());
                /* 判断网站封面是否存在，如果不存在，设封面为默认（defaultWebsiteCover.jpg） */
                String websiteCoverPath = WebUtils.getRootPath() + UploadService.WEBSITE_COVERS_SAVE_PATH + "\\" + website.getWebsiteId() + ".png";
                File websiteCover = new File(websiteCoverPath);
                    website.setWebsiteCoverPath(websiteCover.getName());
            }
        }
        return websites;
    }

    /**
     * 查询网站的集合（按属性编号）
     * @param searchCondition 搜索条件（包含属性编号、页码、页尺寸）
     * @return 成功：符合条件的网站的集合 | 失败：null
     */
    public List<Website> findWebsitesByAttrId(SearchCondition searchCondition) {
        searchCondition.getPage().setPageSize(searchCondition.getPage().getWebsitePageSize());  //使用网站页尺寸
        websites = websiteDAO.findWebsitesByAttrId(searchCondition);
        if(websites != null) {
            for(Website website : websites) {
                /* 利用星数计算网站分数，且根据得分再改变星数 */
                Float star = website.getWebsiteStar();  //获取星数
                float score = Rule.starToScore(star);   //用星数换算分数
                star = Rule.scoreToStar(score);         //用分数换算星数
                website.setWebsiteStar(star);    //设置星数
                website.setWebsiteScore(score);  //设置分数
                /* 按星数求星星个数 */
                website.setWebsiteStarNum(website.getWebsiteStar().intValue());
                /* 判断网站封面是否存在，如果不存在，设封面为默认（defaultWebsiteCover.jpg） */
                String websiteCoverPath = WebUtils.getRootPath() + UploadService.WEBSITE_COVERS_SAVE_PATH + "\\" + website.getWebsiteId() + ".png";
                File websiteCover = new File(websiteCoverPath);
                website.setWebsiteCoverPath(websiteCover.getName());
            }
        }
        return websites;
    }
    
    /**
     * 查询网站的集合（按关键词）
     * @param searchCondition 搜索条件（包含关键词、页码）
     * @return 成功：符合条件的网站的集合 | 失败：null
     */ 
    public List<Website> findWebsitesByKeywords(SearchCondition searchCondition) {
        /* 将关键词集合中的分割符换成半角空格 */
        searchCondition.setKeywords(searchCondition.getKeywords().replace(',', ' '));   //半角逗号
        searchCondition.setKeywords(searchCondition.getKeywords().replace('？', ' '));   //半角问号
        searchCondition.setKeywords(searchCondition.getKeywords().replace('！', ' '));   //半角感叹号
        searchCondition.setKeywords(searchCondition.getKeywords().replace('|', ' '));   //半角竖线
        searchCondition.setKeywords(searchCondition.getKeywords().replace('/', ' '));   //半角斜杠
        searchCondition.setKeywords(searchCondition.getKeywords().replace('\\', ' '));  //半角反斜杠
        searchCondition.setKeywords(searchCondition.getKeywords().replace('*', ' '));  //半角星号
        searchCondition.setKeywords(searchCondition.getKeywords().replace('　', ' '));  //全角空格
        searchCondition.setKeywords(searchCondition.getKeywords().replace('，', ' '));  //全角逗号
        searchCondition.setKeywords(searchCondition.getKeywords().replace('、', ' '));  //全角顿号
        searchCondition.setKeywords(searchCondition.getKeywords().replace('。', ' '));  //全角句号
        searchCondition.setKeywords(searchCondition.getKeywords().replace('？', ' '));  //全角问号
        searchCondition.setKeywords(searchCondition.getKeywords().replace('！', ' '));  //全角感叹号
        searchCondition.setKeywords(searchCondition.getKeywords().replace('·', ' '));  //全角圆点
        searchCondition.setKeywords(searchCondition.getKeywords().replace('§', ' '));  //全角竖线
        searchCondition.setKeywords(searchCondition.getKeywords().replaceAll(" +", " "));  //将多个空格合并为一个
        searchCondition.getPage().setPageSize(searchCondition.getPage().getWebsitePageSize());  //使用网站页尺寸
        /* 如果关键词为空，则搜索全部网站；否则，按关键词搜索网站 */
        if("".equals(searchCondition.getKeywords())) {
            websites = websiteDAO.findAllWebsites(searchCondition);
        }
        else {
            websites = websiteDAO.findWebsitesByKeywords(searchCondition);
        }
        if(websites != null) {
            for(Website website : websites) {
                /* 利用星数计算网站分数，且根据得分再改变星数 */
                Float star = website.getWebsiteStar();  //获取星数
                float score = Rule.starToScore(star);   //用星数换算分数
                star = Rule.scoreToStar(score);         //用分数换算星数
                website.setWebsiteStar(star);    //设置星数
                website.setWebsiteScore(score);  //设置分数
                /* 按星数求星星个数 */
                website.setWebsiteStarNum(website.getWebsiteStar().intValue());
                /* 判断网站封面是否存在，如果不存在，设封面为默认（defaultWebsiteCover.jpg） */
                String websiteCoverPath = WebUtils.getRootPath() + UploadService.WEBSITE_COVERS_SAVE_PATH + "\\" + website.getWebsiteId() + ".png";
                File websiteCover = new File(websiteCoverPath);
                website.setWebsiteCoverPath(websiteCover.getName());
            }
        }
        return websites;
    }
    
    /**
     * 查询网站的集合（按多种搜索条件的组合）
     * @param searchCondition 搜索条件
     * @return 成功：新网站的编号 | 失败：null
     */
    public List<Website> findWebsitesBySearchCondition(SearchCondition searchCondition) {
        /* 如果网站编号（开始）为空，则设为1 */
        if(searchCondition.getWebsiteIdStart() == null) {
            searchCondition.setWebsiteIdStart((long) 1);
        }
        /* 如果网站编号（结束）为空，则设为1000000000（意为到最后的网站编号） */
        if(searchCondition.getWebsiteIdEnd() == null) {
            searchCondition.setWebsiteIdEnd((long) 1000000000);
        }
        /* 添加网站的月份（开始）-1，因为Date类中月份从0开始 */
        if(searchCondition.getAddWebsiteMonthStart() != null) {
            searchCondition.setAddWebsiteMonthStart(searchCondition.getAddWebsiteMonthStart() - 1);
        } 
        /* 添加网站的月份（结束）-1，因为Date类中月份从0开始 */
        if(searchCondition.getAddWebsiteMonthEnd() != null) {
            searchCondition.setAddWebsiteMonthEnd(searchCondition.getAddWebsiteMonthEnd() - 1);
        }
        /* 如果添加网站的年、月、日（开始）皆为空，则设为1970年1月1日 */ 
        if(searchCondition.getAddWebsiteYearStart() == null && searchCondition.getAddWebsiteMonthStart() == null && searchCondition.getAddWebsiteDayStart() == null) {
            searchCondition.setAddWebsiteYearStart(1970);
            searchCondition.setAddWebsiteMonthStart(0);
            searchCondition.setAddWebsiteDayStart(1);
        }
        /* 如果添加网站的年、月（开始）皆为空，则设为今年、本月 */
        else if(searchCondition.getAddWebsiteYearStart() == null && searchCondition.getAddWebsiteMonthStart() == null && searchCondition.getAddWebsiteDayStart() != null) {
            searchCondition.setAddWebsiteYearStart(new GregorianCalendar().get(Calendar.YEAR));
            searchCondition.setAddWebsiteMonthStart(new GregorianCalendar().get(Calendar.MONTH));
        }
        /* 如果添加网站的月、日（开始）皆为空，则设为1月1日 */
        else if(searchCondition.getAddWebsiteYearStart() != null && searchCondition.getAddWebsiteMonthStart() == null && searchCondition.getAddWebsiteDayStart() == null) {
            searchCondition.setAddWebsiteMonthStart(0);
            searchCondition.setAddWebsiteDayStart(1);
        }
        /* 如果添加网站的年（开始）为空，则设为今年 */
        else if(searchCondition.getAddWebsiteYearStart() == null && searchCondition.getAddWebsiteMonthStart() != null && searchCondition.getAddWebsiteDayStart() != null) {
            searchCondition.setAddWebsiteYearStart(new GregorianCalendar().get(Calendar.YEAR));
        }
        /* 如果添加网站的日（开始）为空，则设为1日 */
        else if(searchCondition.getAddWebsiteYearStart() != null && searchCondition.getAddWebsiteMonthStart() != null && searchCondition.getAddWebsiteDayStart() == null) {
            searchCondition.setAddWebsiteDayStart(1);
        }
        /* 如果添加网站的年、月、日（结束）皆为空，则设为今年、本月、当天 */ 
        if(searchCondition.getAddWebsiteYearEnd() == null && searchCondition.getAddWebsiteMonthEnd() == null && searchCondition.getAddWebsiteDayEnd() == null) {
            searchCondition.setAddWebsiteYearEnd(new GregorianCalendar().get(Calendar.YEAR));
            searchCondition.setAddWebsiteMonthEnd(new GregorianCalendar().get(Calendar.MONTH));
            searchCondition.setAddWebsiteDayEnd(new GregorianCalendar().get(Calendar.DAY_OF_MONTH));
        }
        /* 如果添加网站的年、月（结束）皆为空，则设为今年、本月 */
        else if(searchCondition.getAddWebsiteYearEnd() == null && searchCondition.getAddWebsiteMonthEnd() == null && searchCondition.getAddWebsiteDayEnd() != null) {
            searchCondition.setAddWebsiteYearEnd(new GregorianCalendar().get(Calendar.YEAR));
            searchCondition.setAddWebsiteMonthEnd(new GregorianCalendar().get(Calendar.MONTH));
        }
        /* 如果添加网站的月、日（结束）皆为空，则设为12月31日 */
        else if(searchCondition.getAddWebsiteYearEnd() != null && searchCondition.getAddWebsiteMonthEnd() == null && searchCondition.getAddWebsiteDayEnd() == null) {
            searchCondition.setAddWebsiteMonthEnd(11);
            searchCondition.setAddWebsiteDayEnd(31);
        }
        /* 如果添加网站的年（结束）为空，则设为今年 */
        else if(searchCondition.getAddWebsiteYearEnd() == null && searchCondition.getAddWebsiteMonthEnd() != null && searchCondition.getAddWebsiteDayEnd() != null) {
            searchCondition.setAddWebsiteYearEnd(new GregorianCalendar().get(Calendar.YEAR));
        }
        /* 如果添加网站的日（结束）为空，则设为31日 */
        else if(searchCondition.getAddWebsiteYearEnd() != null && searchCondition.getAddWebsiteMonthEnd() != null && searchCondition.getAddWebsiteDayEnd() == null) {
            searchCondition.setAddWebsiteDayEnd(31);
        }
        /* 创建添加网站的日期（开始） */
        Calendar addWebsiteDateStart = new GregorianCalendar(
                                                        searchCondition.getAddWebsiteYearStart(), 
                                                        searchCondition.getAddWebsiteMonthStart(), 
                                                        searchCondition.getAddWebsiteDayStart()
                                           );
        /* 创建添加网站的日期（结束） */
        Calendar addWebsiteDateEnd = new GregorianCalendar(
                                                      searchCondition.getAddWebsiteYearEnd(),
                                                      searchCondition.getAddWebsiteMonthEnd(),
                                                      searchCondition.getAddWebsiteDayEnd()
                                         );
        searchCondition.setAddWebsiteDateStart(addWebsiteDateStart.getTime());  //设置日期开始条件
        searchCondition.setAddWebsiteDateEnd(addWebsiteDateEnd.getTime());      //设置日期结束条件
        websites = websiteDAO.findWebsitesBySearchCondition(searchCondition);
        if(websites != null) {
            for(Website website : websites) {
                /* 利用星数计算网站分数，且根据得分再改变星数 */
                Float star = website.getWebsiteStar();  //获取星数
                float score = Rule.starToScore(star);   //用星数换算分数
                star = Rule.scoreToStar(score);         //用分数换算星数
                website.setWebsiteStar(star);    //设置星数
                website.setWebsiteScore(score);  //设置分数
                /* 按星数求星星个数 */
                website.setWebsiteStarNum(website.getWebsiteStar().intValue());
                /* 判断网站封面是否存在，如果不存在，设封面为默认（defaultWebsiteCover.jpg） */
                String websiteCoverPath = WebUtils.getRootPath() + UploadService.WEBSITE_COVERS_SAVE_PATH + "\\" + website.getWebsiteId() + ".png";
                File websiteCover = new File(websiteCoverPath);
                website.setWebsiteCoverPath(websiteCover.getName());
            }
        }
        return websites;
    }
    
    /**
     * 查询推荐网站（按网站审核状态）
     * @param searchCondition 搜索条件（包含网站审核状态、页码、页尺寸）
     * @return 成功：符合条件的网站推荐的集合 | 失败：null
     */
    public List<WebsiteRecommend> findWebsiteRecommendsByWebsiteCheckStatus(SearchCondition searchCondition) {
        searchCondition.getPage().setPageSize(searchCondition.getPage().getWebsiteRecommendPageSize());  //使用网站推荐页尺寸
        return websiteDAO.findWebsiteRecommendsByWebsiteCheckStatus(searchCondition);
    }
    
    /**
     * 添加一个网站
     * @param website 要添加的网站
     * @return 成功：新网站的编号 | 失败：null
     */
    public Long addWebsite(Website website) {
        if("".equals(website.getWebsiteName()) || "".equals(website.getWebsiteDomain())) {
            return null;  //网站名或网站域名为空，则返回null
        }
        else {
            if(website.getWebsiteCat().getCatId() == 0) {
                website.getWebsiteCat().setCatId(null);
            }
            return websiteDAO.addWebsite(website);
        }
    }

    /**
     * 添加多个网站
     * @param websites 要添加的网站的集合
     * @return 添加成功的网站的集合（可能为空，既全部添加失败）
     */
    public List<Website> addWebsites(List<Website> websites) {
        for(int i=0; i<websites.size(); i++) {
            if("".equals(websites.get(i).getWebsiteName()) || "".equals(websites.get(i).getWebsiteDomain())) {  
                continue;  //网站名或网站域名为空，则跳过本行数据
            }
            else {
                if(websites.get(i).getWebsiteCat().getCatId() == 0) {
                    websites.get(i).getWebsiteCat().setCatId(null);
                }
                Long id = websiteDAO.addWebsite(websites.get(i));  //添加一个网站，返回新网站的id
                websites.get(i).setWebsiteId(id);
                if(id == null) {
                    //如果返回id为空，则加上一条错误信息，指明此条数据添加失败
                }
            }
        }
        List<Website> newWebsites = new ArrayList<Website>();  //新网站的集合
        for(int i=0; i<websites.size(); i++) {
            if(websites.get(i).getWebsiteId() != null) {
                newWebsites.add(websites.get(i));
            }
        }
        return newWebsites;
    }
    
    /**
     * 添加推荐网站
     * @param websiteRecommend 推荐网站
     * @return 成功：新推荐网站的编号 | 失败：null
     */
    public Long addWebsiteRecommend(WebsiteRecommend websiteRecommend) {
        return websiteDAO.addWebsiteRecommend(websiteRecommend);
    }
    
    /**
     * 修改网站（按网站编号）
     * @param website 要修改的网站
     */
    public void modifyWebsiteByWebsiteId(Website website) {
        if(website.getWebsiteCat().getCatId() == 0) {
            website.getWebsiteCat().setCatId(null);
        }
        websiteDAO.modifyWebsiteByWebsiteId(website);
    }
    
    /**
     * 修改推荐网站的审核状态（按网站编号）
     * @param websiteRecommend 网站推荐
     * @return 成功：true | 失败：false
     */
    public boolean modifyWebsiteRecommendCheckStatusByWebsiteId(WebsiteRecommend websiteRecommend) {
        Long flag = websiteDAO.modifyWebsiteRecommendCheckStatusByWebsiteId(websiteRecommend);
        if(flag == 1) {
            return true;
        }
        else {
            return false;
        }
    }
    
    /**
     * 统计网站数量（按分类编号）
     * @param catId 分类编号
     * @return 成功：符合条件的网站的数量 | 失败：null
     */
    public Long countWebsiteNumByCatId(Integer catId) {
        return websiteDAO.countWebsiteNumByCatId(catId);
    }
    
    /**
     * 统计网站数量（按属性编号）
     * @param attrId 属性编号
     * @return 成功：符合条件的网站的数量 | 失败：null
     */
    public Long countWebsiteNumByAttrId(Long attrId) {
        return websiteDAO.countWebsiteNumByAttrId(attrId);
    }
    
    /**
     * 统计网站数量（按关键词）
     * @param searchCondition 搜索条件（包含关键词）
     * @return 成功：符合条件的网站的数量 | 失败：null
     */
    public Long countWebsiteNumByKeywords(SearchCondition searchCondition) {
        searchCondition.setKeywords(searchCondition.getKeywords().replace('　', ' '));  //将关键词集合中的全角空格换成半角空格
        /* 如果关键词为空，统计全部网站的数量；否则，按关键词统计网站数量 */
        if("".equals(searchCondition.getKeywords())) {
            return websiteDAO.countWebsiteNum();
        }
        else {
            return websiteDAO.countWebsiteNumByKeywords(searchCondition);
        }
    }
    
    /**
     * 统计网站推荐数量（按网站审核状态）
     * @param websiteCheckStatus 网站审核状态
     * @return 成功：符合条件的网站推荐的数量 | 失败：null
     */
    public Long countWebsiteRecommendNumByWebsiteCheckStatus(Integer websiteCheckStatus) {
        return websiteDAO.countWebsiteRecommendNumByWebsiteCheckStatus(websiteCheckStatus);
    }
    
    /* getter */
    public WebsiteDAO getWebsiteDAO() { return websiteDAO; }
    public UserActDAO getUserActDAO() { return userActDAO; }
    /* setter */
    public void setWebsiteDAO(WebsiteDAO websiteDAO) { this.websiteDAO = websiteDAO; }
    public void setUserActDAO(UserActDAO userActDAO) { this.userActDAO = userActDAO; }

}
