package com.glut.dangjian.background.other.service.impl;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.glut.dangjian.background.other.service.JgService;
import com.glut.dangjian.entity.other.Jgb;
import com.glut.dangjian.entity.other.Xlb;
import com.glut.dangjian.mapper.background.other.JgbMapper;

@Service("jgService")
@Transactional
public class JgServiceImpl implements JgService{

    @Autowired
    private JgbMapper jgbMapper;
    
    @Override
    @Cacheable(value="otherCache", key="'jg'+'#root.methodName'"  )
    public List<Jgb> loadJgList() {
        
        return jgbMapper.getJgbList();
    }

    @Override
    @Cacheable(value="otherCache", key="'Jg'+'#p0'"  )
    public List<Jgb> getJgbListBySzsId(Integer szsId) {
        
        return jgbMapper.getJgbListBySzsId(szsId);
    }

    @Override
    @Cacheable(value="otherCache", key="'jg'+'#root.methodName'"  )
    public Map<String, Integer> getAll() {
        
        List<Jgb> jgbs = jgbMapper.getJgbList();
        Map<String, Integer> map = new HashMap<String, Integer>();
        Iterator iterator = jgbs.iterator();
        Jgb jgb = null;
        while(iterator.hasNext()) {
            jgb = (Jgb) iterator.next();
            map.put(jgb.getJsSzqxMc(), jgb.getJgId());
        }
        return map;
    }

    
}
