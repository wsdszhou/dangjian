package com.glut.dangjian.background.other.service;

import java.util.List;
import java.util.Map;

import com.glut.dangjian.entity.other.Dnzwb;

/** 
* @author xulankong
* @date 创建时间:  2018年8月24日 下午10:12:09
* @version 1.0
*/
public interface PartyJobService {

    List<Dnzwb> loadPartyJobAll();

    Map<String, Integer> getAll();

}
