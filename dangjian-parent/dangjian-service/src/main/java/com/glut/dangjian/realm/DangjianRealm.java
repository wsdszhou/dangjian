package com.glut.dangjian.realm;

import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import com.glut.dangjian.entity.authority.Function;
import com.glut.dangjian.entity.authority.Role;
import com.glut.dangjian.entity.system.view.ViewUserRoleFunction;
import com.glut.dangjian.entity.user.Yhb;
import com.glut.dangjian.mapper.authority.FunctionMapper;
import com.glut.dangjian.mapper.authority.RoleMapper;
import com.glut.dangjian.mapper.system.view.ViewUserRoleFunctionMapper;
import com.glut.dangjian.mapper.user.UserMapper;

/** 
* @author xulankong
* @date 创建时间:  2018年8月21日 上午8:55:59
* @version 1.0
*/
public class DangjianRealm extends AuthorizingRealm {

    @Autowired
    private UserMapper userMapper;
    
    @Autowired
    private FunctionMapper functionMapper;
    
    @Autowired
    private RoleMapper roleMapper;
    
    /**
     * 授权
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection arg0) {
        
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        Yhb yhb = (Yhb) SecurityUtils.getSubject().getPrincipal();
        List<Function> functions = null;
        List<Role> roles = null;
        
        if (yhb.getUserMc().equals("admin")) {
            functions = functionMapper.getFunctionAllList();
            roles = roleMapper.getRoleCodeAllList();
       }  else {
           functions = functionMapper.getFunctionCodeListByuserId(yhb.getUserId());
            roles = roleMapper.getRoleListById(yhb.getUserId());
        }
        // 把模块存储到shiro中
        for( Function function : functions ) {
            info.addStringPermission(function.getMkCode());
        }
        // 把角色存储到shiro中
        for( Role role : roles ) {
            info.addRole(role.getJsCode());
        }
        if (yhb.getUserMc().equals("admin")) {
            info.addRole("admin");
        }
        return info;
    }
    
    /**
     * 认证
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        //创建用户名和密码的令牌
        UsernamePasswordToken usernamePasswordToken = (UsernamePasswordToken) token;
        String userName = usernamePasswordToken.getUsername();
        
        //根据用户名查询密码
        Yhb yhb = userMapper.getYhByYhmc(userName);
        if (yhb == null) {
            // 用户名不存在
            return null;
        }
        // 认证信息对象 比较密码是否匹配,都是由shiro框架去做的
        AuthenticationInfo info = new SimpleAuthenticationInfo(yhb, yhb.getUserMm(), userName);
        return info;
    }
    
}
