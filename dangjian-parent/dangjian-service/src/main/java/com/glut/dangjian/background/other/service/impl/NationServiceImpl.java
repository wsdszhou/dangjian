package com.glut.dangjian.background.other.service.impl;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.glut.dangjian.background.other.service.NationService;
import com.glut.dangjian.entity.other.Jgb;
import com.glut.dangjian.entity.other.Mzb;
import com.glut.dangjian.mapper.background.other.NationMapper;

/** 
* @author xulankong
* @date 创建时间:  2018年8月24日 下午10:03:49
* @version 1.0
*/
@Service
@Transactional
public class NationServiceImpl implements NationService{
    
    @Autowired
    private NationMapper nationMapper;

    /**
     * 加载所有民族
     */
    @Override
    @Cacheable(value="otherCache", key="'Nation'+'#root.methodName'"  )
    public List<Mzb> loadNationAll() {
        
        return nationMapper.loadNationAll();
    }

    @Override
    @Cacheable(value="otherCache", key="'Nation'+'#root.methodName'"  )
    public Map<String, Integer> getAll() {
        
        List<Mzb> mzbs = nationMapper.loadNationAll();
        Map<String, Integer> map = new HashMap<String, Integer>();
        Iterator iterator = mzbs.iterator();
        Mzb mzb = null;
        while(iterator.hasNext()) {
            mzb = (Mzb) iterator.next();
            map.put(mzb.getMzMc(), mzb.getMzId());
        }
        return map;
    }

}
