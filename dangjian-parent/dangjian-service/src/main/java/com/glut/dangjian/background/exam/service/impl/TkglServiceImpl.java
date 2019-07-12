package com.glut.dangjian.background.exam.service.impl;

import com.github.pagehelper.PageHelper;
import com.glut.dangjian.background.exam.service.TkglService;
import com.glut.dangjian.entity.kszx.KszxSt;
import com.glut.dangjian.entity.kszx.KszxStxx;
import com.glut.dangjian.entity.kszx.KszxTmfl;
import com.glut.dangjian.entity.kszx.QuestionFilter;
import com.glut.dangjian.entity.kszx.view.ViewKszxStlb;
import com.glut.dangjian.mapper.background.exam.KszxStMapper;
import com.glut.dangjian.mapper.background.exam.KszxStflMapper;
import com.glut.dangjian.mapper.background.exam.KszxStxxMapper;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.io.File;
import java.io.IOException;
import java.util.*;

/**
 * Created by IntelliJ IDEA.
 * User: lishidongol
 * Date: 2018/9/29
 * Time: 12:41
 */

@Service("TkglService")
@Transactional(propagation=Propagation.NESTED)
public class TkglServiceImpl implements TkglService {

    //试题分类Mapper
    @Autowired
    KszxStflMapper kszxStflMapper;
    //试题Mapper
    @Autowired
    KszxStMapper kszxStMapper;
    //试题选项Mapper
    @Autowired
    KszxStxxMapper kszxStxxMapper;

    /**
     * 加载试题分类
     *
     * @return
     */
    @Override
    @Transactional(readOnly = true,propagation = Propagation.REQUIRED)
    @Cacheable(value="topicManageCache", key="#root.methodName"  )
    public List<KszxTmfl> loadCategories() {
        return kszxStflMapper.selectCategories();
    }

    /**
     * 添加题目分类
     *
     * @param map
     * @return
     */
    @Override
    @CacheEvict(value="topicManageCache", allEntries=true)
    public int addCategorie(Map<String, Object> map) {
        return kszxStflMapper.insertCategorie(map);
    }

    /**
     * 更新题目分类
     * @param kszxTmfl
     * @return
     */
    @Override
    @CacheEvict(value="topicManageCache", allEntries=true)
    public int updateCategorie(KszxTmfl kszxTmfl) {
        return kszxStflMapper.updateCategorie(kszxTmfl);
    }

    /**
     * 删除试题分类
     * @param id
     */
    @Override
    @CacheEvict(value="topicManageCache", allEntries=true)
    public void removeCategorie(int id) {
        // TODO 删除前检查被删除的分类下是否还有子分类，被删除的分类是否被试题使用
        // 第一步：查找要删除分类下的子分类
        List<KszxTmfl> delIdList = kszxStflMapper.selectCategoriesByPid(id);
        System.out.println(delIdList.toString());
        kszxStflMapper.deleteCategorieById(id);
        // TODO 将使用此分类的题目归并到默认分类下
        kszxStMapper.updateQuestionsCategorie(id,99999);
        //第二步：递归调用自身
        for(KszxTmfl kszxTmfl:delIdList){
            removeCategorie(kszxTmfl.getId());
        }
    }

    /**
     * 加载试题
     * @return ViewKszxStlb
     */
    @Override
    @Transactional(readOnly = true)
    public List<ViewKszxStlb> loadQuestions(QuestionFilter questionFilter) {
        PageHelper.startPage(questionFilter.getPage(),questionFilter.getLimit());
        return kszxStMapper.selectQuestions(questionFilter);
    }

    /**
     * 加载试题详细信息
     *
     * @param stid
     * @return
     */
    @Override
    @Transactional(readOnly = true)
    @Cacheable(value="topicManageCache", key="'#root.methodName'+'--'+'#p0'"  )
    public ViewKszxStlb loadQuestionDetail(int stid) {
        return kszxStMapper.findQuestionDetailById(stid);
    }

    /**
     * 更新试题
     * @param kszxSt
     */
    @Override
    @CacheEvict(value="topicManageCache", allEntries=true)
    public void updateQuestion(KszxSt kszxSt) {
        kszxStMapper.updateQuestion(kszxSt);
        //更新试题选项步骤：1.删除原有的选项2.添加新选项
        if(kszxSt.getKszxStxxList() != null){
            kszxStxxMapper.deleteByStid(kszxSt.getId());
            kszxStxxMapper.insert(kszxSt.getKszxStxxList());
        }
    }

    /**
     * 添加试题
     * @param kszxSt
     */
    @Override
    @CacheEvict(value="topicManageCache", allEntries=true)
    public void addQuestion(KszxSt kszxSt) {
        int resCode = kszxStMapper.insertQuestion(kszxSt);
        if(!kszxSt.getStlx().equals("判断题"))
            kszxStxxMapper.insertByStid(kszxSt.getKszxStxxList(),kszxSt.getId());
    }

    @Override
    @CacheEvict(value="topicManageCache", allEntries=true)
    public void removeQuestion(String[] ids) {
        for(String id:ids){
            kszxStMapper.deleteQuesyionById(Integer.parseInt(id));
            kszxStxxMapper.deleteByStid(Integer.parseInt(id));
        }
    }

    @Override
    @CacheEvict(value="topicManageCache", allEntries=true)
    public void importQuestionExcel(File file) {
        List<Map<String, Integer>> categories = kszxStflMapper.selectCategoriesToHashMap();
        List<KszxSt> kszxStList = new ArrayList<>();
        try {
            XSSFWorkbook xssfWorkbook = new XSSFWorkbook(file);
            XSSFSheet xssfSheet = xssfWorkbook.getSheetName(0).equals("import") ? xssfWorkbook.getSheetAt(0) : null;
            if(xssfSheet != null){
                //遍历行,忽略标题行
                for(int i=1;i<=xssfSheet.getLastRowNum();i++){
                    XSSFRow xssfRow = xssfSheet.getRow(i);
                    KszxSt kszxSt = new KszxSt();
                    //todo 在这里添加试题的导入人员,即当前会话的用户名
                    kszxSt.setStzz("lsd");
                    List<KszxStxx> stxxList = new ArrayList<>();
                    //遍历列
                    for(int j=0;j<xssfRow.getLastCellNum();j++){
                        XSSFCell xssfCell = xssfRow.getCell(j);
                        switch (j){
                            case 0:
                                kszxSt.setStmc(xssfCell.getStringCellValue());
                                break;
                            case 1:
                                kszxSt.setStlx(xssfCell.getStringCellValue());
                                break;
                            case 2:
                                kszxSt.setStda(xssfCell.getStringCellValue());
                                break;
                            case 3:
                                kszxSt.setStfl(99999);
                                for (Map<String,Integer> map : categories){
                                    if(String.valueOf(map.get("name")).equals(xssfCell.getStringCellValue())){
                                        kszxSt.setStfl(Integer.valueOf(String.valueOf(map.get("id"))));
                                        break;
                                    }
                                }
                                break;
                            case 4:
                                kszxSt.setStnd(String.valueOf(Math.round(xssfCell.getNumericCellValue())));
                                break;
                        }
                        if(j==5){
                            if(!(xssfCell == null || "".equals(xssfCell.getStringCellValue()))){
                                kszxSt.setStjx(xssfCell.getStringCellValue());
                            }
                        }
                        if(j>5){
                            if(!"判断题".equals(kszxSt.getStlx())){
                                KszxStxx kszxStxx = new KszxStxx();
                                kszxStxx.setXx(j-5);
                                System.out.println(kszxSt);
                                kszxStxx.setXxz(xssfCell.getStringCellValue());
                                stxxList.add(kszxStxx);
                            }
                        }
                    }
                    kszxSt.setKszxStxxList(stxxList);
                    kszxStList.add(kszxSt);
                }
            }
            System.out.println(kszxStList);
        } catch (IOException | InvalidFormatException e) {
            e.printStackTrace();
        }


        for(KszxSt kszxSt : kszxStList){
            //System.out.println(kszxSt);
            addQuestion(kszxSt);
        }

    }
}
