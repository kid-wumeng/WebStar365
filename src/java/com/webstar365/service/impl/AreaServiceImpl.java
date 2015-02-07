package com.webstar365.service.impl;

import com.webstar365.dao.AreaDAO;
import com.webstar365.pojo.Area;
import com.webstar365.service.AreaService;
import java.util.List;

public class AreaServiceImpl implements AreaService {

    private AreaDAO areaDAO;
    private Area area;
    private List<Area> areas;
    
    /**
     * 查询地区
     * @return 成功：符合条件的地区的集合 | 失败：null
     */
    public List<Area> findAreas() {
        /* 查询一级地区 */
        Area area = new Area();
        area.setAreaLv(1);  
        area.setParentAreaId(null);  
        areas = areaDAO.findAreaByAreaLvAndParentAreaId(area);
        /* 查询二级地区 */
        for(Area lv1Area : areas) {
            lv1Area.setAreaLv(2);
            lv1Area.setParentAreaId(lv1Area.getAreaId());
            lv1Area.setChildrenArea(areaDAO.findAreaByAreaLvAndParentAreaId(lv1Area));
            /* 给二级地区添加“无限” */
            Area unsureArea = new Area();  
            unsureArea.setAreaId(0);
            unsureArea.setAreaName("不限");
            lv1Area.getChildrenArea().add(0, unsureArea);
        }
        /* 给一级地区添加“无限” */
        Area unsureArea = new Area();  
        unsureArea.setAreaId(0);
        unsureArea.setAreaName("不限");
        areas.add(0, unsureArea);
        return areas;
    }
    
    /* getter */
    public AreaDAO getAreaDAO() { return areaDAO; }
    /* setter */
    public void setAreaDAO(AreaDAO areaDAO) { this.areaDAO = areaDAO; }
    
}
