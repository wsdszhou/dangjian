package com.glut.dangjian.background.department.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.github.pagehelper.PageInfo;
import com.glut.dangjian.entity.department.Bmb;
import com.glut.dangjian.entity.user.Yhb;

public interface DepartmentService {

	/**
	 * 加载所有的部门
	 * @return
	 */
    public List<Bmb> loadBmList();

    public PageInfo getBmList(Integer pageNum,Integer pageSize);

	void addBm(Bmb bmb, String pictureId, Yhb yhb);

	void editBm(Bmb bmb);

	void deleteBms(HttpServletRequest request, String[] tpIds);

    public Map<String, Integer> getAll();
}
