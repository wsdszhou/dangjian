package com.glut.dangjian.utils;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONObject;
import com.glut.dangjian.config.ApplicationConfig;
import com.glut.dangjian.entity.authority.Role;
import com.glut.dangjian.pojo.VideoDto;

public class UploadFileUtils {
    
    /**
     * 上传视频
     * @param uploadFile
     * @param request
     * @param rootPath
     * @return
     */
  
    public VideoDto uploadVideo(@RequestParam MultipartFile uploadFile, HttpServletRequest request,
            String rootPath, VideoDto videoDto) {

        String realpath = request.getSession().getServletContext().getRealPath("/");


        if (uploadFile.getSize() > 1024*1024*1024) {
            videoDto.setMsg("文件太大");
            videoDto.setState(false);
            return videoDto;
         } 
         String tempFileName = "";
        // 获取上传文件的名称
        String filename = uploadFile.getOriginalFilename();
        // 获取上传文件
        String suffix = filename.substring(filename.lastIndexOf("."));
        HashMap<String, String> extMap = new HashMap<>();
        extMap.put(".3gp", ".3gp");
        extMap.put(".rmvb", ".rmvb");
        extMap.put(".flv", ".flv");
        extMap.put(".wmv", ".wmv");
        extMap.put(".avi", ".avi");
        extMap.put(".mkv", ".mkv");
        extMap.put(".mp4", ".mp4");
        extMap.put(".wav", ".wav");
        boolean format = extMap.containsKey(suffix);
        if (!format) {
            videoDto.setMsg("文件格式不对");
            videoDto.setState(false);
            return videoDto;
        }
        // 为了防止上传的是同名的文件，需要为上传文件重新命名
        tempFileName = StringTools.getUUID() + suffix;

        File fileTemp = new File(realpath+rootPath);
        if (!fileTemp.exists()) {
            fileTemp.mkdirs(); // 创建存放文件的文件夹
        }
        File file = new File(realpath+rootPath,tempFileName);
        try {
            uploadFile.transferTo(file);
            videoDto.setMsg("上传成功");
            videoDto.setState(true);
            //相对路径
            videoDto.setSrc("/dangjian-controller/"+rootPath + tempFileName);
            return videoDto;
        } catch (IllegalStateException | IOException e) {
            e.printStackTrace();
            videoDto.setMsg("上传失败");
            videoDto.setState(false);
            return videoDto;
        }
    }
    
    /**
     * 上传文件
     * @param uploadFile
     * @param request
     * @param rootPath
     * @param map
     * @return
     */
    public Map<String, Object> uploadFile(@RequestParam MultipartFile uploadFile, HttpServletRequest request,
            String rootPath, String saveUrl, Map<String, Object> map) {
        
        if (uploadFile.getSize() > 1024*1024*100) {
            map.put("message", "文件太大");
            map.put("src", null);
            return map ;
         } 
         String tempFileName = "";
         if ( uploadFile != null) {
             // 获取上传文件的名称
             String filename = uploadFile.getOriginalFilename();
             // 获取上传文件
             String suffix = filename.substring(filename.lastIndexOf("."));
             HashMap<String, String> extMap = new HashMap<String, String>();
             extMap.put(".gif", ".gif");
             extMap.put(".jpg", ".jpg");
             extMap.put(".jpeg", ".jpeg");
             extMap.put(".png", ".png");
             extMap.put(".bmp", ".bmp");
             boolean format = extMap.containsKey(suffix);
             if (format == false) {
                 map.put("message", "文件格式不对");
                 map.put("src", null);
                 return map ;
             }
             // 为了防止上传的是同名的文件，需要为上传文件重新命名
             tempFileName = StringTools.getUUID() + suffix;

             //新文件实例
             File fileTemp = new File(rootPath);
             if (!fileTemp.exists()) {
                 fileTemp.mkdirs(); // 创建存放文件的文件夹
             }
             File file = new File(rootPath,tempFileName);
             try {
                 uploadFile.transferTo(file);
                 map.put("message", "上传成功");
                 map.put("src", saveUrl + tempFileName);
                 return map ;
             } catch (IllegalStateException | IOException e) {
                 e.printStackTrace();
             }
         }else {
             map.put("message", "请选择图片");
             map.put("src", null);
             return map ;
         }
        return map;
    }

    /**
     * 文件上传
     * @param request
     * @param
     * @param dirName 文件请求类型
     *      image： 图片
     *      flash： 短视频
     *      media：媒体视频
     *      file：文件doc、xls、html、zip
     * @return
     */
    public  Map<String, Object> uploadFile(HttpServletRequest request, MultipartFile uploadFile,
            String savePath, String dirName) {
        
        // 文件保存目录URL
        String saveUrl  = request.getContextPath() +"/upload/images/news/";
        // 定义允许上传的文件扩展名
        HashMap<String, String> extMap = new HashMap<String, String>();
        extMap.put("image", "gif,jpg,jpeg,png,bmp");
        extMap.put("flash", "swf,flv");
        extMap.put("media", "swf,flv,mp3,wav,wma,wmv,mid,avi,mpg,asf,rm,rmvb");
        extMap.put("file", "doc,docx,xls,xlsx,ppt,htm,html,txt,zip,rar,gz,bz2");
        // 设置文件大小
        long maxSize = ApplicationConfig.UPLOADSIZE;
        // 没有选择文件
        if ( ! ServletFileUpload.isMultipartContent(request)) {
            return getError("请选择文件。");
        }
        // 检查目录，如果没有就创建
        File uploadDir = new File(savePath);
        if ( !uploadDir.isDirectory()) {
            return getError("上传目录不存在。");
        }
        // 检查上传模块目录是否有权限
        if ( ! uploadDir.canWrite()) {
            return getError("上传目录没有写权限。");
        }
        // 目录为空
        if (dirName == null) {
            dirName = "image";
        }
        // 检查目录时是否正确
        if ( ! extMap.containsKey(dirName)) {
            return getError("目录名不正确。");
        }
        savePath += dirName + "/";
        saveUrl += dirName + "/";
        File saveDirFile = new File(savePath);
        // 检查目录是否已经存在
        if (! saveDirFile.exists()) {
            saveDirFile.mkdirs();
        }
        // 格式化当前日期
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
        String ymd = simpleDateFormat.format(new Date());
        savePath += ymd + "/";
        saveUrl += ymd + "/";
        // 检查目录是否正确
        File dirFile = new File(savePath);
        if (! dirFile.exists()) {
            dirFile.mkdirs();
        }
        // 获取文件名称
        String fileName = uploadFile.getOriginalFilename();
        // 检查文件大小
        if (uploadFile.getSize() > maxSize ) {
            return getError("上传文件大小超过限制。");
        }
        // 检查文件扩展名,并且全部转为小写
        String fileExt =  fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
        // 检查文件扩展名是否正确
        if ( ! Arrays.<String>asList(extMap.get(dirName).split(",")).contains(fileExt) ) {
            return getError("上传文件扩展名是不允许的扩展名。\n只允许" + extMap.get(dirName) + "格式。");
        }
        // 用于格式化文件名
        SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
        // 为文件命名
        String newFileName = df.format(new Date()) + "_" + new Random().nextInt(1000) + "." + fileExt;
        //创建转存文件
        File file = new File(savePath , newFileName);
        Map<String, Object> msg = new HashMap<String, Object>();
        try {
            // 转存文件    
            uploadFile.transferTo(file);
            msg.put("error", 0);
            msg.put("absoluteUrl",savePath + newFileName);
            msg.put("url", saveUrl + newFileName);
            msg.put("showName", newFileName);
            msg.put("actualName", fileName);
            return msg;
        } catch (IllegalStateException | IOException e2) {
            e2.printStackTrace();
        }
        msg.put("error", 1);
        msg.put("absoluteUrl",null);
        msg.put("url", null);
        msg.put("showName", null);
        msg.put("actualName", null);
        return msg;
    }
    
    // 返回错信息
    public Map<String, Object> getError(String message ){
        Map<String, Object> msg = new HashMap<String, Object>();
        msg.put("error", 1);
        msg.put("message", message);
        return msg;
    }
    
    /**
     * 文件返回管理
     * @param request
     * @param response
     * @param dirName
     */
    public void fileManager(HttpServletRequest request, HttpServletResponse response, String dirName) {
        
        ServletContext application = request.getSession().getServletContext();
        ServletOutputStream out = null;
        try {
            out = response.getOutputStream();
            // 根目录路径， 可以指定决定路径， 比如 
            String rootPath = request.getServletContext().getRealPath("/") +"/upload/images/news/";
            // 根目录URL，可以指定绝对路径
            String rootUrl = request.getContextPath() +"/upload/images/news/";
            // 图片扩展名
            String[] fileTypes = new String[] { "gif", "jpg", "jpeg", "png", "bmp" };
            if (dirName != null ) {
                if (! Arrays.<String>asList(new String[]{"image", "flash", "media", "file"}).contains(dirName) ) {
                    out.println("文件目录不存在");
                    return;
                }
                rootPath +=dirName +"/";
                rootUrl += dirName + "/";
                File saveDirFile = new File(rootPath);
                // 检查文件目录是否存在
                if (!saveDirFile.exists()) {
                    saveDirFile.mkdirs();
                }
            }
            // 根据path参数，设置各路径和URL
            String path = request.getParameter("path") != null ? request.getParameter("path") : "";
            String currentPath = rootPath + path;
            String currentUrl = rootUrl + path;
            String currentDirPath = path;
            String moveupDirPath = "";
            if (!"".equals(path)) {
                String str = currentDirPath.substring(0, currentDirPath.length() - 1);
                moveupDirPath = str.lastIndexOf("/") >= 0 ? str.substring(0, str.lastIndexOf("/") + 1) : "";
            }
            // 排序形式，name or size or type
            String order = request.getParameter("order") != null ? request.getParameter("order").toLowerCase() : "name";
            // 不允许使用..移动到上一级目录
            if (path.indexOf("..") >= 0) {
                out.println("不允许使用../移动到上一级目录");
                return;
            }
            // 最后一个字符不能是/
            if (!"".equals(path) && !path.endsWith("/")) {
                out.println("最后一个字符不能是/");
                return;
            }
            // 目录不存在或不是目录
            File currentPathFile = new File(currentPath);
            if (!currentPathFile.isDirectory()) {
                out.println("Directory does not exist.");
                return;
            }
            // 遍历目录取的文件信息
            List< Hashtable > fileList = new ArrayList<Hashtable>();
            // 当前文件路径不能为null
            if (currentPathFile.listFiles() != null) {
                for (File file : currentPathFile.listFiles()) {
                    Hashtable<String, Object> hash = new Hashtable<String, Object>();
                    // 获取文件名称
                    String fileName = file.getName();
                    if (file.isDirectory()) {  // 是目录
                        hash.put("is_dir", true);
                        hash.put("has_file", (file.listFiles() != null));
                        hash.put("filesize", 0L);
                        hash.put("is_photo", false);
                        hash.put("filetype", "");
                    }else if (file.isFile()) { // 文件
                        String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
                        hash.put("is_dir", false);
                        hash.put("has_file", false);
                        hash.put("filesize", file.length());
                        hash.put("is_photo", Arrays.<String> asList(fileTypes).contains(fileExt));
                        hash.put("filetype", fileExt);
                    }
                    hash.put("filename", fileName); // 设置文件名
                    hash.put("datetime", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(file.lastModified())); // 格式化时间
                    fileList.add(hash);
                }
            }
            // 按大小排序
            if ("size".equals(order)) { 
                Collections.sort(fileList, new SizeComparator());
            } else if ("type".equals(order)) { // 按类型排序
                Collections.sort(fileList, new TypeComparator());
            } else {
                Collections.sort(fileList, new NameComparator());
            }
            // 返回json对象
            JSONObject result = new JSONObject();
            result.put("moveup_dir_path", moveupDirPath);
            result.put("current_dir_path", currentDirPath);
            result.put("current_url", currentUrl);
            result.put("total_count", fileList.size());
            result.put("file_list", fileList);
            response.setContentType("application/json; charset=UTF-8");
            out.println(result.toJSONString());
        } catch (IOException e) {
            e.printStackTrace();
        }
        
        
    }
    
}
