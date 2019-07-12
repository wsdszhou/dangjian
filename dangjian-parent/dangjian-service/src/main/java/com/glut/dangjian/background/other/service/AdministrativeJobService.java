package com.glut.dangjian.background.other.service;

import java.util.List;
import java.util.Map;

import com.glut.dangjian.entity.other.Xzzwb;

/** 
* @author xulankong
* @date 创建时间:  2018年8月24日 下午10:17:45
* @version 1.0
*/
public interface AdministrativeJobService {

    List<Xzzwb> loadAdministrativeJobAll();

    Map<String, Integer> getAll();

}
