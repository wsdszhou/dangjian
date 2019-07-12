package com.glut.dangjian.background.other.service;

import java.util.List;
import java.util.Map;

import com.glut.dangjian.entity.other.Mzb;
import com.glut.dangjian.entity.other.Zzmmb;

/** 
* @author xulankong
* @date 创建时间:  2018年8月24日 下午10:03:35
* @version 1.0
*/
public interface NationService {

    // 加载所有名字
    List<Mzb> loadNationAll();

    Map<String, Integer> getAll();

}
