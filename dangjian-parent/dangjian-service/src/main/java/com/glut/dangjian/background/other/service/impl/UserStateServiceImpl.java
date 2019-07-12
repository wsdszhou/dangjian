package com.glut.dangjian.background.other.service.impl;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.glut.dangjian.background.other.service.UserStateService;
import com.glut.dangjian.entity.other.Zzmmb;
import com.glut.dangjian.entity.user.YhZtb;
import com.glut.dangjian.mapper.background.other.UserStateMapper;

/** 
* @author xulankong
* @date 创建时间:  2018年8月24日 下午9:08:46
* @version 1.0
*/
@Service
@Transactional
public class UserStateServiceImpl implements UserStateService{

    @Autowired
    private UserStateMapper userStateMapper;
    
    @Override
    @Cacheable(value="otherCache", key="'UserState'+'#root.methodName'"  )
    public List<YhZtb> loadUserStateAll() {
        
        return userStateMapper.loadUserStateAll();
    }

    @Override
    @Cacheable(value="otherCache", key="'UserState'+'#root.methodName'"  )
    public Map<String, Integer>  getAll() {
        
        List<YhZtb> yhZtbs = userStateMapper.loadUserStateAll();
        Map<String, Integer> map = new HashMap<String, Integer>();
        Iterator iterator = yhZtbs.iterator();
        YhZtb yhZtb = null;
        while(iterator.hasNext()) {
            yhZtb = (YhZtb) iterator.next();
            map.put(yhZtb.getZtMc(), yhZtb.getZtId());
        }
        return map;
    }

}
