package com.webstar365.action.interceptor;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.webstar365.pojo.User;
import com.webstar365.service.UserService;
import java.util.Map;

public class UserCookieInterceptor extends AbstractInterceptor {

    private UserService userService;
    
    public String intercept(ActionInvocation actionInvocation) throws Exception {
        Map session = actionInvocation.getInvocationContext().getSession();
        User user = (User) session.get("USER");
        if(user == null) {
            user = getUserService().checkUserCookie();
            if(user != null) {
                ActionContext.getContext().getSession().put("USER", user);
            }
        }
        return actionInvocation.invoke();
    }

    public UserService getUserService() { return userService; }
    public void setUserService(UserService userService) { this.userService = userService; }
    
}
