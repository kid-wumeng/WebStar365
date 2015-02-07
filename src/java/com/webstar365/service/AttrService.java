package com.webstar365.service;

import com.webstar365.pojo.Attr;
import java.util.List;

public interface AttrService {
    
        public Attr findAttrByAttrId(Long attrId);  //查询属性（按属性编号）
        public List<Attr> findAllAttrs();  //查询全部属性
        public List<Attr> findHotAttrs();  //查询热门属性
        public List<Attr> findAttrsByWebsiteId(int websiteId);  //查询属性（按网站编号）
        public Long addAttr(Attr attr);  //添加一个属性
        public Attr modifyAttrNameByAttrId(Attr attr);  //修改一个属性名（按属性编号）
        public Attr modifyAttrIntroByAttrId(Attr attr);  //修改一个属性介绍（按属性编号）
        public void deleteAttrByAttrId(Long attrId);  //删除一个属性（按属性编号）
        
}
