package com.glut.dangjian.background.other.service.impl;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.glut.dangjian.background.other.service.EducationService;
import com.glut.dangjian.entity.department.Bmb;
import com.glut.dangjian.entity.other.Xlb;
import com.glut.dangjian.mapper.background.other.EducationMapper;

/** 
* @author xulankong
* @date 创建时间:  2018年8月24日 下午9:39:44
* @version 1.0
*/
@Service
@Transactional
public class EducationServiceImpl implements EducationService{

    @Autowired
    private EducationMapper educationMapper;
    
    /**
     * 加载所有的学历
     */
    @Override
    //@Cacheable(value="otherCache", key="Education")
    public List<Xlb> loadEducationAll() {
        
        return educationMapper.loadEducationAll();
    }

    /**
     * 获取所有的学历
     */
    @Override
    @Cacheable(value="otherCache", key="'Education'+'#root.methodName'"  )
    public Map<String, Integer> getAll() {
        
        List<Xlb> xlbs = educationMapper.loadEducationAll();
        Map<String, Integer> map = new HashMap<String, Integer>();
        Iterator iterator = xlbs.iterator();
        Xlb xlb = null;
        while(iterator.hasNext()) {
            xlb = (Xlb) iterator.next();
            map.put(xlb.getXlMc(), xlb.getXlId());
        }
        return map;
    }

}
