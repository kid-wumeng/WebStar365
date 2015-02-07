package com.webstar365.dao;

import com.webstar365.pojo.Cat;
import java.util.List;

public interface CatDAO {
    
    public Cat findCatByCatId(Integer catId);  //查询分类（按分类编号）
    public List<Cat> findAllCats();  //查询全部分类
    
}
