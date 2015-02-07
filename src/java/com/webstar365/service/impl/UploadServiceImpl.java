package com.webstar365.service.impl;

import com.webstar365.common.utils.FileUtils;
import com.webstar365.dao.UserDAO;
import com.webstar365.pojo.User;
import com.webstar365.service.UploadService;
import java.io.File;
import java.util.List;

public class UploadServiceImpl implements UploadService {

    private UserDAO userDAO;
    
    /**
     * 上传一个网站封面
     * @param srcFile 源文件
     * @param targetFilePath 网站封面保存路径
     * @return 
     */
    public boolean uploadWebsiteCover(File srcFile, String targetFilePath) {
        return FileUtils.copy(srcFile, targetFilePath, 5000);
    }
    
    /**
     * 上传多个网站封面
     * @param srcFiles 源文件的集合
     * @param websiteCoversSavePath 网站封面保存路径
     * @return 
     */
    public boolean uploadWebsiteCovers(List<File> srcFiles, String targetFilePath) {
        return FileUtils.copy(srcFiles, targetFilePath, 5000);
    }
    
    /**
     * 上传用户头像
     * @param user 上传头像的用户
     * @param srcFile 源文件
     * @param targetFilePath 用户头像保存路径
     * @return 
     */
    public boolean uploadUserFace(User user, File srcFile, String targetFilePath) {
        boolean flag = FileUtils.copy(srcFile, targetFilePath, 5000);
        if(flag) {
            user.setUserFaceFlag(1);
            userDAO.modifyUserFaceFlagByUserId(user);
        }
        return flag;
    }

    /**
     * 上传用户头像预览
     * @param srcFile 源文件
     * @param targetFilePath 用户头像预览保存路径
     * @return 
     */
    public boolean uploadUserFacePreview(File srcFile, String targetFilePath) {
        return FileUtils.copy(srcFile, targetFilePath, 5000);
    }

    /* getter */
    public UserDAO getUserDAO() { return userDAO; }
    /* setter */
    public void setUserDAO(UserDAO userDAO) { this.userDAO = userDAO; }
    
}
