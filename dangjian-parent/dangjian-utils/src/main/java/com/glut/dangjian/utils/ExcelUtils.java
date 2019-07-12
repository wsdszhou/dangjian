package com.glut.dangjian.utils;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: lishidongol
 * Date: 2018/11/7
 * Time: 4:45 PM
 * 简单的事情重复做，重复的事情坚持做，坚持的事情用心做
 **/
public class ExcelUtils {
    private final static String xls = "xls";
    private final static String xlsx = "xlsx";

    public static void readExcel(File file){
        try {
            XSSFWorkbook xssfWorkbook = new XSSFWorkbook(file);
            //获取
            System.out.println("--------------------------------------");
            //工作薄sheet数量
            System.out.println(xssfWorkbook.getNumberOfSheets());
            XSSFSheet xssfSheet = xssfWorkbook.getSheetAt(0);

            /*
            int CELL_TYPE_NUMERIC = 0;  数值
            int CELL_TYPE_STRING = 1;   字符串
            int CELL_TYPE_FORMULA = 2;  公式
            int CELL_TYPE_BLANK = 3;    空单元
            int CELL_TYPE_BOOLEAN = 4;  Boolean
            int CELL_TYPE_ERROR = 5;    错误
             */

            //遍历sheet
            for(int i=0;i<xssfSheet.getLastRowNum();i++){
                XSSFRow xssfRow = xssfSheet.getRow(i);
                for(int j=0;j<xssfRow.getLastCellNum();j++){
                    XSSFCell xssfCell = xssfRow.getCell(j);
                    switch (xssfCell.getCellType()){
                        case XSSFCell.CELL_TYPE_NUMERIC://数值
                            System.out.print(xssfCell.getNumericCellValue()+"\t");
                            break;
                        case XSSFCell.CELL_TYPE_STRING://字符串
                            System.out.print(xssfCell.getStringCellValue()+"\t");
                            break;
                        case XSSFCell.CELL_TYPE_FORMULA://公式
                            System.out.print(xssfCell.getCellFormula()+"\t");
                            break;
                        case XSSFCell.CELL_TYPE_BLANK://空值
                            System.out.print("\t");
                            break;
                        case XSSFCell.CELL_TYPE_BOOLEAN://布尔型
                            System.out.print(xssfCell.getBooleanCellValue()+"\t");
                            break;
                        case XSSFCell.CELL_TYPE_ERROR://错误
                            System.out.print(xssfCell.getErrorCellString()+"\t");
                            break;
                    }

                }
                System.out.println();
            }

        } catch (IOException | InvalidFormatException e) {
            e.printStackTrace();
        }
    }

}

