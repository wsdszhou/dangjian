package com.glut.dangjian.background.system.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.glut.dangjian.background.system.service.SystemService;
import com.glut.dangjian.entity.other.Gnb;
import com.glut.dangjian.mapper.background.system.SystemMappper;

@Service("systemService")
@Transactional(propagation=Propagation.NESTED)
public class SystemServiceImpl implements SystemService{
    
    @Autowired
    private SystemMappper systemMappper;

    @Override
    @Cacheable(value="systemCache", key="#root.methodName"  )
    public List<Gnb> getMkbList() {
        
        List<Gnb> list = systemMappper.getMkbList();
        
        return list;
    }

    
    

}
