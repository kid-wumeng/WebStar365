package com.webstar365.dao.impl;

import com.webstar365.dao.AreaDAO;
import com.webstar365.pojo.Area;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

public class AreaMyBatisDAOImpl extends SqlMapClientDaoSupport implements AreaDAO {

    
    /**
     * 查询地区（按地区编号）
     * @param areaId 地区编号
     * @return 成功：符合条件的地区 | 失败：null
     */
    public Area findAreaByAreaId(Integer areaId) {
        return (Area) getSqlMapClientTemplate().queryForObject("findAreaByAreaId", areaId);
    }
        
    /**
     * 查询地区（按地区级别，上级地区编号）
     * @param area 地区（包含地区级别、上级地区编号）
     * @return 成功：符合条件的地区的集合 | 失败：null
     */
    public List<Area> findAreaByAreaLvAndParentAreaId(Area area) {
        return getSqlMapClientTemplate().queryForList("findAreaByAreaLvAndParentAreaId", area);
    }

}
