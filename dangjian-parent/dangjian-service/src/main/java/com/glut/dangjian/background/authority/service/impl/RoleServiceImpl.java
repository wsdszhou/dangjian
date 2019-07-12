package com.glut.dangjian.background.authority.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.glut.dangjian.background.authority.service.RoleService;
import com.glut.dangjian.entity.authority.FunctionRole;
import com.glut.dangjian.entity.authority.Role;
import com.glut.dangjian.entity.authority.UserRole;
import com.glut.dangjian.entity.user.Yhb;
import com.glut.dangjian.mapper.authority.RoleFuntionMapper;
import com.glut.dangjian.mapper.authority.RoleMapper;
import com.glut.dangjian.mapper.authority.UserRoleMapper;

/** 
* @author xulankong
* @date 创建时间:  2018年8月22日 上午11:19:51
* @version 1.0
*/
@Service
@Transactional
public class RoleServiceImpl implements RoleService{

    @Autowired
    private RoleMapper roleMapper;
    
    @Autowired
    private RoleFuntionMapper roleFuntionMapper;
    
    @Autowired
    private UserRoleMapper userRoleMapper;

    /**
     * 分页查询
     */
    @Override
    public PageInfo<Role> getRolePageList(Integer pageNum, Integer pageSize, Role role) {
        
        PageHelper.startPage(pageNum, pageSize);
        List<Role> roles = roleMapper.getRolePageList(role);
        return new PageInfo<Role>(roles);
    }

    /**
     * 添加角色
     */
    @Override
    @CacheEvict(value="roleCache", allEntries=true)
    public void saveRole(Role role, String[] functionIds) {
        role.setJsXgsj(new Date());
        roleMapper.insertSelective(role);
        Integer roleId = roleMapper.getIdByName(role.getJsMc());
        roleFuntionMapper.addRoleFunctionBatch(roleId, functionIds);
    }

    /**
     * 修改角色
     */
    @Override
    @CacheEvict(value="roleCache", allEntries=true)
    public void updateRole(Role role, String[] functionIds) {
        role.setJsXgsj(new Date());
        roleFuntionMapper.deleteRoleFunctionByRoleId(role.getJsId());
        roleFuntionMapper.updatRoleFunctionBatch(role, functionIds);
    }

    /**
     * 删除角色
     */
    @Override
    @CacheEvict(value="roleCache", allEntries=true)
    public void deleteBatchRole(String[] roleIds) {
        int[] ids = new int[roleIds.length];
        for (int i = 0; i < roleIds.length; i++) {
            ids[i] = Integer.parseInt(roleIds[i]);
        }
        roleMapper.deleteBatchById(ids);
    }
    
    /**
     * 加载所有的角色
     */
    @Override
    @Cacheable(value="roleCache",key="'#root.methodName'+'--'+'#p0'")
    public List<Role> loadRoleListById(String userId) {
        
        return roleMapper.loadRoleListById(userId);
    }



    /**
     * 用户授权
     */
    @Override
    @CacheEvict(value="roleCache", allEntries=true)
    public void authorityUser(String userId, Integer[] roleIds) {

        userRoleMapper.deleteRoleUserByUserId(userId);
        if(roleIds != null && roleIds.length != 0)
            userRoleMapper.addUserRoleBatch(userId, roleIds);
    }

    /**
     * 根据用户userId查询角色
     * @param userId
     * @return
     */
    @Override
    //@Cacheable(value="roleCache",key="'#root.methodName'+'--'+'#p0'")
    public List<Role> loadRoleListByUserId(String userId) {
        return roleMapper.loadRoleListByUserId(userId);
    }

    @Override
    @Cacheable(value="roleCache",key="'#root.methodName'+'--'+'#p0.getUserId()'")
    public List<Role> loadRoleList(Yhb yhb) {
        if (yhb.getUserMc().equals("admin")) {
          return  roleMapper.getRoleAllList(); 
        } else {
            return roleMapper.getRoleListById(yhb.getUserId());
        }
    }


}
