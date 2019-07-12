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
import com.glut.dangjian.background.department.service.BranchHonorService;
import com.glut.dangjian.config.UrlConfig;
import com.glut.dangjian.entity.branch.Zbry;
import com.glut.dangjian.entity.news.XwTpb;
import com.glut.dangjian.entity.news.Xwb;
import com.glut.dangjian.entity.user.Yhb;
import com.glut.dangjian.mapper.background.branch.BranchHonorMapper;
import com.glut.dangjian.mapper.background.picture.XwTpbMapper;
import com.glut.dangjian.utils.FileOpreateUtiles;

/** 
* @author xulankong
* @date 创建时间:  2018年11月8日 下午9:09:26
* @version 1.0
*/
@Service
@Transactional(propagation=Propagation.NESTED)
public class BranchHonorServiceImp implements BranchHonorService {
    
    @Autowired
    BranchHonorMapper branchHonorMapper;
    
    @Autowired
    private XwTpbMapper xwTpbMapper;

    /**
     * 分页查询
     */
    @Override
    public PageInfo getBranchHonorPageList(Integer pageNum, Integer pageSize, Zbry zbry) {
        PageHelper.startPage(pageNum, pageSize);
        List<Zbry> list = branchHonorMapper.getBranchHonorListPage(zbry);
        return new PageInfo<Zbry>(list);
    }

    /**
     * 添加部分荣誉
     */
    @Override
    public void addBranchHonor(Zbry zbry, String pictureId, Yhb yhb) {
        zbry.setZbryHdsj(new Date());
        branchHonorMapper.insertSelective(zbry);
        Integer honorId = branchHonorMapper.getHonorIdByName(zbry.getZbryMc());
        if ( pictureId != null ) {
            String[] pictureIds = pictureId.split(",");
            List<XwTpb> list = new ArrayList<>();
            for(String id : pictureIds) {
                XwTpb picture = xwTpbMapper.getTpbByTpId(id);
                picture.setXwb(new Xwb(honorId +""));
                list.add(picture);
            }
            xwTpbMapper.updateBranch(list);
        }
    }

    /**
     * 修改部门荣誉信息
     */
    @Override
    public void editBranchHonor(Zbry zbry) {
        branchHonorMapper.updateByPrimaryKeySelective(zbry);
    }

    
    /**
     * 删除支部荣誉
     */
    @Override
    public void deleteBranchHonorBratch(HttpServletRequest request,String[] ids) {
        int[] zbryIds = new int[ids.length];
        for (int i = 0; i < ids.length; i++) {
            zbryIds[i] = Integer.parseInt(ids[i]);
        }
        for(int zbryId : zbryIds) {
            List<String> picturnUrls =  xwTpbMapper.getPicturnUrlByNewsId("" +zbryId +"");
            FileOpreateUtiles.deleteFile(request, picturnUrls + UrlConfig.BRANCHHONOR);
        }
        branchHonorMapper.deleteBranchHonorBratch(zbryIds);          
    }

}
