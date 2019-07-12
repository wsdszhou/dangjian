package com.glut.dangjian.service.user;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.glut.dangjian.entity.user.Yhb;
import com.glut.dangjian.entity.view.ViewYhxx;

public interface UserService {
    
    /**
     * 修改密码
     * @param yh 用户对象
     */
    public void updateYhPassword(Yhb yh);

    public void updateViewUserInfo(ViewYhxx viewYhxx);

    public ViewYhxx getUserInfo(Yhb yhb);

    public void updateUserPassword(Yhb yhb);

    public PageInfo<ViewYhxx> loadUserInfoPageList(Integer pageNum, Integer pageSize, ViewYhxx viewYhxx);

    public ViewYhxx getYhxx(Yhb yhb);

    public void saveUser(ViewYhxx viewYhxx);

    public void deleteUser(String[] userIds);

    // 批量保存用户
    public void saveBatchUser(List<ViewYhxx> viewYhxxs);

    public List<ViewYhxx> getUserAllList();

    public void updateUser(ViewYhxx viewYhxx);

    // 验证用户名是否存在
    public boolean validateUserName(String userName);

    // 用户授权
    public void authorityUser(ViewYhxx viewYhxx);

    public boolean validateInformation(ViewYhxx viewYhxx);

    public void setPasswordByUserMc(String userMc, String password);

    public boolean validatePassword(String oldPassword, String newPassword, Yhb yhb);

    // 修改头像
    public void updatePortrait(String string, Yhb yhb);

    public Yhb getUserByuserName(String userMc);

    

    
}
