package com.webstar365.dao;

import com.webstar365.pojo.Area;
import java.util.List;

public interface AreaDAO {
    
    public Area findAreaByAreaId(Integer areaId);  //查询地区（按地区编号）
    public List<Area> findAreaByAreaLvAndParentAreaId(Area area);  //查询地区（按地区级别、上级地区编号）
    
}
