package com.glut.dangjian.service.other.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.glut.dangjian.entity.branch.Zbb;
import com.glut.dangjian.entity.department.Bmb;
import com.glut.dangjian.entity.other.Dnzwb;
import com.glut.dangjian.entity.other.Jgb;
import com.glut.dangjian.entity.other.Mzb;
import com.glut.dangjian.entity.other.Xlb;
import com.glut.dangjian.entity.other.Xzzwb;
import com.glut.dangjian.entity.other.Zzmmb;
import com.glut.dangjian.mapper.background.branch.BranchMapper;
import com.glut.dangjian.mapper.background.department.DepartmentMapper;
import com.glut.dangjian.mapper.background.other.AdministrativeJobMapper;
import com.glut.dangjian.mapper.background.other.EducationMapper;
import com.glut.dangjian.mapper.background.other.JgbMapper;
import com.glut.dangjian.mapper.background.other.NationMapper;
import com.glut.dangjian.mapper.background.other.PartyJobMapper;
import com.glut.dangjian.mapper.background.other.PoliticsStateMapper;
import com.glut.dangjian.service.other.CommonFrontService;

/** 
* @author xulankong
* @date 创建时间:  2018年12月23日 上午9:15:57
* @version 1.0
*/
@Service
@Transactional(propagation=Propagation.NESTED)
public class CommonFrontServiceImpl implements CommonFrontService {

    @Autowired
    private DepartmentMapper departmentMapper;
    
    @Autowired
    private BranchMapper branchMapper;
    
    @Autowired
    private PoliticsStateMapper politicsStateMapper;
    
    @Autowired
    private AdministrativeJobMapper administrativeJobMapper;
    
    @Autowired
    private PartyJobMapper partyJobMapper;
    
    @Autowired
    private JgbMapper jgbMapper;
    
    @Autowired
    private NationMapper nationMapper;
    
    @Autowired
    private EducationMapper educationMapper;
    /**
     * 获取所有的部门
     */
    @Override
    @Cacheable(value="otherCache", key="#root.methodName"  )
    public List<Bmb> getDepartMentList() {
        
        return departmentMapper.getDepartMentList();
    }

    /**
     * 获取所有的支部
     */
    @Override
    @Cacheable(value="otherCache", key="#root.methodName"  )
    public List<Zbb> getAllBranch() {
        
        return branchMapper.getAllBranch();
    }

    /**
     * 根据部门id获取支部
     */
    @Override
    public List<Zbb> getBranchListByDeptId(Integer deptId) {
        
        return branchMapper.getBranchListByDeptId(deptId);
    }

    /**
     * 获取政治面貌列表
     */
    @Override
    @Cacheable(value="otherCache", key="#root.methodName"  )
    public List<Zzmmb> getAllPoliticsState() {
        
        return politicsStateMapper.loadPoliticsStateAll();
    }

    /**
     * 获取行政职务列表
     */
    @Override
    @Cacheable(value="otherCache", key="#root.methodName"  )
    public List<Xzzwb> getAllAdministrativeJob() {
        
        return administrativeJobMapper.loadAdministrativeJobAll();
    }

    /**
     * 获取党内职务列表
     */
    @Override
    @Cacheable(value="otherCache", key="#root.methodName"  )
    public List<Dnzwb> getAllPartyJob() {
        
        return partyJobMapper.loadPartyJobAll();
    }

    /**
     * 获取籍贯列表
     */
    @Override
    @Cacheable(value="otherCache", key="#root.methodName"  )
    public List<Jgb> getPlace() {
        
        return jgbMapper.getJgbList();
    }

    /**
     * 获取民族列表
     */
    @Override
    @Cacheable(value="otherCache", key="#root.methodName"  )
    public List<Mzb> getNation() {
        
        return nationMapper.loadNationAll();
    }

    /**
     * 获取学历列表
     */
    @Override
    @Cacheable(value="otherCache", key="#root.methodName"  )
    public List<Xlb> getEducation() {
        
        return educationMapper.loadEducationAll();
    }

    @Override
    @Cacheable(value="otherCache", key="'#p0'+'--'+'#root.methodName'"  )
    public List<Jgb> getPlaceByProvince( int province) {
        
        return jgbMapper.getJgbListBySzsId(province);
    }

}
