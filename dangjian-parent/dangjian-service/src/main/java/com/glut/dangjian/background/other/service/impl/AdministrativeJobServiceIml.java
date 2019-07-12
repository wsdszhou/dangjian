package com.glut.dangjian.background.other.service.impl;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.glut.dangjian.background.other.service.AdministrativeJobService;
import com.glut.dangjian.entity.other.Xzzwb;
import com.glut.dangjian.mapper.background.other.AdministrativeJobMapper;

/** 
* @author xulankong
* @date 创建时间:  2018年8月24日 下午10:17:55
* @version 1.0
*/
@Service("administrativeJobService")
@Transactional(propagation=Propagation.NESTED)
public class AdministrativeJobServiceIml implements AdministrativeJobService{   

    @Autowired
    private AdministrativeJobMapper administrativeJobMapper;
    
    @Override
    public List<Xzzwb> loadAdministrativeJobAll() {
        
        return administrativeJobMapper.loadAdministrativeJobAll();
    }

    /**
     * 获取所有的行政职务
     */
    @Override
    @Cacheable(value="otherCache", key="AdministrativeJob"  )
    public Map<String, Integer> getAll() {
        List<Xzzwb> xzzwbs = administrativeJobMapper.loadAdministrativeJobAll();
        Map<String, Integer> map = new HashMap<String, Integer>();
        Iterator iterator = xzzwbs.iterator();
        Xzzwb xzzwb = null;
        while(iterator.hasNext()) {
            xzzwb = (Xzzwb) iterator.next();
            map.put(xzzwb.getXzzwMc(), xzzwb.getXzzwId());
        }
        return map;
    }

}
