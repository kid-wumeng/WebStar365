package com.webstar365.dao.impl;

import com.webstar365.dao.CatDAO;
import com.webstar365.pojo.Cat;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

public class CatMyBatisDAOImpl extends SqlMapClientDaoSupport implements CatDAO {

    /**
     * 查询分类（按分类编号）
     * @param catId 分类编号
     * @return 成功：符合条件的分类 | 失败：null
     */
    public Cat findCatByCatId(Integer catId) {
        return (Cat) getSqlMapClientTemplate().queryForObject("findCatByCatId", catId);
    }
    
    /**
     * 查询全部分类
     * @return 成功：全部分类的集合 | 失败：null
     */
    public List<Cat> findAllCats() {
        return (List<Cat>) getSqlMapClientTemplate().queryForList("findAllCats");
    }
    
}
