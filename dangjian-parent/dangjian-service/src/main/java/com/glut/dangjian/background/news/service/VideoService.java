package com.glut.dangjian.background.news.service;

import com.github.pagehelper.PageInfo;
import com.glut.dangjian.entity.other.Sp;
import com.glut.dangjian.entity.user.Yhb;

public interface VideoService {

    /**
     * 分页查询本地图片
     */
    public PageInfo<Sp> getVideoPageList(Integer pageNum, Integer pageSize, Sp xwSp);
    
    /**
     * 修改图片信息
     * @param tpb
     */
    public void updateVideo( Sp xwSp);

    /**
     * 批量删除图片    
     * @param tpIds
     */
    public void deleteBatchPicture(String[] spIds,String rootPath);

    /**
     * 添加本地图片
     */
    public void saveVideo(Sp xwSp, String pictureId, Yhb yhb);

}
