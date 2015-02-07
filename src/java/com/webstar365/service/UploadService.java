package com.webstar365.service;

import com.webstar365.pojo.User;
import java.io.File;
import java.util.List;

public interface UploadService {
    
    public static final String WEBSITE_COVERS_SAVE_PATH = "websiteCovers";  //网站封面保存路径
    public static final String USER_FACE_SAVE_PATH = "userFaces";  //用户头像保存路径
    public static final String USER_FACE_PREVIEW_SAVE_PATH = "temp\\userFacePreviews";  //用户头像预览保存路径
    
    public boolean uploadWebsiteCover(File srcFile, String targetFilePath);  //上传一个网站封面
    public boolean uploadWebsiteCovers(List<File> srcFiles, String targetFilePath);  //上传多个网站封面
    public boolean uploadUserFace(User user, File srcFile, String targetFilePath);  //上传用户头像
    public boolean uploadUserFacePreview(File srcFile, String targetFilePath);  //上传用户头像预览
    
}
