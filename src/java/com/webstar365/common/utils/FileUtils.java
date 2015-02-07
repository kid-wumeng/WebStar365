package com.webstar365.common.utils;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class FileUtils {
    
    /**
     * 获取文件类型
     * @param fileName 文件名
     * @return 成功：文件类型 | 失败：null
     */
    public static String getFileType(String fileName) {
        String fileType = null;
        int pointPosition = fileName.lastIndexOf(".");  //获取文件类型前点的位置
        fileType = fileName.substring(pointPosition + 1);  //获取文件类型
        return fileType;
    }
    
    /**
     * 复制一个文件
     * @param srcFile 源文件
     * @param targetFilePath 目标目录路径
     * @param bufferSize 缓冲区大小
     * @return true：复制成功 | false：复制失败
     */
    public static boolean copy(File srcFile, String targetFilePath, int bufferSize) {
        List<File> srcFiles = new ArrayList<File>();
        srcFiles.add(srcFile);
        return copy(srcFiles, targetFilePath, bufferSize);
    }
    
    /**
     * 复制多个文件
     * @param srcFiles 源文件的集合
     * @param targetDirectoryPath 目标目录路径
     * @param bufferSize 缓冲区大小
     * @return true：复制成功 | false：复制失败
     */
    public static boolean copy(List<File> srcFiles, String targetFilePath, int bufferSize) {
        boolean flag = false;
        /* 开始：循环遍历源文件 */
        for(File srcFile : srcFiles) {
            InputStream in = null;    //文件输入流
            OutputStream out = null;  //文件输出流
            File targetFile = new File(targetFilePath);  //目标文件
            byte[] buffer = new byte[bufferSize];  //文件缓冲区
            try {
                in = new BufferedInputStream(new FileInputStream(srcFile));        //构造输入流
                out = new BufferedOutputStream(new FileOutputStream(targetFile));  //构造输出流
                /* 读写文件 */
                while(in.read(buffer) != -1) {
                    out.write(buffer);
                }
                out.flush();  //刷新输出流
                flag = true;
            /* IO异常处理（构造流时） */
            } catch (IOException ex) {
                Logger.getLogger(FileUtils.class.getName()).log(Level.SEVERE, null, ex);
            } finally {
                try {
                    out.close();  //关闭输出流
                    in.close();   //关闭输入流
                /* IO异常处理（关闭流时） */
                } catch (IOException ex) {
                    Logger.getLogger(FileUtils.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }        
        return flag;
    }
}
