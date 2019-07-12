package com.glut.dangjian.mapper.background.picture;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.glut.dangjian.entity.news.XwTpb;

public interface XwTpbMapper {
    
    /**
     * 根据图片ID删除图片
     * @param tpId
     * @return
     */
    public int deleteByTpId(String tpId);

    /**
     * 添加一张图片
     * @param record
     * @return
     */
    public int insert(XwTpb record);

    /**
     * 添加一张图片，并且每个字段是否为空
     * @param record
     * @return
     */
    public int insertSelective(XwTpb record);

    /**
     * 根据图片id查询图片
     * @param tpId
     * @return
     */
    public XwTpb getTpbByTpId(String tpId);

    /**
     * 修改图片信息，并且每个字段是否为空 
     * @param record
     * @return
     */
    public int updateByTpIdIfNull(XwTpb record);

    /**
     * 修改图片信息
     * @param record
     * @return
     */
    public int updateByTpId(XwTpb record);
    
    /**
     * 分页查询本地图片
     */
    public List<XwTpb> getLocalXwTpbPageList(XwTpb xwTpb);

    /**
     * 分页查询远程图片
     */
    public List<XwTpb> getFarXwTpbPageList(XwTpb xwTpb);

    public void updateBranch(@Param("xwTpbs")List<XwTpb> xwTpbs);

    public List<String> getPicturnUrlByNewsId(String newsId);
}