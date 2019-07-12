package com.glut.dangjian.background.department.service.imp;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.glut.dangjian.background.department.service.DepartmentHonorService;
import com.glut.dangjian.config.UrlConfig;
import com.glut.dangjian.entity.department.Bmb;
import com.glut.dangjian.entity.department.Bmry;
import com.glut.dangjian.entity.news.XwTpb;
import com.glut.dangjian.entity.news.Xwb;
import com.glut.dangjian.entity.user.Yhb;
import com.glut.dangjian.mapper.background.department.DepartmentHonorMapper;
import com.glut.dangjian.mapper.background.picture.XwTpbMapper;
import com.glut.dangjian.utils.FileOpreateUtiles;

/** 
* @author xulankong
* @date 创建时间:  2018年11月8日 下午9:09:26
* @version 1.0
*/
@Service
@Transactional(propagation=Propagation.NESTED)
public class DepartmentHonorServiceImp implements DepartmentHonorService {
    
    @Autowired
    DepartmentHonorMapper deptMapper;

    @Autowired
    private XwTpbMapper xwTpbMapper;
    /**
     * 分页查询
     */
    @Override
    public PageInfo getDeptHonorListPage(Integer pageNum, Integer pageSize, Bmry bmry) {
        
        PageHelper.startPage(pageNum, pageSize);
        List<Bmry> list = deptMapper.getDeptHonorListPage(bmry);
        return new PageInfo<Bmry>(list);
    }

    /**
     * 添加部分荣誉
     */
    @Override
    public void addDeptHonor(Bmry bmry, String pictureId, Yhb yhb) {
        // TODO Auto-generated method stub
        bmry.setBmryHdsj(new Date());
        deptMapper.insertSelective(bmry);
        Integer bmid = deptMapper.getHonorIdByName(bmry.getBmryMc());
        if ( pictureId != null ) {
            String[] pictureIds = pictureId.split(",");
            List<XwTpb> list = new ArrayList<>();
            for(String id : pictureIds) {
                XwTpb picture = xwTpbMapper.getTpbByTpId(id);
                picture.setXwb(new Xwb(bmid +""));
                list.add(picture);
            }
            xwTpbMapper.updateBranch(list);
        }
    }

    /**
     * 修改部门荣誉信息
     */
    
    @Override
    public void editDeptHonor(Bmry bmry) {
        // TODO Auto-generated method stub
        deptMapper.updateByPrimaryKeySelective(bmry);
    }

    /**
     * 删除部门荣誉
     */
    @Override
    public void deleteDeptHonorBratch(HttpServletRequest request,String[] ids) {
        int[] honorIds = new int[ids.length];
        for (int i = 0; i < ids.length; i++) {
            honorIds[i] = Integer.parseInt(ids[i]);
        }
        for(int honorId : honorIds) {
            List<String> picturnUrls =  xwTpbMapper.getPicturnUrlByNewsId("" +honorId +"");
            FileOpreateUtiles.deleteFile(request, picturnUrls + UrlConfig.DEPARTMENTNOHOR);
        }
        deptMapper.deleteBratch(honorIds);
    }

}
