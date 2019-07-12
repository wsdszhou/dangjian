package com.glut.dangjian.background.other.service;

import java.util.List;
import java.util.Map;

import com.glut.dangjian.entity.user.YhZtb;

/** 
* @author xulankong
* @date 创建时间:  2018年8月24日 下午9:08:38
* @version 1.0
*/
public interface UserStateService {

    // 加载用户状态
    List<YhZtb> loadUserStateAll();

    Map<String, Integer> getAll();

}
