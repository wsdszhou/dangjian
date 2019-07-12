package com.glut.dangjian.background.news.service;

import java.util.List;

import com.glut.dangjian.entity.other.Lmb;

public interface LmService {
    
    /**
     * 获取非首栏目
     * @return
     */
    public List<Lmb> getNotFirstLmbList();


	/**
	 * 获取所有栏目
	 * @return
	 */
	public List<Lmb> getLmbList();
    
    /**
     * 获取一级栏目
     * @return
     */
    public List<Lmb> getFirstLmbList();
    
    /**
     * 获取子栏目
     * @param lmId 栏目父id
     * @return
     */
    public List<Lmb> getChildrenLmbListByFid(Integer lmId);

    /**
     * 递归返回lmFid=pid的条目
     * @param list	源数据
     * @param pid	父id
     * @return
     */
    public List<Lmb> getChildGroup(List<Lmb> list,int pid);

	/**
	 * 添加传入的栏目
	 * @param lmb
	 */
    public Boolean addLmb(Lmb lmb);

	/**
	 * 根据id删除栏目
	 * @param id
	 */
    public void deleteLmbById(int id);

	/**
	 * 更新栏目
	 * @param lmb
	 * @return
	 */
	public boolean updateLmb(Lmb lmb);
}
