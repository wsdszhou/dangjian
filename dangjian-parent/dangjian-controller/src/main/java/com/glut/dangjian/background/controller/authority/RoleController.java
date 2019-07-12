package com.glut.dangjian.background.controller.authority;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.glut.dangjian.background.authority.service.RoleService;
import com.glut.dangjian.entity.authority.Role;
import com.glut.dangjian.entity.common.Result;
import com.glut.dangjian.entity.user.Yhb;
import com.glut.dangjian.pojo.PageBean;

/** 
* @author xulankong
* @date 创建时间:  2018年8月22日 上午11:13:58
* @version 1.0
*/
@Controller
@RequestMapping("back/role/")
public class RoleController {

    private static final String LIST = "background/system/authority/roleList";
    
    @Autowired
    private RoleService  roleService;
    
   @RequestMapping(value="toList",method=RequestMethod.GET)
   public String gotoList() {
       return LIST;
   }
   /**
    * 加载当前用户所有角色
    * @param session
    * @return
    */
   @RequestMapping(value="loadUserRoleList", method=RequestMethod.POST)
   @ResponseBody
   public List<Role> loadUserRoleList(HttpSession session){
       Yhb yhb = (Yhb) session.getAttribute("yhb");
       return roleService.loadRoleList(yhb);
   }
   
   /**
    * 获取当前用户已经拥有的额角色
    * @param userId
    * @return
    */
   @RequestMapping(value="getRoles/{userId}", method=RequestMethod.POST)
   @ResponseBody
   public List<Role> getRoles(@PathVariable("userId") String userId){
       return roleService.loadRoleListByUserId(userId);
   }

   /**
    * 加载权限
    * @return
    */
   @RequestMapping(value="loadRoleList", method=RequestMethod.POST)
   @ResponseBody
   public List<Role> loadRoleList(HttpSession session){
       
       Yhb yhb = (Yhb) session.getAttribute("yhb");
       
       return roleService.loadRoleListById(yhb.getUserId());
   }
   
   /**
    * 分页查询
    * @param pageNum
    * @param pageSize
    * @param role
    * @return
    */
   @RequestMapping(value="getRolePageList", method=RequestMethod.POST)
   @ResponseBody
   public PageBean getRolePageList(@RequestParam("page") Integer pageNum,
           @RequestParam("rows") Integer pageSize, Role role) {
       
       PageInfo<Role> pageInfo = roleService.getRolePageList(pageNum, pageSize, role );
       return new PageBean(pageInfo.getTotal(), pageInfo.getList());
   }
   
   /**
    * 添加角色
    * @param role
    * @return
    */
   @RequestMapping(value="saveRole",method=RequestMethod.POST)
   @ResponseBody
   public Result saveRole(Role role) {
       
       String[] functionIds = role.getQxIds().split(",");
       roleService.saveRole(role, functionIds);
       return new Result(0, null, null);
   }
   
   /**
    * 修改角色
    * @param role
    * @return
    */
   @RequestMapping(value="updateRole",method=RequestMethod.POST)
   @ResponseBody
   public Result updateRole(Role role) {
       
       String[] functionIds = role.getQxIds().split(",");
       roleService.updateRole(role, functionIds);
       return new Result(0, null, null);
   }
   
   /**
    * 批量删除角色
    * @param ids
    */
   @ResponseBody
   @RequestMapping(value="deleteBatchRole/{ids}",method=RequestMethod.POST)
   public Result deleteBatchRole(@PathVariable("ids") String ids) {
       
       String[] roleIds = ids.split(",");
       roleService.deleteBatchRole(roleIds);
       return new Result(0, null, null);
   }
   
    
}
