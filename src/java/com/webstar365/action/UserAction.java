package com.webstar365.action;

import com.webstar365.common.utils.DateTimeUtils;
import com.webstar365.common.utils.FileUtils;
import com.webstar365.pojo.Area;
import com.webstar365.pojo.User;
import com.webstar365.service.AreaService;
import com.webstar365.service.UploadService;
import com.webstar365.service.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.webstar365.pojo.*;
import com.webstar365.service.CommentService;
import com.webstar365.service.EchoService;
import com.webstar365.service.WebsiteService;
import java.io.File;
import java.util.Date;
import java.util.List;
import org.apache.struts2.ServletActionContext;

public class UserAction extends ActionSupport {
    
    private WebsiteService websiteService;
    private CommentService commentService;
    private EchoService echoService;
    private UserService userService;
    private AreaService areaService;
    private UploadService uploadService;
    private WebsiteRecommend websiteRecommend;
    private Comment comment;
    private List<Comment> comments;
    private Echo echo;
    private User user;
    private List<Area> areas;
    
    private SearchCondition searchCondition;
    private Page page;
    
    private File file;
    private String fileFileName;
    private String fileContentType;
    
    
    /**
     * 显示用户评论 
     * @return 
     */
    public String showComments() {
        user = userService.findUserByUserId(searchCondition.getUserId());
        comments = commentService.findCommentsByUserId(searchCondition);
        Long commentNum = commentService.countCommentNumByUserId(searchCondition.getUserId());
        if(user != null && comments != null && commentNum != null) {
            page.setPageNo(searchCondition.getPage().getPageNo());  
            page.setTotalPageNum(commentNum % page.getCommentPageSize() == 0 ? commentNum / page.getCommentPageSize() : commentNum / page.getCommentPageSize() + 1);
            ActionContext.getContext().put("comments", comments);
            ActionContext.getContext().put("page", page);
            return SUCCESS;
        }
        else {
            ActionContext.getContext().put("errorReason", "无法显示评论。");
            return ERROR;  //用户或评论或评论数量查询出错
        }
    }
    
    /**
     * 显示“我的评论” 
     * @return 
     */
    public String showMyComments() {
        comments = commentService.findCommentsByUserId(searchCondition);
        Long commentNum = commentService.countCommentNumByUserId(searchCondition.getUserId());
        if(comments != null && commentNum != null) {
            page.setPageNo(searchCondition.getPage().getPageNo());  
            page.setTotalPageNum(commentNum % page.getCommentPageSize() == 0 ? commentNum / page.getCommentPageSize() : commentNum / page.getCommentPageSize() + 1);
            ActionContext.getContext().put("userId", searchCondition.getUserId());
            ActionContext.getContext().put("myComments", comments);
            ActionContext.getContext().put("page", page);
            return SUCCESS;
        }
        else {
            ActionContext.getContext().put("errorReason", "无法显示评论。");
            return ERROR;
        }
    }
    
    /**
     * 显示用户资料
     * @return 
     */
    public String showUserData() {
        user = userService.findUserDataByUserId(user.getUserId());
        Long commentNum = commentService.countCommentNumByUserId(user.getUserId());
        if(user != null && commentNum != null) {
            ActionContext.getContext().put("user", user);
            ActionContext.getContext().put("commentNum", commentNum);
            return SUCCESS;
        }
        else {
            ActionContext.getContext().put("errorReason", "无法显示用户资料。");
            return ERROR;
        }
    }

    /**
     * 显示“个人资料”
     * @return 
     */
    public String showMyUserData() {
        user = userService.findUserDataByUserId(user.getUserId());
        Long commentNum = commentService.countCommentNumByUserId(user.getUserId());
        if(user != null && commentNum != null) {
            ActionContext.getContext().put("user", user);
            ActionContext.getContext().put("commentNum", commentNum);
            return SUCCESS;
        }
        else {
            ActionContext.getContext().put("errorReason", "无法显示用户资料。");
            return ERROR;
        }
    }
    
    /**
     * 编辑用户资料
     * @return 
     */
    public String editUserData() {
        user = userService.findUserDataByUserId(user.getUserId());
        areas = areaService.findAreas();
        if(user != null && areas != null) {
            ActionContext.getContext().put("user", user);
            ActionContext.getContext().put("areas", areas);
            ActionContext.getContext().put("years", DateTimeUtils.getYears(1950));
            ActionContext.getContext().put("months", DateTimeUtils.getMonths());
            ActionContext.getContext().put("days", DateTimeUtils.getDays());
            if(user != null) {
                ActionContext.getContext().put("user", user);
            }
            return SUCCESS;
        }
        else {
            ActionContext.getContext().put("errorReason", "无法显示用户资料。");
            return ERROR;  //用户资料或地区查询失败
        }
    }
    
    /**
     * 修改用户资料
     * @return 
     */
    public String modifyUserData() {
        if(user.getUserId() != null) {
            if(user.getUserFacePreviewFileName() != null && !"".equals(user.getUserFacePreviewFileName())) {
                String srcFilePath = ServletActionContext.getServletContext().getRealPath(UploadService.USER_FACE_PREVIEW_SAVE_PATH) + "\\" + user.getUserFacePreviewFileName();  //用户头像预览文件路径
                File srcFile = new File(srcFilePath);  //用户头像预览文件
                String savePath = ServletActionContext.getServletContext().getRealPath(UploadService.USER_FACE_SAVE_PATH);  //用户头像保存路径
                String targetFilePath = savePath + "\\" + user.getUserId() + "." + FileUtils.getFileType(user.getUserFacePreviewFileName());  //用户头像文件路径
                if(srcFile.exists()) {
                    uploadService.uploadUserFace(user, srcFile, targetFilePath);
                }
            }
            Long flag = userService.modifyUserDataByUserId(user);
            if(flag == 1) {
                ActionContext.getContext().put("userId", user.getUserId());
                return SUCCESS;
            }
            else {
                ActionContext.getContext().put("errorReason", "无法修改用户资料。");
                return ERROR;  //修改用户资料失败
            }
        }
        else {
            return ERROR;  //传递来的用户编号为空
        }
    }
    
    /**
     * 修改用户密码
     * @return 
     */
    public String modifyUserPass() {
         boolean flag = userService.modifyUserPassByUserId(user);
         if(flag) {
             ActionContext.getContext().put("success", true);
             return SUCCESS;
         }
         else {
             ActionContext.getContext().put("success", false);
             return ERROR;
         }
    }
    
    /**
     * 添加用户头像预览
     * @return 
     */
    public String addUserFacePreview() {
        if(file != null) {
            String savePath = ServletActionContext.getServletContext().getRealPath(UploadService.USER_FACE_PREVIEW_SAVE_PATH);  //获取保存路径
            String fileType = FileUtils.getFileType(fileFileName);  //获取文件类型
            String newFileName = user.getUserId() + "." + fileType; //新文件名
            String targetFilePath = savePath + "\\" + newFileName;  //目标文件路径
            boolean uploadFlag = uploadService.uploadUserFacePreview(file, targetFilePath);  //上传网站封面
            if(uploadFlag == true) {
                ActionContext.getContext().put("userFacePreviewFileName", newFileName);
                return editUserData();
            }
            else {
                ActionContext.getContext().put("errorReason", "头像上传失败。");
                return ERROR;  //用户头像预览上传失败
            }
        }
        else {
            ActionContext.getContext().put("errorReason", "头像上传失败。");
            return ERROR;  //添加失败
        }
    }
    
    /**
     * 添加评论
     * @return 
     */
    public String addComment() {
        Long id = commentService.addComment(comment);
        if(id != null) {
            comment.setCommentId(id);
            ActionContext.getContext().put("comment", comment);
            return SUCCESS;
        }
        else {
            comment.setCommentId(Long.valueOf(0));
            ActionContext.getContext().put("comment", comment);
            return ERROR;
        }
    }
    
    /**
     * 修改评论
     * @return 
     */
    public String modifyComment() {
        boolean flag = commentService.modifyUserComment(comment);
        if(flag) {
            ActionContext.getContext().put("success", true);
            return SUCCESS;
        }
        else {
            ActionContext.getContext().put("success", false);
            return ERROR;  //修改评论失败
        }
    }
    
    /**
     * 删除评论
     * @return 
     */
    public String deleteComment() {
            boolean deleteflag = commentService.deleteUserComment(comment.getCommentId());
            if(deleteflag) {
                ActionContext.getContext().put("success", true);
                return SUCCESS;
            }
            else {
                ActionContext.getContext().put("success", false);
                return ERROR;  //删除评论失败
            }
    }
    
    /**
     * 添加回应
     * @return 
     */
    public String addEcho() {
        boolean flag = echoService.addEcho(echo); 
        if(flag) {
            ActionContext.getContext().put("commentId", echo.getCommentId());
            return SUCCESS;
        }
        else {
            ActionContext.getContext().put("errorReason", "添加回应失败。");
            return ERROR;  //添加回应失败
        }
    }
    
    public String checkWebsiteRecommendDomain() {
        boolean flag = websiteService.checkWebsiteRecommendDomain(websiteRecommend);
        if(!flag) {
            ActionContext.getContext().put("success", true);
            return SUCCESS;
        }
        else {
            ActionContext.getContext().put("success", false);
            return ERROR;  //该网站域名已存在
        }
    }
    
    /**
     * 推荐网站
     * @return 
     */
    public String recommendWebsite() {
        Long id = websiteService.addWebsiteRecommend(websiteRecommend);
        if(id != null) {
            ActionContext.getContext().put("success", true);
            return SUCCESS;
        }
        else {
            ActionContext.getContext().put("success", false);
            return ERROR;  //添加网站推荐失败
        }
    }
    
    /* getter */
    public WebsiteService getWebsiteService() { return websiteService; }
    public CommentService getCommentService() { return commentService; }
    public EchoService getEchoService() { return echoService; }
    public UserService getUserService() { return userService; }
    public AreaService getAreaService() { return areaService; }
    public UploadService getUploadService() { return uploadService; }
    public WebsiteRecommend getWebsiteRecommend() { return websiteRecommend; }
    public Comment getComment() { return comment; }
    public List<Comment> getComments() { return comments; }
    public Echo getEcho() { return echo; }
    public User getUser() { return user; }
    public SearchCondition getSearchCondition() { return searchCondition; }
    public Page getPage() { return page; }
    public File getFile() { return file; }
    public String getFileFileName() { return fileFileName; }
    public String getFileContentType() { return fileContentType; }
    /* setter */
    public void setWebsiteService(WebsiteService websiteService) { this.websiteService = websiteService; }
    public void setCommentService(CommentService commentService) { this.commentService = commentService; }
    public void setEchoService(EchoService echoService) { this.echoService = echoService; }
    public void setUserService(UserService userService) { this.userService = userService; }
    public void setAreaService(AreaService areaService) { this.areaService = areaService; }
    public void setUploadService(UploadService uploadService) { this.uploadService = uploadService; }
    public void setWebsiteRecommend(WebsiteRecommend websiteRecommend) { this.websiteRecommend = websiteRecommend; }
    public void setComment(Comment comment) { this.comment = comment; }
    public void setComments(List<Comment> comments) { this.comments = comments; }
    public void setEcho(Echo echo) { this.echo = echo; }
    public void setUser(User user) { this.user = user; }
    public void setSearchCondition(SearchCondition searchCondition) { this.searchCondition = searchCondition; }
    public void setPage(Page page) { this.page = page; }
    public void setFile(File file) { this.file = file; }
    public void setFileFileName(String fileFileName) { this.fileFileName = fileFileName; }
    public void setFileContentType(String fileContentType) { this.fileContentType = fileContentType; }

}
