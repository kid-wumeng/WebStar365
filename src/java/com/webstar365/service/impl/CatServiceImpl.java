package com.webstar365.service.impl;

import com.webstar365.dao.CatDAO;
import com.webstar365.pojo.Cat;
import com.webstar365.service.CatService;
import java.util.List;

public class CatServiceImpl implements CatService {

    private CatDAO catDAO;  //分类DAO
    private Cat cat;  //分类
    private List<Cat> cats;  //分类的集合
    
    /**
     * 查询分类（按分类编号）
     * @param catId 分类编号
     * @return 成功：符合条件的分类 | 失败：null
     */
    public Cat findCatByCatId(Integer catId) {
        return catDAO.findCatByCatId(catId);
    }
    
    /**
     * 查询全部分类
     * @return 成功：全部分类的集合 | 失败：null
     */
    public List<Cat> findAllCats() {
        return catDAO.findAllCats();
    }
    
    public List<Cat> findAllCatsWithNull() {
        cats = catDAO.findAllCats();
        cat = new Cat();
        cat.setCatId(0);
        cat.setCatName("");
        cats.add(0, cat);
        return cats;
    }

    /* getter */
    public CatDAO getCatDAO() { return catDAO; }
    /* setter */
    public void setCatDAO(CatDAO catDAO) { this.catDAO = catDAO; }

    
}
