package com.webstar365.service;

import com.webstar365.pojo.Cat;
import java.util.List;

public interface CatService {
    
    public Cat findCatByCatId(Integer catId);  //查询分类（按分类编号）
    public List<Cat> findAllCats();  //查询全部分类
    public List<Cat> findAllCatsWithNull();  //查询全部分类（额外增加一个空分类）
    
}
