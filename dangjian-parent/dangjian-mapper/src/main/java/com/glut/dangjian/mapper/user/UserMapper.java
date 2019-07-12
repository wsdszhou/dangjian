package com.glut.dangjian.mapper.user;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.glut.dangjian.entity.authority.UserRole;
import com.glut.dangjian.entity.user.YhXxb;
import com.glut.dangjian.entity.user.Yhb;

public interface UserMapper {

     Yhb getYhByYhmc(String userMc);

     Yhb getYhByWxm(String wxm);

     void updateYhPassword(Yhb yhb);

     String getUserIdByUserName(String xwYhm);

     void insertUser(Yhb yhb);
     
     void insertUserIfNot(Yhb yhb);

     void insertUserInfoIfNot(YhXxb yhXxb);
    
    void updateUser(Yhb yhb);
    
    void deleteUserById(String userId);
    
    void deleteUserInfoById(String userId);

    void addUserRole(UserRole userRole);
    
    void deleteUserRoleByRoleId(Integer roleId);
    
    void deleteUserRoleByUserId(String userId);

    // 批量添加用户
    void batchAddUser(@Param("yhbs") List<Yhb> yhbs);

    // 批量添加用户信息
    void batchAddUserInfo(@Param("yhXxbs") List<YhXxb> yhXxbs);

    void updateUserInfo(YhXxb yhXxb);

    void setPasswordByUserMc(@Param("userMc") String userMc, @Param("password") String password);

    String getPaawordByUserId(String userId);

    void updatePassword(@Param("newPassword")String newPassword, @Param("userId")String userId);

    // 修改头像
    void updatePortrait(@Param("portrait")String portrait, @Param("userId")String userId);

    Yhb getUserByuserName(String userMc);

}
