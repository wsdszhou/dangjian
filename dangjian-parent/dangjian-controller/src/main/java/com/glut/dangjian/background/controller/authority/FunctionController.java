package com.glut.dangjian.background.controller.authority;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.glut.dangjian.background.authority.service.FunctionService;
import com.glut.dangjian.entity.authority.Function;
import com.glut.dangjian.entity.authority.FunctionRole;
import com.glut.dangjian.entity.authority.UserRole;
import com.glut.dangjian.entity.common.Result;
import com.glut.dangjian.pojo.ComboTree;
import com.glut.dangjian.pojo.PageBean;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

/** 
* @author xulankong
* @date 创建时间:  2018年8月23日 上午9:52:05
* @version 1.0
*/
@Controller
@RequestMapping(value="back/function/")
public class FunctionController {

    private final static String LIST = "background/system/authority/functionList";
    
    @Autowired
    private FunctionService functionService;
    
    /**
     * 进入权限模块
     * @return
     */
    @RequestMapping("toList")
    public String gotoList() {
        
        return LIST;
    }
    
    /**
     * 根据角色获取拥有的模块
     * @param roleId
     * @return
     */
    @RequestMapping(value="loadFunctonListByRoleId/{roleId}", method=RequestMethod.POST)
    @ResponseBody
    public List<FunctionRole> loadFunctonListByRoleId(@PathVariable("roleId") Integer roleId) {
     
        List<FunctionRole> functionRoles = functionService.loadFunctonListByRoleId(roleId);
        return functionRoles;
    }
    
    /**
     * 分页差权限模块
     * @param pageNum
     * @param pageSize
     * @param function
     * @return
     */
    @RequestMapping(value="getFunctionPageList", method=RequestMethod.POST)
    @ResponseBody
    public PageBean getFunctionPageList(@RequestParam("page") Integer pageNum,
            @RequestParam("rows") Integer pageSize, Function function){

        PageInfo<Function> pageInfo = functionService.getFunctionPageList(pageNum, pageSize, function);
        return new PageBean(pageInfo.getTotal(), pageInfo.getList());
    }
    
    /**
     * 添加权限或者模块
     * @param function
     * @return
     */
    @RequestMapping(value="saveFunction", method=RequestMethod.POST)
    @ResponseBody
    public Result saveFunction(Function function) {
        
        functionService.saveFunction(function);
        return new Result(0, null, null);
    }
    
    /**
     * 修改功能模块权限
     * @param function
     * @return
     */
    @RequestMapping(value="updateFunction", method=RequestMethod.POST)
    @ResponseBody
    public Result updateFunction(Function function) {
        
        functionService.updateFunction(function);
        return new Result(0, null, null);
    }
    /**
     * 批量删除功能模块权限
     * @param ids
     */
    @RequestMapping(value="deleteBacthFunction/{ids}", method=RequestMethod.POST)
    @ResponseBody
    public Result deleteBacthFunction(@PathVariable("ids") String ids) {
        
        String[] mkIds = ids.split(",");
        functionService.deleteBacthFunction(mkIds);
        return new Result(0, null, null);
    }
    
    /**
     * 加载功能
     * @return
     */
    @RequestMapping(value="loadFunctionAllList", method=RequestMethod.POST)
    @ResponseBody
    public List<Function> loadFunctionAllList(){
        
        List<Function> functions = functionService.getFunctionAllList();
        
        return functions;
    }
    
    /**
     * 加载所有的模块信息
     * @return
     */
    @RequestMapping(value="getFunctionAllList", method=RequestMethod.POST)
    @ResponseBody
    public List<ComboTree> getFunctionAllList(){

        List<Function> functions = functionService.getFunctionAllList();
        // 将数据封装成前端指定的格式
        ComboTree treeFirst = null;
        ComboTree treeSecond = null;
        ComboTree treeThird = null;
        List<ComboTree> comboTrees = new ArrayList<ComboTree>();
        for(Function function : functions) { // 一级节点
            if (function.getMkFId().equals(0)) {
                treeFirst = new ComboTree();
                treeFirst.setId(function.getMkId());
                treeFirst.setText(function.getMkMc());
                for(Function functionSecond : functions) {  // 二级节点
                    if(functionSecond.getMkFId().equals(function.getMkId())) {
                        treeSecond = new ComboTree();
                        treeSecond.setId(functionSecond.getMkId());
                        treeSecond.setText(functionSecond.getMkMc());
                        for(Function functionThird : functions) {  // 三级节点
                            if (functionThird.getMkFId().equals(functionSecond.getMkId())) {
                                treeThird = new ComboTree();
                                treeThird.setId(functionThird.getMkId());
                                treeThird.setText(functionThird.getMkMc());
                                treeSecond.addChildrenNode(treeThird);
                            }
                        }
                        treeFirst.addChildrenNode(treeSecond);
                    }
                }
                comboTrees.add(treeFirst);
            }
            
         }
        return comboTrees;
    }
}
