package com.glut.dangjian.background.other.service;

import java.util.List;
import java.util.Map;

import com.glut.dangjian.entity.other.Xlb;

/** 
* @author xulankong
* @date 创建时间:  2018年8月24日 下午9:39:31
* @version 1.0
*/
public interface EducationService {

    // 加载所有的学历
    List<Xlb> loadEducationAll();

    Map<String, Integer> getAll();

}
