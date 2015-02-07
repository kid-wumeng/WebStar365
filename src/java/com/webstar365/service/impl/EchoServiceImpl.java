package com.webstar365.service.impl;

import com.webstar365.dao.EchoDAO;
import com.webstar365.pojo.Echo;
import com.webstar365.pojo.SearchCondition;
import com.webstar365.service.EchoService;
import java.util.List;

public class EchoServiceImpl implements EchoService {

    private EchoDAO echoDAO;
    private List<Echo> echoes;
    
    /**
     * 查询回应（按评论编号）
     * @param searchCondition 搜索条件（包含评论编号、页码、页尺寸）
     * @return 成功：符合条件的回应的集合 | 失败：null
     */
    public List<Echo> findEchoesByCommentId(SearchCondition searchCondition) {
        searchCondition.getPage().setPageSize(searchCondition.getPage().getEchoPageSize());  //使用回应页尺寸
        echoes = echoDAO.findEchoesByCommentId(searchCondition);
        for(Echo echo : echoes) {
            /* 将回应内容中的换行符换成<br /> */
            if(echo.getEchoContent() != null) {
                echo.setEchoContent(echo.getEchoContent().replaceAll("\n", "<br />"));
            }
        }
        return echoes;
    }
    
    /**
     * 添加回应
     * @param echo 新回应
     * @return 成功：1 | 失败：null
     */
    public boolean addEcho(Echo echo) {
        Long flag = echoDAO.addEcho(echo);
        if(flag == 1) {
            return true;
        }
        else {
            return false;
        }
    }
    
    /**
     * 统计回应数量（按评论编号）
     * @param commentId 评论编号
     * @return 成功：回应数量 | 失败：null
     */
    public Long countEchoNumByCommentId(Long commentId) {
        return echoDAO.countEchoNumByCommentId(commentId);
    }

    /* getter */
    public EchoDAO getEchoDAO() { return echoDAO; }
    /* setter */
    public void setEchoDAO(EchoDAO echoDAO) { this.echoDAO = echoDAO; }
    
}
