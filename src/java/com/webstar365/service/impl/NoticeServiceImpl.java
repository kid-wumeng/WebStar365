package com.webstar365.service.impl;

import com.webstar365.dao.NoticeDAO;
import com.webstar365.pojo.Notice;
import com.webstar365.service.NoticeService;

public class NoticeServiceImpl implements NoticeService {

    private NoticeDAO noticeDAO;
    
    /**
     * 查询新公告
     * @return 成功：新公告 | 失败：null
     */
    public Notice findNewNotice() {
        return noticeDAO.findNewNotice();
    }
    
    /* getter */
    public NoticeDAO getNoticeDAO() { return noticeDAO; }
    /* setter */
    public void setNoticeDAO(NoticeDAO noticeDAO) { this.noticeDAO = noticeDAO; }
    
}
