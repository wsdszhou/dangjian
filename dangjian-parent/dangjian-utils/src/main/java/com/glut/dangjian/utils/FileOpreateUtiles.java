package com.glut.dangjian.utils;
/** 
* @author xulankong
* @date 创建时间:  2018年12月27日 上午11:29:52
* @version 1.0
*/

import java.io.File;

import javax.servlet.http.HttpServletRequest;

public class FileOpreateUtiles {

    /**
     * 删除硬盘中的文件
     * @param request
     * @param saveUrl
     */
    public static void deleteFile(HttpServletRequest request, String saveUrl) {
        String currentUrl = request.getServletContext().getRealPath("");
        currentUrl = currentUrl.replaceAll("dangjian-controller", "");
        new File(currentUrl+ saveUrl).delete();
    }
    
    /**
     * 批量删除硬盘中的文件
     * @param request
     * @param saveUrl
     */
    public static void deleteFile(HttpServletRequest request, String[] saveUrl) {
        String currentUrl = request.getServletContext().getRealPath("");
        currentUrl = currentUrl.replaceAll("dangjian-controller", "");
        for (int i = 0; i < saveUrl.length; i++) {
            new File(currentUrl+ saveUrl[i]).delete();
        }
    }
}
