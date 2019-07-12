package com.glut.dangjian.background.other.service;

import java.util.List;
import java.util.Map;

import com.github.pagehelper.PageInfo;
import com.glut.dangjian.entity.department.Bmb;
import com.glut.dangjian.pojo.PageBean;

public interface DepartmentService {

	/**
	 * 加载所有的部门
	 * @return
	 */
    public List<Bmb> loadBmList();

    public PageInfo getBmList(Integer pageNum,Integer pageSize);

	void addBm(String bmMc);

	void editBm(Bmb bmb);

	void deleteBms(String[] tpIds);

    public Map<String, Integer> getAll();
}
