package com.glut.dangjian.background.other.service.impl;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.glut.dangjian.background.other.service.PoliticsStateService;
import com.glut.dangjian.entity.other.Dnzwb;
import com.glut.dangjian.entity.other.Zzmmb;
import com.glut.dangjian.mapper.background.other.PoliticsStateMapper;

/** 
* @author xulankong
* @date 创建时间:  2018年8月24日 下午9:50:18
* @version 1.0
*/
@Service
@Transactional
public class PoliticsStateServiceImpl implements PoliticsStateService{

    @Autowired
    private PoliticsStateMapper politicsStateMapper;
    
    /**
     * 加载政治面貌
     */
    @Override
    @Cacheable(value="otherCache", key="'Politics'+'#root.methodName'"  )
    public List<Zzmmb> loadPoliticsStateAll() {
        
        return politicsStateMapper.loadPoliticsStateAll();
    }

    @Override
    @Cacheable(value="otherCache", key="'Politics'+'#root.methodName'"  )
    public Map<String, Integer> getAll() {
        
        List<Zzmmb> zzmmbs = politicsStateMapper.loadPoliticsStateAll();
        Map<String, Integer> map = new HashMap<String, Integer>();
        Iterator iterator = zzmmbs.iterator();
        Zzmmb zzmmb = null;
        while(iterator.hasNext()) {
            zzmmb = (Zzmmb) iterator.next();
            map.put(zzmmb.getZzmmMc(), zzmmb.getZzmmId());
        }
        return map;
    }

}
