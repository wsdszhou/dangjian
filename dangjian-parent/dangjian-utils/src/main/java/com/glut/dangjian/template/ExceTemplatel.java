package com.glut.dangjian.template;

import java.io.IOException;
import java.net.URLEncoder;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;

import sun.misc.BASE64Encoder;

/** 
* @author xulankong
* @date 创建时间:  2018年8月26日 上午9:16:47
* @version 1.0
*/
public class ExceTemplatel {

    /**
     * 创建表头
     * @param headRowName
     * @param sheet
     * @return
     */
    public static HSSFRow createExcelHead(String[] headRowName, HSSFSheet sheet ) {
        // 创建标题行
        HSSFRow headRow = sheet.createRow(0);
        for(int i = 0; i < headRowName.length; i++ ) {
            headRow.createCell(i).setCellValue(headRowName[i]);
        }
        return headRow;
    }
    
    /**
     * 获取每个ceil的值
     * @param hssfCell
     * @return
     */
    public static String getValue(HSSFCell hssfCell){  
        if(hssfCell.getCellType() == hssfCell.CELL_TYPE_STRING){  
          return String.valueOf( hssfCell.getBooleanCellValue());  
        }else if(hssfCell.getCellType() == hssfCell.CELL_TYPE_NUMERIC){  
          return String.valueOf( hssfCell.getNumericCellValue());  
        }else if (hssfCell.getCellType() == hssfCell.CELL_TYPE_BOOLEAN){
            return String.valueOf(hssfCell.getStringCellValue());
        }else{  
          return String.valueOf( hssfCell.getStringCellValue());  
        }  
      }
    
    /**
     * 设置每行的值
     * @param rowValues
     * @param dataRow
     * @return
     */
    public static HSSFRow setCellValue(String[] rowValues, HSSFRow dataRow) {
        
        for(int i = 0; i < rowValues.length; i++ ) {
            dataRow.createCell(i).setCellValue(rowValues[i]);
        }
        return dataRow;
    }
    
    /**
     * 下载文件时，针对不同浏览器，进行附件名的编码
     * 
     * @param filename
     *            下载文件名
     * @param agent
     *            客户端浏览器
     * @return 编码后的下载附件名
     * @throws IOException
     */
    public static String encodeDownloadFilename(String filename, String agent) throws IOException {
        if (agent.contains("Firefox")) { // 火狐浏览器
            filename = "=?UTF-8?B?"
                    + new BASE64Encoder().encode(filename.getBytes("utf-8"))
                    + "?=";
            filename = filename.replaceAll("\r\n", "");
        } else { // IE及其他浏览器
            filename = URLEncoder.encode(filename, "utf-8");
            filename = filename.replace("+"," ");
        }
        return filename;
    }
    
}
