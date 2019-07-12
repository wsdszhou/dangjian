package com.glut.dangjian.background.other.service;

import java.util.List;
import java.util.Map;

import com.glut.dangjian.entity.other.Zzmmb;

/** 
* @author xulankong
* @date 创建时间:  2018年8月24日 下午9:50:09
* @version 1.0
*/
public interface PoliticsStateService {

    // 加载政治面貌
    List<Zzmmb> loadPoliticsStateAll();

    Map<String, Integer> getAll();

}
