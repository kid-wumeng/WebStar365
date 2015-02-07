package com.webstar365.action.interceptor;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.webstar365.pojo.User;
import java.util.Map;

public class UserNoLoginInterceptor extends AbstractInterceptor{
    
    public String intercept(ActionInvocation actionInvocation) throws Exception {
        Map session = actionInvocation.getInvocationContext().getSession();
        User user = (User) session.get("USER");
        if(user == null) {
            return actionInvocation.invoke();
        }
        else {
            return "index";
        }
    }
    
}
