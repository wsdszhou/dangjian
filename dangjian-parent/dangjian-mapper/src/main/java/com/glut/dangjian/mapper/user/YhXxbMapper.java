package com.glut.dangjian.mapper.user;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.glut.dangjian.entity.user.YhXxb;
import com.glut.dangjian.entity.user.Yhb;
import com.glut.dangjian.entity.view.ViewYhxx;

/**
 * 用户信息mapper
 * @author XuLanKong
 *
 */
public interface YhXxbMapper {

    public YhXxb getYhxx();
    
    public int saveViewYhxx(ViewYhxx viewYhxx);

    public int insertViewYhxxByIf(ViewYhxx viewYhxx);
    
    public ViewYhxx getViewYhxxByUserId(String userId);
    
    public List<ViewYhxx> getListViewYhxx();
    
    public PageInfo<ViewYhxx> getViewYhxxPage(int pageNum, int pageSize);

    public YhXxb getYhxxByUserId(String userId);

}