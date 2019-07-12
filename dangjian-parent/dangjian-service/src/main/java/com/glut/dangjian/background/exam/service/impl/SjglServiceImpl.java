package com.glut.dangjian.background.exam.service.impl;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.glut.dangjian.background.exam.service.SjglService;
import com.glut.dangjian.entity.kszx.*;
import com.glut.dangjian.entity.kszx.view.ViewKszxTestPaper;
import com.glut.dangjian.entity.kszx.view.ViewKszxXscj;
import com.glut.dangjian.mapper.background.exam.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

/**
 * Created by IntelliJ IDEA.
 * User: lishidongol
 * Date: 2018/11/8
 * Time: 7:09 PM
 * 简单的事情重复做，重复的事情坚持做，坚持的事情用心做
 **/

@Service("SjglService")
@Transactional(propagation=Propagation.NESTED)
public class SjglServiceImpl implements SjglService {

    @Autowired
    KszxSjflMapper kszxSjflMapper;

    @Autowired
    KszxSjMapper kszxSjMapper;

    @Autowired
    KszxStMapper kszxStMapper;

    @Autowired
    KszxSjGdstMapper kszxSjGdstMapper;

    @Autowired
    KszxSjSjstMapper kszxSjSjstMapper;

    @Autowired
    KszxStflMapper kszxStflMapper;

    @Override
    @Cacheable(value="examManageCache", key="#root.methodName"  )
    public List<KszxSjfl> loadCategories() {
        return kszxSjflMapper.select();
    }

    @Override
    @CacheEvict(value="examManageCache", allEntries=true)
    public void modifyCategorie(KszxSjfl kszxSjfl) {
        kszxSjflMapper.update(kszxSjfl);
    }

    @Override
    @CacheEvict(value="examManageCache", allEntries=true)
    public void deleteCategorie(KszxSjfl kszxSjfl) {
        kszxSjflMapper.delete(kszxSjfl);
    }

    @Override
    @CacheEvict(value="examManageCache", allEntries=true)
    public void addCategorie(KszxSjfl kszxSjfl) {
        kszxSjflMapper.insert(kszxSjfl);
    }


    @Override
    public PageInfo<ViewKszxTestPaper> loadTestPaperList(TestPaperFilter filter) {
        PageHelper.startPage(filter.getPage(),filter.getLimit());
        List<ViewKszxTestPaper> list = kszxSjMapper.selectAll(filter);
        return new PageInfo<>(list);
    }

    @Override
    @CacheEvict(value="examManageCache", allEntries=true)
    public void addTestPaperBaseInfo(ViewKszxTestPaper kszxTestPaper) {
        kszxTestPaper.setCjrq(new Date());
        kszxSjMapper.addKszxSj(kszxTestPaper);
    }

    @Override
    @Cacheable(value="examManageCache", key="'#root.methodName'+'#p0'"  )
    public List<KszxSjGdst> findAllFixQuestionById(int id) {
        return kszxSjGdstMapper.selectBySjid(id);
    }

    @Override
    @CacheEvict(value="examManageCache", allEntries=true)
    public void addFixQuestion(KszxSjGdst gdst) {
        kszxSjGdstMapper.insertOne(gdst);
    }

    @Override
    @CacheEvict(value="examManageCache", allEntries=true)
    public void deleteFixQuestion(KszxSjGdst gdst) {
        kszxSjGdstMapper.deleteOne(gdst);
    }

    @Override
    @CacheEvict(value="examManageCache", allEntries=true)
    public List<Map<String,Object>> updateFixQuestionCount(int sjid) {
        List<Map<String,Object>> list = kszxSjGdstMapper.countQuestionType(sjid);
        KszxSj sj = kszxSjMapper.selectOneById(sjid);
        for(Map<String,Object> map : list ){
            int count = 0;
            for(Map.Entry<String,Object> entry :map.entrySet()){
                if(entry.getKey().equals("stlx")){
                    if (entry.getValue().equals("判断题")) {
                        sj.setPdtsl(count);
                        count = 0;
                    } else if (entry.getValue().equals("单选题")) {
                        sj.setDxtsl(count);
                        count = 0;
                    } else if (entry.getValue().equals("多选题")) {
                        sj.setDxtssl(count);
                        count = 0;
                    }
                }else {
                    count = Integer.valueOf(String.valueOf(entry.getValue()));
                }
            }
        }
        sj.setStzs(sj.getPdtsl()+sj.getDxtsl()+sj.getDxtssl());
        sj.setSjzf(sj.getPdtsl()*sj.getPdtfs()+sj.getDxtsl()*sj.getDxtfs()+sj.getDxtssl()*sj.getDxtsfs());
        kszxSjMapper.updateQuestionInfo(sj);
        return list;
    }

    @Override
    @Cacheable(value="examManageCache", key="'#root.methodName'+'--'+'#p0'"  )
    public KszxSj loadTestPaper(int sjid) {
        return kszxSjMapper.selectOneById(sjid);
    }

    @Override
    @CacheEvict(value="examManageCache", allEntries=true)
    public void updateTestPaperBaseInfo(ViewKszxTestPaper kszxTestPaper) {
        kszxSjMapper.updateTestPaperBaseInfo(kszxTestPaper);
        if(kszxTestPaper.getZjfs() == 1){
            updateFixQuestionCount(kszxTestPaper.getId());
        }

    }

    @Override
    @Cacheable(value="examManageCache", key="'#root.methodName'+'--'+'#p0'"  )
    public List<KszxSjSjst> findAllRandomRuleById(int id) {
        return kszxSjSjstMapper.selectBySjid(id);
    }

    @Override
    @Cacheable(value="examManageCache", key="'#root.methodName'+'--'+'#p0'"  )
    public List<Map<String, Object>> loadQuestionCount() {
        return kszxStMapper.selectQuestionsTypeCount();
    }

    @Override
    @CacheEvict(value="examManageCache", allEntries=true)
    public void addRandomQuestion(KszxSjSjst sjst) {
        kszxSjSjstMapper.insertOne(sjst);
    }

    @Override
    @CacheEvict(value="examManageCache", allEntries=true)
    public void deleteRandomQuestion(int sjstid) {
        kszxSjSjstMapper.deleteOneById(sjstid);
    }

    @Override
    @CacheEvict(value="examManageCache", allEntries=true)
    public void updateRandomQuestion(KszxSjSjst sjst) {
        kszxSjSjstMapper.update(sjst);
    }

    @Override
    @CacheEvict(value="examManageCache", allEntries=true)
    public void updateRandomQuestionCount(int sj) {
        List<KszxSjSjst> list = kszxSjSjstMapper.selectBySjid(sj);
        KszxSj kszxSj = kszxSjMapper.selectOneById(sj);
        int stzs = 0;
        int pdtsl = 0;
        int dxtsl = 0;
        int dxtssl = 0;
        for(KszxSjSjst sjst:list){
            pdtsl = pdtsl + sjst.getPdtsl();
            dxtsl = dxtsl + sjst.getDxtsl();
            dxtssl = dxtssl + sjst.getDxtssl();
            stzs = stzs + sjst.getPdtsl()+sjst.getDxtsl()+sjst.getDxtssl();
        }
        int sjzf = pdtsl*kszxSj.getPdtfs()+dxtsl*kszxSj.getDxtfs()+dxtssl*kszxSj.getDxtsfs();
        kszxSj.setSjzf(sjzf);
        kszxSj.setStzs(stzs);
        kszxSj.setPdtsl(pdtsl);
        kszxSj.setDxtsl(dxtsl);
        kszxSj.setDxtssl(dxtssl);
        kszxSjMapper.updateQuestionInfo(kszxSj);
    }

    @Override
    @CacheEvict(value="examManageCache", allEntries=true)
    public void deleteTestPaper(KszxSj kszxSj) {
        kszxSjMapper.delete(kszxSj.getId());
        if(kszxSj.getZjfs() == 1){
            kszxSjGdstMapper.deleteBySjid(kszxSj.getId());
        }else {
            kszxSjSjstMapper.deleteBySjid(kszxSj.getId());
        }

    }

    @Override
    @CacheEvict(value="examManageCache", allEntries=true)
    public void modifyTestpaperStatus(int testpaperId, int status) {
        kszxSjMapper.updateTestPaperStatus(testpaperId,status);
    }

    @Override
    @Cacheable(value="examManageCache", key="'#root.methodName'+'#p0'+'--'+'#p1'"  )
    public PageInfo loadStudentScore(int page, int limit) {
        PageHelper.startPage(page,limit);
        List<ViewKszxXscj> list = kszxSjMapper.selectStudentScore();
        return new PageInfo<>(list);
    }
}
