package com.glut.dangjian.background.controller.system;

import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageInfo;
import com.glut.dangjian.entity.common.Result;
import com.glut.dangjian.entity.user.Yhb;
import com.glut.dangjian.entity.view.ViewYhxx;
import com.glut.dangjian.pojo.PageBean;
import com.glut.dangjian.service.user.UserService;
import com.glut.dangjian.template.ExceTemplatel;
import com.glut.dangjian.utils.MD5Utils;
import com.glut.dangjian.utils.StringTools;

@Controller
@RequestMapping("back/user/")
public class UserController {
    
    private static final String ADMIN = "background/system/admin/admin";
    
    private static final String UDITORADMIN = "background/system/admin/updateAdmin";
    
    private static final String USERLIST = "background/system/admin/userList";
    
    // 注入用户业务逻辑层
    @Autowired
    private UserService userService;
    
    /**
     * 进入用户列表页面
     * @return
     */
    @RequestMapping(value="toUserList",method=RequestMethod.GET)
    public String gotoUserList() {
        
        return USERLIST;
    }
    
    /**
     * 分页查询
     * @param pageNum
     * @param pageSize
     * @param viewYhxx
     * @return
     */
    @RequestMapping(value="loadUserInfoPageList",method=RequestMethod.POST)
    @ResponseBody
    public PageBean loadUserInfoPageList(@RequestParam("page") Integer pageNum,
            @RequestParam("rows") Integer pageSize, ViewYhxx viewYhxx){
        if (StringUtils.isBlank(viewYhxx.getUserMc())) {
            viewYhxx.setUserMc(null);
        }
        if (StringUtils.isBlank(viewYhxx.getYhxxXm()) ) {
            viewYhxx.setYhxxXm(null);
        }
        if (StringUtils.isBlank(viewYhxx.getYhxxXb()) ) {
            viewYhxx.setYhxxXb(null);
        }
        PageInfo<ViewYhxx> pageInfo = userService.loadUserInfoPageList(pageNum, pageSize, viewYhxx);
        return new PageBean(pageInfo.getTotal(), pageInfo.getList());
    }
    
    /**
     * 添加用户
     * @param viewYhxx
     * @return
     */
    @RequestMapping(value="saveUser",method=RequestMethod.POST)
    @ResponseBody
    public Result saveUser(ViewYhxx viewYhxx) {
        
        Yhb yhb = userService.getUserByuserName(viewYhxx.getUserMc()); 
        if (yhb != null) {
            return new Result(0, "用户名或者用户已经存在", viewYhxx);
        }
        userService.saveUser(viewYhxx);
        return new Result(0, null, null);
    }
    
    /**
     * 导入用户信息
     * @param file
     * @param request
     * @return
     */
    @RequestMapping(value="uploadUserXls",method=RequestMethod.POST)
    @ResponseBody
    public String uploadUserXls(@RequestParam MultipartFile file, HttpServletRequest request) {
        
        String filename = file.getName();
        if (StringUtils.isBlank(filename)) {
            return "导入失败";
        }
        InputStream inputStream = null;
        HSSFWorkbook workbook = null;
        List<ViewYhxx> viewYhxxs = new ArrayList<ViewYhxx>();
        ViewYhxx viewYhxx = null;
        try {
            inputStream = file.getInputStream();
            workbook = new HSSFWorkbook(inputStream);
            //根据名称指定sheet对象
            HSSFSheet sheet = workbook.getSheet("用户数据模板");
            // 对excel表格做兼容
            if (sheet == null) {
                sheet = workbook.getSheet("Sheet1");
            }
            if (sheet != null ) {
                //遍历获取每一行
                int total = sheet.getLastRowNum();
                Row row = null;  
                // 表头不要,所以从第二行开始
                for(int i =1; i<=total; i++) {
                    row = sheet.getRow(i);
                    viewYhxx = new ViewYhxx();
                    // 封装数据
                    viewYhxx.setUserMc( row.getCell(0).getStringCellValue() );
                    viewYhxx.setYhxxXm(row.getCell(1).getStringCellValue() );
                    viewYhxx.setUserMm(MD5Utils.getMD5Str(viewYhxx.getUserMc()));
                    viewYhxx.setYhxxXb(row.getCell(2).getStringCellValue() );
                    viewYhxx.setYhxxCsrq(new SimpleDateFormat("yyyy-MM-dd").parse(row.getCell(3).getStringCellValue()) );
                    row.getCell(4).setCellType(Cell.CELL_TYPE_STRING);
                    viewYhxx.setYhxxSjh( row.getCell(4).getStringCellValue() );
                    row.getCell(5).setCellType(Cell.CELL_TYPE_STRING);
                    viewYhxx.setYhxxDhhm( row.getCell(5).getStringCellValue() );
                    row.getCell(6).setCellType(Cell.CELL_TYPE_STRING);
                    viewYhxx.setYhxxSfzh(row.getCell(6).getStringCellValue());
                    viewYhxx.setYhxxYx(row.getCell(7).getStringCellValue() );
                    viewYhxx.setUserZtMc( row.getCell(8).getStringCellValue() );
                    viewYhxx.setXlMc( row.getCell(9).getStringCellValue() );
                    viewYhxx.setMzMc(row.getCell(10).getStringCellValue());
                    viewYhxx.setZzmmMc( row.getCell(11).getStringCellValue() );
                    viewYhxx.setBmMc( row.getCell(12).getStringCellValue() );
                    viewYhxx.setJgMc(row.getCell(14).getStringCellValue());
                    row.getCell(15).setCellType(Cell.CELL_TYPE_STRING);
                    viewYhxx.setYhxxSfzh(row.getCell(15).getStringCellValue());
                    // 数据 封装
                    viewYhxxs.add(viewYhxx);
                }
                userService.saveBatchUser(viewYhxxs);
                return "success";
            }
        } catch (IOException | ParseException e) {
            e.printStackTrace();
        }
        return "导入失败";
    }
    
    /**
     * 导出模板
     * @param request
     * @param response
     */
    @RequestMapping(value="exportUserExcelTemplate",method=RequestMethod.GET)
    @ResponseBody
    public void exportUserExcelTemplate(HttpServletRequest request,HttpServletResponse response) {
        // 创建一个Excel文件
        HSSFWorkbook workbook = new HSSFWorkbook();
        // 创建一个标签页
        HSSFSheet sheet = workbook.createSheet("用户数据模板");
        // 创建单元格，并设置值表头 设置表头居中
        HSSFCellStyle hssfCellStyle = workbook.createCellStyle();
        //居中样式
        hssfCellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        // 创建标题行
        String[] headRowName = {"账号", "姓名", "性别", "出生日期", "手机号", "家庭电话号码"," 身份证号码", "邮箱", 
                "用户类型", "学历", "民族", "政治面貌", "部门/学院", "家庭所在省", "家庭所在区县", "年级"  };
        
        HSSFRow headRow = ExceTemplatel.createExcelHead(headRowName, sheet);
        
        String[] rowValues1 = {"s3152052051101", "张三", "男", "2018-01-01", "13700000000", "3705110","xxxxxxxx", 
                "xxxxxxxx", "在校老师", "本科", "汉族", "中共党员", "信息科学与工程学院", "北京市", "朝阳区", ""  };
        String[] rowValues2 = {"t201111", "李四", "男", "2018-01-01", "13700000000", "3705110","xxxxxxxx", 
                "xxxxxxxx", "在校学生", "研究生", "壮族", "共青团员", "信息科学与工程学院", "北京市", "朝阳区", "2015"  };
        // 填充模板数据
        HSSFRow dataRow = sheet.createRow(1);
        dataRow = ExceTemplatel.setCellValue(rowValues1, dataRow);
        dataRow = sheet.createRow(2);
        dataRow = ExceTemplatel.setCellValue(rowValues2, dataRow);
        
        // 设置文件名
        String fileName = "用户数据";
       //获取浏览器的agent 
        String agent = request.getHeader("User-Agent");
        // 响应
        ServletOutputStream servletOutputStream = null;
        try {
            //防止出现中文乱码
            fileName = ExceTemplatel.encodeDownloadFilename(fileName, agent);
            response.setHeader("Content-disposition", "attachment; filename=" + fileName + ".xls");
            servletOutputStream = response.getOutputStream();
            workbook.write(servletOutputStream);
            servletOutputStream.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            if (servletOutputStream != null) {
                try {
                    servletOutputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        
    }
    
    /**
     * 导出用户信息
     * @param response
     */
    @RequestMapping(value="exportUserExcel",method=RequestMethod.GET)
    @ResponseBody
    public void exportUserExcel(HttpServletRequest request,HttpServletResponse response) {
        
        // 从数据库获取用户数据
        List<ViewYhxx> viewYhxxs = userService.getUserAllList();
        // 创建一个Excel文件
        HSSFWorkbook workbook = new HSSFWorkbook();
        // 创建一个标签页
        HSSFSheet sheet = workbook.createSheet("用户数据");
        
       // 创建单元格，并设置值表头 设置表头居中
       HSSFCellStyle hssfCellStyle = workbook.createCellStyle();
       //居中样式
       hssfCellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        
        // 创建标题行
        String[] headRowName = {"用户名", "姓名", "性别", "出生日期", "手机号", "用创建日期", "用户状态", "邮箱", 
                "学历", "政治面貌", "籍贯", "党内职务", "行政职务", "部门/学院", "支部", "年级"  };
        HSSFRow headRow = ExceTemplatel.createExcelHead(headRowName, sheet);
        
        // 填充数据
        HSSFRow dataRow = null;
        int i =1;
        for(ViewYhxx viewYhxx:viewYhxxs) {
            dataRow = sheet.createRow( i++ );
            dataRow.createCell(0).setCellValue(viewYhxx.getUserMc());
            dataRow.createCell(1).setCellValue(viewYhxx.getYhxxXm());
            dataRow.createCell(2).setCellValue(viewYhxx.getYhxxXb());
            dataRow.createCell(3).setCellValue(viewYhxx.getYhxxCsrq());
            dataRow.createCell(4).setCellValue(viewYhxx.getYhxxSjh());
            dataRow.createCell(5).setCellValue(viewYhxx.getUserCjrq());
            dataRow.createCell(6).setCellValue(viewYhxx.getUserZtMc());  
            dataRow.createCell(7).setCellValue(viewYhxx.getYhxxYx());
            dataRow.createCell(8).setCellValue(viewYhxx.getXlMc());
            dataRow.createCell(9).setCellValue(viewYhxx.getZzmmMc());
            dataRow.createCell(10).setCellValue(viewYhxx.getJgMc());
            dataRow.createCell(11).setCellValue(viewYhxx.getDnzwMc());
            dataRow.createCell(12).setCellValue(viewYhxx.getXzzwMc());
            dataRow.createCell(13).setCellValue(viewYhxx.getBmMc());
            dataRow.createCell(14).setCellValue(viewYhxx.getZbMc());
            dataRow.createCell(15).setCellValue(viewYhxx.getYhxxMj());
        }
        
        // 设置文件名
        String fileName = "用户数据";
       //获取浏览器的agent 
        String agent = request.getHeader("User-Agent");
        // 响应
        ServletOutputStream servletOutputStream = null;
        try {
            //防止出现中文乱码
            fileName = ExceTemplatel.encodeDownloadFilename(fileName, agent);
            response.setHeader("Content-disposition", "attachment; filename=" + fileName + ".xls");
            servletOutputStream = response.getOutputStream();
            workbook.write(servletOutputStream);
            servletOutputStream.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            if (servletOutputStream != null) {
                try {
                    servletOutputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        
    }
    
    /**
     * 删除用户
     * @param userId
     * @return
     */
    @RequestMapping(value="deleteUser/{userId}",method=RequestMethod.POST)
    @ResponseBody
    public void deleteUser(@PathVariable("userId") String userId) {
        
        String[] userIds = userId.split(",");
        userService.deleteUser(userIds);
    }
    
    
    /**
     * 修改密码
     * @param password 新密码
     * @param session 当前会话
     * @return
     */
    @RequestMapping(value="updatePassword", method=RequestMethod.POST)
    @ResponseBody
    public String updatePassword(@RequestParam("password") String password,
            HttpSession session) {
        
        Yhb yhb = (Yhb) session.getAttribute("yhb");
        // 把密码封装到用户对象中
        yhb.setUserMm(password);
        if (StringUtils.isNotBlank(password)) {
            userService.updateUserPassword(yhb);
             yhb.setUserMm(MD5Utils.getMD5Str(password + yhb.getUserPwk()));
            // 保存用户信息到session域中
            session.setAttribute("yhb", yhb);
        }
        return password;
    }
    
    /**
     * 展示用户信息
     * @return
     */
    @RequestMapping(value="toYhxx" , method= RequestMethod.GET)
    public String gotoYhxx(HttpSession session,Map<String, Object> map) {
        
        // 创建用户对象并且赋值给id
        Yhb yhb = (Yhb) session.getAttribute("yhb");
        ViewYhxx viewYhxx = userService.getUserInfo(yhb);
        map.put("viewYhxx", viewYhxx);
        return ADMIN;
    }
    
    /**
     * 跳转到用户修改页面
     * @param session
     * @param map
     * @return
     */
    @RequestMapping(value="toUpdateYhxx", method= RequestMethod.GET)
    public String gotoUpdateYhXx(HttpSession session,Map<String, Object> map) {
        return UDITORADMIN;
    }
    
    /**
     * 加载用户数据
     * @param session
     * @return
     */
    @RequestMapping(value="loadUpdateYhxx", method= RequestMethod.POST)
    @ResponseBody
    public ViewYhxx loadUpdateYhxx(HttpSession session) {
        // 创建用户对象并且赋值给id
        Yhb yhb = (Yhb) session.getAttribute("yhb");
        ViewYhxx viewYhxx = userService.getUserInfo(yhb);
        return viewYhxx;
    }
    
    /**
     * 修改用户信息
     * @param viewYhxx
     * @return
     */
    @RequestMapping(value="updateUser", method= RequestMethod.POST)
    public String updateUser(ViewYhxx viewYhxx) {
        userService.updateUser(viewYhxx);
        return UDITORADMIN;
    }
    
    /**
     * 验证用户账号是否已经存在
     * @param userName
     * @return
     */
    @RequestMapping(value="validateUserName/{userName}", method=RequestMethod.POST)
    @ResponseBody
    public String validateUserName(@PathVariable("userName") String userName ) {
        
        if ( ! userService.validateUserName(userName) ) {
            return "error";
        }
        return "success";
    }
    
    /**
     * 用户授权
     * @param
     * @return
     */
    @RequestMapping(value="authorityUser", method=RequestMethod.POST)
    @ResponseBody
    public Result authorityUser(String userId,String roleIds) {
        ViewYhxx viewYhxx = new ViewYhxx();
        viewYhxx.setUserId(userId);
        String[] roles = roleIds.split(",");
        Integer[] role = new Integer[roles.length];
        for(int i=0;i<roles.length;i++){
            role[i] = Integer.valueOf(roles[i]);
        }
        viewYhxx.setRoleIds(role);
        userService.authorityUser(viewYhxx);
        return new Result(0, null, null);
    }
     
    
}
