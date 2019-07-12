package com.glut.dangjian.mapper.system.view;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.glut.dangjian.entity.user.YhXxb;
import com.glut.dangjian.entity.user.Yhb;
import com.glut.dangjian.entity.view.ViewYhxx;

import net.sf.jsqlparser.statement.update.Update;

public interface ViewYhxxMapper {
    
    public int insertViewYhxx(ViewYhxx viewYhxx);

    public ViewYhxx getViewYhxxByUserId(String userId);
    
    public List<ViewYhxx> getListViewYhxx();
    
    public PageInfo<ViewYhxx> getViewYhxxPage(int pageNum, int pageSize);
    
    public void updateViewYhxx(ViewYhxx viewYhxx);
    
    public ViewYhxx getYhxxByUserId(Yhb yhb);

    // 根据用户名称获取信息
    public ViewYhxx getViewYhxxByUserName(String xwYhm);

    // 通过过yhb中的userMc字段获取信息
    public ViewYhxx getViewYhxxByUserMc(String userMc);

    // 通过过yhb中的id字段获取用户姓名
    public String getYhxxNameByUserId(String userId);

    // 根据userId获取部门id
    public Integer getBmIdByUserId(String userId);
    
    //  根据userId获取部门支部
    public Integer getZbIdByUserId(String userId);

    // 分页查询用户信息
    public List<ViewYhxx> loadUserInfoPageList(ViewYhxx viewYhxx);

    // 保存用户
    public void saveUser(ViewYhxx viewYhxx);

    // 删除用户
    public void deleteUserByUserId(String userId);

    // 根据用户id获取用户信息id
    public String getUserInfoIdByUserId(String userId);

    public String getUserInfoIdByPartyInfoId(String partyInfoId);

    public String getIdentityByUserMc(String userMc);

}