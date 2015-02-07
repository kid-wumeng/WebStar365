package com.webstar365.dao;

import com.webstar365.pojo.Echo;
import com.webstar365.pojo.SearchCondition;
import java.util.List;

public interface EchoDAO {
    
    public List<Echo> findEchoesByCommentId(SearchCondition searchCondition);  //查询回应（按评论编号）
    public Long addEcho(Echo echo);  //添加回应
    public Long countEchoNumByCommentId(Long commentId);  //统计回应数量（按评论编号）
    
}
