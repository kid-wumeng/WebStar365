package com.webstar365.action.interceptor;

import com.webstar365.pojo.Admin;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import java.util.Map;

public class AdminLoginInterceptor extends AbstractInterceptor {
    
    public String intercept(ActionInvocation actionInvocation) throws Exception {
        Map session = actionInvocation.getInvocationContext().getSession();
        Admin admin = (Admin) session.get("ADMIN");
        if(admin != null) {
            return actionInvocation.invoke();
        }
        else {
            return "login";
        }
    }
}
