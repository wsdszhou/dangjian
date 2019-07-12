package com.glut.dangjian.background.other.service;

import java.util.List;
import java.util.Map;

import com.glut.dangjian.entity.other.Jgb;

public interface JgService {

    public List<Jgb> loadJgList();
    
    List<Jgb> getJgbListBySzsId(Integer szsId);

    public Map<String, Integer> getAll();
}
