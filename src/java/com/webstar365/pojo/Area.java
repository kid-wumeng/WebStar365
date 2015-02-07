package com.webstar365.pojo;

import java.util.List;

public class Area {
    
    private Integer areaId;   //地区编号
    private String areaName;  //地区名
    private Integer areaLv;   //地区级别
    private Integer parentAreaId;     //父地区编号
    private Area parentArea;  //父地区
    private List<Area> childrenArea;  //子地区 

    /* getter */
    public Integer getAreaId() { return areaId; }
    public String getAreaName() { return areaName; }
    public Integer getAreaLv() { return areaLv; }
    public Integer getParentAreaId() { return parentAreaId; }
    public Area getParentArea() { return parentArea; }
    public List<Area> getChildrenArea() { return childrenArea; }
    /* setter */
    public void setAreaId(Integer areaId) { this.areaId = areaId; }
    public void setAreaName(String areaName) { this.areaName = areaName; }
    public void setAreaLv(Integer areaLv) { this.areaLv = areaLv; }
    public void setParentAreaId(Integer parentAreaId) { this.parentAreaId = parentAreaId; }
    public void setParentArea(Area parentArea) { this.parentArea = parentArea; }
    public void setChildrenArea(List<Area> childrenArea) { this.childrenArea = childrenArea; }
    
}
