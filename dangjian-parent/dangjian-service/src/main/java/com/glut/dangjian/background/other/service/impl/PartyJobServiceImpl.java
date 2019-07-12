package com.glut.dangjian.background.other.service.impl;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.glut.dangjian.background.other.service.PartyJobService;
import com.glut.dangjian.entity.other.Dnzwb;
import com.glut.dangjian.entity.other.Mzb;
import com.glut.dangjian.mapper.background.other.PartyJobMapper;

/** 
* @author xulankong
* @date 创建时间:  2018年8月24日 下午10:12:15
* @version 1.0
*/
@Service
@Transactional
public class PartyJobServiceImpl implements PartyJobService{

    @Autowired
    private  PartyJobMapper partyJobMapper;
    
    @Override
    @Cacheable(value="otherCache", key="'PartyJob'+'#root.methodName'"  )
    public List<Dnzwb> loadPartyJobAll() {
        
        return partyJobMapper.loadPartyJobAll();
    }

    @Override
    @Cacheable(value="otherCache", key="'PartyJob'+'#root.methodName'"  )
    public Map<String, Integer> getAll() {
        
        List<Dnzwb> dnzwbs = partyJobMapper.loadPartyJobAll();
        Map<String, Integer> map = new HashMap<String, Integer>();
        Iterator iterator = dnzwbs.iterator();
        Dnzwb dnzwb = null;
        while(iterator.hasNext()) {
            dnzwb = (Dnzwb) iterator.next();
            map.put(dnzwb.getDnzwMc(), dnzwb.getDnzwId());
        }
        return map;
    }

}
