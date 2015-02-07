package com.webstar365.action.interceptor;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.webstar365.pojo.User;
import java.util.Map;

public class NowUserInterceptor extends AbstractInterceptor{

    public String intercept(ActionInvocation actionInvocation) throws Exception {
        Map session = actionInvocation.getInvocationContext().getSession();
        Map params = actionInvocation.getInvocationContext().getParameters();
        Long nowUserId = ((User) session.get("USER")).getUserId();
        Long userId = 0l; 
        if(params.get("user.userId") != null) {
            userId = Long.parseLong(((String[]) params.get("user.userId"))[0]);
        }
        else if(params.get("searchCondition.userId") != null) { 
            userId = Long.parseLong(((String[]) params.get("searchCondition.userId"))[0]);
        }
        else if(params.get("comment.commentUser.userId") != null) { 
            userId = Long.parseLong(((String[]) params.get("comment.commentUser.userId"))[0]);
        }
        if(userId.equals(nowUserId)) {
            return actionInvocation.invoke();
        }
        else {
            return "error";  //传参中的用户编号不是当前的用户编号
        }
    }

}

