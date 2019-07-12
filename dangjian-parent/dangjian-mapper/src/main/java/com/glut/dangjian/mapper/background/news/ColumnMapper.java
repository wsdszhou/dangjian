package com.glut.dangjian.mapper.background.news;

import java.util.List;

import com.glut.dangjian.entity.other.Lmb;

public interface ColumnMapper {
    int deleteByPrimaryKey(Integer lmId);

    int insert(Lmb record);

    int insertSelective(Lmb record);

    Lmb selectByPrimaryKey(Integer lmId);

    int updateByPrimaryKeySelective(Lmb record);

    int updateByPrimaryKey(Lmb record);

	/**
	 * 获取栏目id的最大值
	 * @return
	 */
    public int getMaxLmId();
    
    /**
     * 查询非首栏目信息
     * @return
     */
    public List<Lmb> getNotFirstLmbList();
    
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
     * 获取栏目列表
     * @return
     */
    public List<Lmb> getLmbList();

    /**
     * 获取栏目信息，根据栏目id
     * @param lmId
     * @return
     */
    Lmb getLmbByImId(Integer lmId);
}