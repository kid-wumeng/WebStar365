package com.webstar365.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.webstar365.common.utils.DateTimeUtils;
import com.webstar365.common.utils.FileUtils;
import com.webstar365.pojo.*;
import com.webstar365.service.*;
import java.io.File;
import java.util.List;
import org.apache.struts2.ServletActionContext;

public class AdminAction extends ActionSupport {
    
    private CatService catService;
    private AttrService attrService;
    private AttrSynonymService attrSynonymService;
    private WebsiteService websiteService;
    private UploadService uploadService;
    private AdminService adminService;
    private NoticeService noticeService;
    private List<Cat> cats;
    private Attr attr;
    private List<Attr> attrs;
    private AttrSynonym attrSynonym;
    private List<AttrSynonym> attrSynonyms;
    private Website website;
    private List<Website> websites;
    private WebsiteRecommend websiteRecommend;
    private List<WebsiteRecommend> websiteRecommends;
    private List<Admin> admins;
    private Notice notice;
    
    private SearchCondition searchCondition;
    private Page page;
    
    private File file;
    private String fileFileName;
    private String fileContentType;
    private List<File> files;
    private List<String> filesFileName;
    private List<String> filesContentType;
    
    private List<Boolean> uploadCoverFlags;  //每个新网站是否上传了封面，true：上传了 | false：没上传

    /**
     * 显示新公告
     * @return 
     */
    public String showNewNotice() {
        notice = noticeService.findNewNotice();
        if(true) {
            ActionContext.getContext().put("newNotice", notice);
            return SUCCESS;
        }
        else {
            return ERROR;
        }
    }
    
    /**
     * 核对网站（根据域名检查网站是否已存在，域名已存在：true | 域名不存在：false）
     * @return 
     */
    public String checkWebsite() {
        boolean flag = websiteService.checkWebsiteDomain(website.getWebsiteDomain());
        if(flag) {
            ActionContext.getContext().put("success", true);
        }
        else {
            ActionContext.getContext().put("success", false);
        }
        return SUCCESS;
    }
    
    /**
     * 编辑搜索条件
     * @return 
     */
    public String editSearchCondition() {
        cats = catService.findAllCatsWithNull();  //全部分类
        attrs = attrService.findAllAttrs();       //全部属性
        admins = adminService.findAllAdmins();    //全部管理员
        if(cats != null && attrs != null && admins != null) {
            ActionContext.getContext().put("allCats", cats);
            ActionContext.getContext().put("allAttrs", attrs);
            ActionContext.getContext().put("allAdmins", admins);
            ActionContext.getContext().put("years", DateTimeUtils.getYears(2000));
            ActionContext.getContext().put("months", DateTimeUtils.getMonths());
            ActionContext.getContext().put("days", DateTimeUtils.getDays());
            return SUCCESS;
        }
        else {
            return ERROR;
        }
    }
    
    /**
     * 搜索网站
     * @return 
     */
    public String searchWebsites() {
        websites = websiteService.findWebsitesBySearchCondition(searchCondition);
        if(websites != null) {
            ActionContext.getContext().put("websites", websites);
            return SUCCESS;
        }
        else {
            return ERROR;
        }
    }
    
    /**
     * 编辑属性
     * @return SUCCESS：编辑属性页 | ERROR：错误页
     */
    public String editAttrs() {
        attrs = attrService.findAllAttrs();
        if(attrs != null) {
            ActionContext.getContext().put("allAttrs", attrs);
            return SUCCESS;
        }
        else 
            return ERROR;
    }
    
    /**
     * 编辑属性近义词
     * @return 
     */
    public String editAttrSynonyms() {
        attr = attrService.findAttrByAttrId(attr.getAttrId());
        attrSynonyms = attrSynonymService.findAttrSynonymsByAttrId(attr.getAttrId());
        if(attr != null && attrSynonyms != null) {
            ActionContext.getContext().put("attr", attr);
            ActionContext.getContext().put("attrSynonyms", attrSynonyms);
            return SUCCESS;
        }
        else {
            return ERROR;
        }
    }
    
    /**
     * 编辑一个网站
     * @return SUCCESS：编辑新网站页 | ERROR：错误页
     */
    public String editWebsite() {
        cats = catService.findAllCatsWithNull();
        attrs = attrService.findAllAttrs();
        website = websiteService.findWebsiteByWebsiteId(website.getWebsiteId());
        if(cats != null && attrs != null && website != null) {
            ActionContext.getContext().put("allCats", cats);
            ActionContext.getContext().put("allAttrs", attrs);
            ActionContext.getContext().put("website", website);
            ActionContext.getContext().put("years", DateTimeUtils.getYears(1990));
            ActionContext.getContext().put("months", DateTimeUtils.getMonths());
            ActionContext.getContext().put("days", DateTimeUtils.getDays());
            return SUCCESS;
        }
        else 
            return ERROR;
    }
    
    /**
     * 编辑一个新网站
     * @return SUCCESS：编辑新网站页 | ERROR：错误页
     */
    public String editNewWebsite() {
        cats = catService.findAllCatsWithNull();
        attrs = attrService.findAllAttrs();
        if(cats != null && attrs != null) {
            ActionContext.getContext().put("allCats", cats);
            ActionContext.getContext().put("allAttrs", attrs);
            ActionContext.getContext().put("years", DateTimeUtils.getYears(1990));
            ActionContext.getContext().put("months", DateTimeUtils.getMonths());
            ActionContext.getContext().put("days", DateTimeUtils.getDays());
            return SUCCESS;
        }
        else 
            return ERROR;
    }
    
    /**
     * 编辑多个新网站
     * @return SUCCESS：批量编辑新网站页 | ERROR：错误页
     */
    public String editNewWebsites() {
        cats = catService.findAllCatsWithNull();
        attrs = attrService.findAllAttrs();
        if(cats != null && attrs != null) {
            ActionContext.getContext().put("allCats", cats);
            ActionContext.getContext().put("allAttrs", attrs);
            ActionContext.getContext().put("years", DateTimeUtils.getYears(1990));
            ActionContext.getContext().put("months", DateTimeUtils.getMonths());
            ActionContext.getContext().put("days", DateTimeUtils.getDays());
            return SUCCESS;
        }
        else 
            return ERROR;
    }
    
    /**
     * 编辑网站推荐
     * @return 
     */
    public String editWebsiteRecommends() {
        websiteRecommends = websiteService.findWebsiteRecommendsByWebsiteCheckStatus(searchCondition);
        Long websiteRecommendNum = websiteService.countWebsiteRecommendNumByWebsiteCheckStatus(searchCondition.getWebsiteCheckStatus());
        if(websiteRecommends != null && websiteRecommendNum != null) {
            page.setPageNo(searchCondition.getPage().getPageNo());  
            page.setTotalPageNum(websiteRecommendNum % page.getWebsiteRecommendPageSize() == 0 ? websiteRecommendNum / page.getWebsiteRecommendPageSize() : websiteRecommendNum / page.getWebsiteRecommendPageSize() + 1);
            ActionContext.getContext().put("checkStatus", searchCondition.getWebsiteCheckStatus());
            ActionContext.getContext().put("websiteRecommends", websiteRecommends);
            ActionContext.getContext().put("page", page);
            return SUCCESS;
        }
        else {
            return ERROR;  //查询网站推荐失败
        }
    }
    
    /**
     * 添加属性
     * @return 
     */
    public String addAttr() {
        Long id = attrService.addAttr(attr);
        if(id != null) {
            return SUCCESS;
        }
        else
            return ERROR;
    }

    /**
     * 添加属性近义词
     * @return 
     */
    public String addAttrSynonym() {
        Long id = attrSynonymService.addAttrSynonym(attrSynonym);
        if(id != null) {
            ActionContext.getContext().put("attrId", attrSynonym.getAttrId());
            return SUCCESS;
        }
        else
            return ERROR;
    }
    
    /**
     * 添加一个网站（包括添加此网站的封面）
     * @return
     */
    public String addWebsite() {
        Long id = websiteService.addWebsite(website);  //添加一个网站，返回新网站的id
        if(id != null) {
            website.setWebsiteId(id);  
            if(file != null) {
                String savePath = ServletActionContext.getServletContext().getRealPath(UploadService.WEBSITE_COVERS_SAVE_PATH);  //获取保存路径
                String fileType = FileUtils.getFileType(fileFileName);  //获取文件类型
                String targetFilePath = savePath + "\\" + id + "." + fileType;  //目标文件路径
                boolean uploadFlag = uploadService.uploadWebsiteCover(file, targetFilePath);  //上传网站封面
                if(uploadFlag != true) {
                    return ERROR;  //网站封面上传失败
                }
            }
            return SUCCESS;  //添加成功
        }
        else
            return ERROR;  //添加失败
    }
    
    /**
     * 添加多个网站
     * @return
     */
    public String addWebsites() {
        if(websites != null) {
            for(int i=0; i<websites.size(); i++) {
                List<Attr> attrs = websites.get(i).getWebsiteAttrs();
            }
            List<Website> newWebsites = websiteService.addWebsites(websites);
            if(newWebsites.size() == 0) {
                return ERROR;  //全部添加失败
            }
            else {
                ActionContext.getContext().put("newWebsites", newWebsites);  //传递新网站（此集合中包含未添加成功的网站，在之后添加网站封面页中不要显示）
                return SUCCESS;  //添加成功
            }
        }
        else {
            return ERROR;  //未接收到表单数据
        }
    }
    
    /**
     * 添加多个新网站的封面
     * @return 
     */
    public String addNewWebsiteCovers() {
        int j = 0;
        for(int i=0; i<websites.size(); i++) {
            if(!uploadCoverFlags.get(i)) {
                continue;
            }
            else {
                String savePath = ServletActionContext.getServletContext().getRealPath(UploadService.WEBSITE_COVERS_SAVE_PATH);  //获取保存路径
                String fileType = FileUtils.getFileType(filesFileName.get(j));  //获取文件类型
                String targetFilePath = savePath + "\\" + websites.get(i).getWebsiteId() + "." + fileType;  //目标文件路径
                boolean flag = uploadService.uploadWebsiteCover(files.get(j), targetFilePath);  //上传网站封面
                j++;
                if(!flag) {
                    
                } 
            }                
        }
            return SUCCESS;
    }
    
    /**
     * 修改属性名
     * @return 
     */
    public String modifyAttrName() {
        attr = attrService.modifyAttrNameByAttrId(attr);
        ActionContext.getContext().put("attr", attr);
        return SUCCESS;
    }
    
    /**
     * 修改属性介绍
     * @return 
     */
    public String modifyAttrIntro() {
        attr = attrService.modifyAttrIntroByAttrId(attr);
        ActionContext.getContext().put("attr", attr);
        return SUCCESS;
    }
    
    /**
     * 修改属性近义词
     * @return 
     */
    public String modifyAttrSynonym() {
        attrSynonym = attrSynonymService.modifyAttrSynonymByAttrSynonymId(attrSynonym);
        ActionContext.getContext().put("attrSynonym", attrSynonym);
        return SUCCESS;
    }
    
    /**
     * 修改网站
     * @return 
     */
    public String modifyWebsite() {
        websiteService.modifyWebsiteByWebsiteId(website);  //修改网站
        /* 修改网站封面 */
        if(file != null) {
            String savePath = ServletActionContext.getServletContext().getRealPath(UploadService.WEBSITE_COVERS_SAVE_PATH);  //获取保存路径
            String fileType = FileUtils.getFileType(fileFileName);  //获取文件类型
            String targetFilePath = savePath + "\\" + website.getWebsiteId() + "." + fileType;  //目标文件路径
            boolean uploadFlag = uploadService.uploadWebsiteCover(file, targetFilePath);  //上传网站封面
            if(uploadFlag != true) {
                return ERROR;  //网站封面上传失败
            }
        }
        return SUCCESS;
    }
    
    /**
     * 修改网站推荐的状态
     * @return 
     */
    public String modifyWebsiteRecommendCheckStatus() {
        boolean flag = websiteService.modifyWebsiteRecommendCheckStatusByWebsiteId(websiteRecommend);
        if(flag) {
            ActionContext.getContext().put("success", true);
            return SUCCESS;
        }
        else {
            ActionContext.getContext().put("success", false);
            return ERROR;  //修改网站推荐的审核状态出错
        }
    }
    
    /**
     * 删除属性
     * @return 
     */
    public String deleteAttr() {
        attrService.deleteAttrByAttrId(attr.getAttrId());
        return SUCCESS;
    }
    
    /**
     * 删除属性近义词
     * @return 
     */
    public String deleteAttrSynonym() {
        boolean flag = attrSynonymService.deleteAttrSynonymByAttrSynonymId(attrSynonym.getAttrSynonymId());
        if(flag) {
            ActionContext.getContext().put("attrId", attrSynonym.getAttrId());
            return SUCCESS;
        }
        else {
            return ERROR;
        }
    }
    

    /* getter */
    public CatService getCatService() { return catService; }
    public WebsiteService getWebsiteService() { return websiteService; }
    public AttrService getAttrService() { return attrService; }
    public AttrSynonymService getAttrSynonymService() { return attrSynonymService; }
    public UploadService getUploadService() { return uploadService; }
    public AdminService getAdminService() { return adminService; }
    public NoticeService getNoticeService() { return noticeService; }
    public Attr getAttr() { return attr; }
    public AttrSynonym getAttrSynonym() { return attrSynonym; }
    public Website getWebsite() { return website; }
    public List<Website> getWebsites() { return websites; }
    public WebsiteRecommend getWebsiteRecommend() { return websiteRecommend; }
    public SearchCondition getSearchCondition() { return searchCondition; }
    public Page getPage() { return page; }
    public File getFile() { return file; }
    public String getFileFileName() { return fileFileName; }
    public String getFileContentType() { return fileContentType; }
    public List<File> getFiles() { return files; }
    public List<String> getFilesFileName() { return filesFileName; }
    public List<String> getFilesContentType() { return filesContentType; }
    public List<Boolean> getUploadCoverFlags() { return uploadCoverFlags; }
    /* setter */
    public void setCatService(CatService catService) { this.catService = catService; }
    public void setWebsiteService(WebsiteService websiteService) { this.websiteService = websiteService; }
    public void setAttrService(AttrService attrService) { this.attrService = attrService; }
    public void setAttrSynonymService(AttrSynonymService attrSynonymService) { this.attrSynonymService = attrSynonymService; }
    public void setUploadService(UploadService uploadService) { this.uploadService = uploadService; }
    public void setAdminService(AdminService adminService) { this.adminService = adminService; }
    public void setNoticeService(NoticeService noticeService) { this.noticeService = noticeService; }
    public void setAttr(Attr attr) { this.attr = attr; }
    public void setAttrSynonym(AttrSynonym attrSynonym) { this.attrSynonym = attrSynonym; }
    public void setWebsite(Website website) { this.website = website; }
    public void setWebsites(List<Website> websites) { this.websites = websites; }
    public void setWebsiteRecommend(WebsiteRecommend websiteRecommend) { this.websiteRecommend = websiteRecommend; }
    public void setSearchCondition(SearchCondition searchCondition) { this.searchCondition = searchCondition; }
    public void setPage(Page page) { this.page = page; }
    public void setFile(File file) { this.file = file; }
    public void setFileFileName(String fileFileName) { this.fileFileName = fileFileName; }
    public void setFileContentType(String fileContentType) { this.fileContentType = fileContentType; }
    public void setFiles(List<File> files) { this.files = files; }
    public void setFilesFileName(List<String> filesFileName) { this.filesFileName = filesFileName; }
    public void setFilesContentType(List<String> filesContentType) { this.filesContentType = filesContentType; }
    public void setUploadCoverFlags(List<Boolean> uploadCoverFlags) { this.uploadCoverFlags = uploadCoverFlags; }

}
