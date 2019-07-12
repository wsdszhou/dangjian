package com.glut.dangjian.background.news.service.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.glut.dangjian.background.news.service.VideoService;
import com.glut.dangjian.entity.news.XwTpb;
import com.glut.dangjian.entity.news.Xwb;
import com.glut.dangjian.entity.other.Sp;
import com.glut.dangjian.entity.user.Yhb;
import com.glut.dangjian.mapper.background.other.VideoMapper;
import com.glut.dangjian.mapper.background.picture.XwTpbMapper;
import com.glut.dangjian.utils.StringTools;

@Service("videoService")
@Transactional
public class VideoServiceImpl implements VideoService{

    @Autowired
    private VideoMapper videoMapper;
    
    @Autowired
    private XwTpbMapper xwTpbMapper;
    /**
     * 分页查询视频
     */
    @Override
    public PageInfo<Sp> getVideoPageList(Integer pageNum, Integer pageSize, Sp xwSp) {
        
        PageHelper.startPage(pageNum, pageSize);
        List<Sp> xwSps = videoMapper.getVideoPageList(xwSp);
        return new PageInfo<Sp>(xwSps);
    }

    /**
     * 修改图片信息
     */
    @Override
    public void updateVideo(Sp sp) {
        sp.setSpScsj(new Date());
        videoMapper.updateByPrimaryKeySelective(sp);
    }


    /**
     * 保存本地视频
     */
    @Override
    public void saveVideo(Sp sp, String pictureId, Yhb yhb) {
        sp.setSpId(StringTools.getUUID());
        sp.setSpScsj(new Date());
        videoMapper.insertSelective(sp);
        if ( pictureId != null ) {
            String[] pictureIds = pictureId.split(",");
            List<XwTpb> list = new ArrayList<>();
            for(String id : pictureIds) {
                XwTpb picture = xwTpbMapper.getTpbByTpId(id);
                picture.setXwb(new Xwb(sp.getSpId()));
                list.add(picture);
            }
            xwTpbMapper.updateBranch(list);
        }
    }

    /**
     * 批量删除视频
     */
    @Override
    public void deleteBatchPicture(String[] spIds,String rootPath) {
        // TODO Auto-generated method stub
        for(int i=0;i<spIds.length;i++){
            Sp sp = videoMapper.selectByPrimaryKey(spIds[i]);
            File file = new File(rootPath,sp.getSpLj());
            if(file.delete()){
                System.out.println(spIds[i]+"被删除！");
            }
        }
        videoMapper.deleteBySpId(spIds);
    }
    
}
