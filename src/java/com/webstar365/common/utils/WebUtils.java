package com.webstar365.common.utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;

public class WebUtils {
    
    /**
     * 获取网站根路径
     * @return 网站根路径
     */
    public static String getRootPath() {
        HttpServletRequest request = ServletActionContext.getRequest ();
        return request.getSession().getServletContext().getRealPath("\\");
    }
    
    /**
     * 读取Cookie的值
     * @param cookies 全部Cookie
     * @param cookieName 要读取的Cookie名
     * @return 成功：符合条件的Cookie值 | 失败：null
     */
    public static String getCookieValue(Cookie[] cookies, String cookieName) {
        String cookieValue = null;
        for(Cookie cookie : cookies) {
            if(cookie.getName().equals(cookieName)) {
                cookieValue = cookie.getValue();
                break;
            }
        }        
        return cookieValue;
    }
    
}
