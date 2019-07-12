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
import com.glut.dangjian.background.authority.service.FunctionService;
import com.glut.dangjian.entity.authority.Function;
import com.glut.dangjian.entity.authority.FunctionRole;
import com.glut.dangjian.entity.user.Yhb;
import com.glut.dangjian.mapper.authority.FunctionMapper;
import com.glut.dangjian.mapper.system.view.ViewUserRoleFunctionMapper;

/** 
* @author xulankong
* @date 创建时间:  2018年8月23日 上午9:27:14
* @version 1.0
*/
@Service
@Transactional
public class FunctionServiceImpl implements FunctionService{

    @Autowired
    private FunctionMapper functionMapper;
    
    /**
     * 获取用户功能模块
     */
    @Override
    public List<Function> getFunctionList(Yhb yhb) {
        
        if (yhb.getUserMc().equals("admin")) {
            return functionMapper.getFunctionList();
        } else {
            return functionMapper.getFunctionListByuserId(yhb.getUserId());
        }
    }

    /**
     * 分页查询功能模块
     */
    @Override
    public PageInfo<Function> getFunctionPageList(Integer pageNum, Integer pageSize, Function function) {
        
        PageHelper.startPage(pageNum, pageSize);
        List<Function> functions = functionMapper.getFunctionPageList(function);
        return new PageInfo<Function>(functions);
    }

    /**
    * 获取所有的模块
    * 对象包含id、名称、父id
    */
    @Override
    @Cacheable(value="functionCache", key="#root.methodName" )
    public List<Function> getFunctionAllList() {
        
        return functionMapper.getFunctionAllList();
    }

    /**
     * 添加权限或者模块
     */
    @Override
    @CacheEvict(value="functionCache", allEntries=true)
    public void saveFunction(Function function) {
        
        function.setMkXgsj(new Date());
        functionMapper.insertSelective(function);
    }

    /**
     * 修改功能模块权限
     * @param function
     * @return
     */
    @Override
    @CacheEvict(value="functionCache", allEntries=true)
    public void updateFunction(Function function) {
        function.setMkXgsj(new Date());
        functionMapper.updateByIdSelective(function);
    }

    /**
     * 批量删除功能模块权限
     * @param ids
     */
    @Override
    @CacheEvict(value="functionCache", allEntries=true)
    public void deleteBacthFunction(String[] mkIds) {
        
        for(String id : mkIds) {
            functionMapper.deleteById(Integer.parseInt(id));
        }
    }

    @Override
    public List<FunctionRole> loadFunctonListByRoleId(Integer roleId) {
        
        return functionMapper.loadFunctonListByRoleId(roleId);
    }


}
