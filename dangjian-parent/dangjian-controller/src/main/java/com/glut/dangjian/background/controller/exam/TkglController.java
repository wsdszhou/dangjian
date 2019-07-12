package com.glut.dangjian.background.controller.exam;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;
import com.glut.dangjian.background.exam.service.TkglService;
import com.glut.dangjian.entity.kszx.KszxSt;
import com.glut.dangjian.entity.kszx.KszxStxx;
import com.glut.dangjian.entity.kszx.KszxTmfl;
import com.glut.dangjian.entity.kszx.QuestionFilter;
import com.glut.dangjian.entity.kszx.view.ViewKszxStlb;
import com.glut.dangjian.pojo.PageBean;
import com.glut.dangjian.utils.ExcelUtils;
import com.glut.dangjian.utils.Msg;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * Created by IntelliJ IDEA.
 * User: lishidongol
 * Date: 2018/9/28
 * Time: 22:31
 */

/* 题目管理 */
@Controller
@RequestMapping("kszx/tkgl/")
public class TkglController extends KszxController {

    @Autowired
    TkglService tkglService;

    @RequestMapping("")
    public String index() {
        return ROOT + "tkgl/index";
    }

    @RequestMapping("{path}")
    public String getView(@PathVariable("path") String path) {
        return ROOT + "tkgl/" + path;
    }

    /**
     * 加载新增题目视图
     *
     * @param mv
     * @return
     */
    @RequestMapping("loadAddQuestionView")
    public ModelAndView loadAddQuestionView(ModelAndView mv) {
        List<KszxTmfl> tmflList = tkglService.loadCategories();
        mv.addObject("stfl", tmflList);
        mv.setViewName(ROOT + "tkgl/addQuestion");
        return mv;
    }

    /**
     * 新增题目
     *
     * @param map
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "addQuestion", method = RequestMethod.POST)
    public String addQuestion(@RequestParam Map<String, Object> map) {
        if (map == null) {
            //TODO 添加参数错误信息
            return "参数错误";
        }
        KszxSt kszxSt = new KszxSt();
        for (Map.Entry<String, Object> entry : map.entrySet()) {
            System.out.println(entry.getKey() + ":" + entry.getValue().toString());
            switch (entry.getKey()) {
                case "stfl":
                    kszxSt.setStfl(Integer.parseInt((String) entry.getValue()));
                    break;
                case "stlx":
                    kszxSt.setStlx((String) entry.getValue());
                    break;
                case "stjx":
                    kszxSt.setStjx((String) entry.getValue());
                    break;
                case "stmc":
                    kszxSt.setStmc((String) entry.getValue());
                    break;
                case "stnd":
                    kszxSt.setStnd((String) entry.getValue());
                    break;
                case "stda":
                    kszxSt.setStda((String) entry.getValue());
                    break;
                default:
                    System.out.println(entry.getKey());
                    break;
            }
        }

        //TODO 在这里添加试题的录入人,从登陆的session中获得用户名 kszxSt.setStzz()
        kszxSt.setStzz("lsd");

        if (kszxSt.getStlx().equals("单选题") || kszxSt.getStlx().equals("多选题")) {
            String stxx = (String) map.get("stxx");
            String[] stxxs = stxx.split("-");
            List<KszxStxx> list = new ArrayList<>();
            for (int i = 0; i < stxxs.length; i++) {
                KszxStxx kszxStxx = new KszxStxx();
                kszxStxx.setStid(kszxSt.getId());
                kszxStxx.setXx(i + 1);
                kszxStxx.setXxz(stxxs[i]);
                list.add(kszxStxx);
            }
            kszxSt.setKszxStxxList(list);
        }
        tkglService.addQuestion(kszxSt);
        return "ok";

    }

    /**
     * 加载题目目录
     *
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "loadCategories")
    public String loadCategories(@RequestParam(required = false) Integer format) {
        List<KszxTmfl> list = tkglService.loadCategories();
        if (list.size() != 0 && format != null && format == 1) {
            List<Map> result = recursiveTmfl(list, 0);
            return JSON.toJSONString(result);
        } else {
            return JSON.toJSONString(list);
        }
    }

    /**
     * 递归题目分类数据
     *
     * @param list
     * @param parent_id
     * @return
     */
    private List<Map> recursiveTmfl(List<KszxTmfl> list, int parent_id) {
        List<Map> result = new ArrayList<>();
        for (KszxTmfl tmfl : list) {
            if (tmfl.getParentId() == parent_id) {
                Map<String, Object> map = new HashMap<>();
                map.put("id", tmfl.getId());
                map.put("name", tmfl.getName());
                map.put("spread", false);
                map.put("children", recursiveTmfl(list, tmfl.getId()));
                /*if (tmfl.getChildren() == 1) {
                    map.put("children", recursiveTmfl(list, tmfl.getId()));
                }*/
                result.add(map);
            }
        }
        return result;
    }

    /**
     * 添加分类
     *
     * @param map
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "addCategorie", method = RequestMethod.POST)
    public Map addCategorie(@RequestParam Map<String, Object> map) {
        int resultCode = tkglService.addCategorie(map);
        //TODO 这里判断错误代码，返回错误信息
        if (resultCode == 1) {
            return Msg.msg(0, "添加成功");
        } else {
            //TODO 在service层中添加事物回滚
            return Msg.msg(1, "添加失败，原因未知");
        }

    }

    /**
     * 更新试题分类
     *
     * @param map
     * @return
     */
    @ResponseBody
    @RequestMapping("updateCategorie")
    public Map updateCategorie(@RequestParam Map<String, Object> map) {
        KszxTmfl kszxTmfl = new KszxTmfl();
        kszxTmfl.setId(Integer.parseInt((String) map.get("flid")));
        kszxTmfl.setName((String) map.get("flName"));
        kszxTmfl.setParentId(Integer.parseInt((String) map.get("fjfl")));
        int resultCode = tkglService.updateCategorie(kszxTmfl);
        if (resultCode == 1) {
            return Msg.msg(0, "修改成功");
        } else {
            return Msg.msg(1, "修改失败，原因未知");
        }
    }

    /**
     * 删除试题分类
     *
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping("removeCategorie/{id}")
    public Map removeCategorie(@PathVariable int id) {
        if (id == 99999) {
            return Msg.msg(1, "默认分类不能删除");
        }
        tkglService.removeCategorie(id);
        return Msg.msg(0, "操作完成");
    }

    /**
     * 加载试题
     *
     * @param questionFilter
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "loadQuestionList")
    public PageBean loadQuestions(QuestionFilter questionFilter) {
        //添加题目过滤对象 QuestionFilter
        System.out.println(questionFilter);

        List<ViewKszxStlb> list = tkglService.loadQuestions(questionFilter);
        PageInfo<ViewKszxStlb> pageInfo = new PageInfo<>(list);

        return new PageBean(pageInfo.getTotal(), pageInfo.getList());
    }


    /**
     * 加载试题详细信息
     *
     * @param stid
     * @param mv
     * @return
     */
    @RequestMapping("loadQuestionDetail/{stid}")
    public ModelAndView loadQuestionDetail(@PathVariable int stid, ModelAndView mv) {
        ViewKszxStlb viewKszxStlb = tkglService.loadQuestionDetail(stid);
        mv.addObject("questionDetail", viewKszxStlb);
        mv.setViewName(ROOT + "tkgl/viewdetail");
        return mv;
    }

    /**
     * 编辑试题
     *
     * @param stid
     * @param mv
     * @return
     */
    @RequestMapping("editQuestion/{stid}")
    public ModelAndView editQuestion(@PathVariable int stid, ModelAndView mv) {
        ViewKszxStlb viewKszxStlb = tkglService.loadQuestionDetail(stid);
        mv.addObject("questionDetail", viewKszxStlb);
        List<KszxTmfl> tmflList = tkglService.loadCategories();
        mv.addObject("stfl", tmflList);
        mv.setViewName(ROOT + "tkgl/editQuestion");
        return mv;
    }


    /**
     * 保存修改后的试题数据
     *
     * @param map
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "editQuestionData", method = RequestMethod.POST)
    public String editQuestionData(@RequestParam Map<String, Object> map) {
        if (map == null) {
            //TODO 添加参数错误信息
            return "参数错误";
        }
        KszxSt kszxSt = new KszxSt();
        for (Map.Entry<String, Object> entry : map.entrySet()) {
            switch (entry.getKey()) {
                case "stid":
                    kszxSt.setId(Integer.parseInt((String) entry.getValue()));
                    break;
                case "stfl":
                    kszxSt.setStfl(Integer.parseInt((String) entry.getValue()));
                    break;
                case "stjx":
                    kszxSt.setStjx((String) entry.getValue());
                    break;
                case "stmc":
                    kszxSt.setStmc((String) entry.getValue());
                    break;
                case "stnd":
                    kszxSt.setStnd((String) entry.getValue());
                    break;
                case "stda":
                    kszxSt.setStda((String) entry.getValue());
                    break;
                case "stxx":
                    String stxx = (String) entry.getValue();
                    String[] stxxs = stxx.split("-");
                    List<KszxStxx> list = new ArrayList<>();
                    for (int i = 0; i < stxxs.length; i++) {
                        KszxStxx kszxStxx = new KszxStxx();
                        kszxStxx.setStid(kszxSt.getId());
                        kszxStxx.setXx(i + 1);
                        kszxStxx.setXxz(stxxs[i]);
                        list.add(kszxStxx);
                    }
                    kszxSt.setKszxStxxList(list);
                    break;
                default:
                    break;
            }
        }
        tkglService.updateQuestion(kszxSt);
        return "ok";
    }

    /**
     * 删除试题
     *
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "deleteQuestion", method = RequestMethod.POST)
    public String deleteQuestion(String id) {
        String ids[] = id.split(",");
        System.out.println(ids[0]);
        tkglService.removeQuestion(ids);
        return "ok";
    }

    /**
     * 下载试题导入模板
     *
     * @param request
     * @param filename
     * @return
     * @throws IOException
     */
    @RequestMapping("getImportQuestionsTemplate")
    public ResponseEntity<byte[]> getImportQuestionsTemplate(HttpServletRequest request, String filename) throws IOException {
        String path = request.getServletContext().getRealPath("/excel/");
        File file = new File(path + File.separator + filename);
        System.out.println(path);
        HttpHeaders headers = new HttpHeaders();
        //下载显示的文件名，解决中文名称乱码问题
        String downloadFielName = new String(filename.getBytes("UTF-8"), "iso-8859-1");
        //通知浏览器以attachment（下载方式）打开文件
        headers.setContentDispositionFormData("attachment", downloadFielName);
        //application/octet-stream ： 二进制流数据（最常见的文件下载）。
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),
                headers, HttpStatus.CREATED);
    }

    @ResponseBody
    @RequestMapping("uploadQuestionExcel")
    public Map uploadQuestionExcel(HttpServletRequest request, HttpServletResponse response) {
        //实例化一个文件解析器
        CommonsMultipartResolver commonsMultipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
        //保存文件路径
        String savePath = "";
        //判断request请求是否有文件上传
        if (commonsMultipartResolver.isMultipart(request)) {
            //转换request
            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
            //获得文件,和单文件不同在于方法是getFiles得到List集合
            MultipartFile file = multiRequest.getFile("file");
            if (!file.isEmpty()) {
                //获得原始文件名
                String fileName = file.getOriginalFilename();
                String newFileName = UUID.randomUUID() + fileName;
                //获得物理路径，webapp所在路径
                String file_path = request.getSession().getServletContext().getRealPath("/excel/uploadTemp");
                //判断存储文件的物理路径文件夹是否存在，如果文件夹不存在就创建
                File fileForPath = new File(file_path);
                if (!fileForPath.exists()) {
                    System.out.println("目标文件夹不存在，新建文件夹。。。");
                    fileForPath.mkdir();
                }
                //System.out.println("文件路径，可用于回显：" + file_path + "\\" + newFileName);
                //新文件路径实例
                File targetFile = new File(file_path, newFileName);
                //上传文件保存路径加文件名
                System.out.println(targetFile.getPath());
                savePath = targetFile.getPath();
                try {
                    //开始保存文件
                    file.transferTo(targetFile);
                } catch (IllegalStateException | IOException e) {
                    e.printStackTrace();
                }
            }

            //开始处理Excel导入
            tkglService.importQuestionExcel(new File(savePath));

            File deleteFile = new File(savePath);
            //ExcelUtils.readExcel(deleteFile);
            if(deleteFile.isFile() && deleteFile.exists()){
                deleteFile.delete();
            }

        }else {
            return Msg.msg(1,"无效的文件");
        }
        return Msg.ok();
    }



}
