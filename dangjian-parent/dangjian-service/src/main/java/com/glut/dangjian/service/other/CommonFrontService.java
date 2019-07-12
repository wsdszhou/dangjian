package com.glut.dangjian.service.other;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.glut.dangjian.entity.branch.Zbb;
import com.glut.dangjian.entity.department.Bmb;
import com.glut.dangjian.entity.other.Dnzwb;
import com.glut.dangjian.entity.other.Jgb;
import com.glut.dangjian.entity.other.Mzb;
import com.glut.dangjian.entity.other.Xlb;
import com.glut.dangjian.entity.other.Xzzwb;
import com.glut.dangjian.entity.other.Zzmmb;
import com.glut.dangjian.mapper.background.other.AdministrativeJobMapper;
import com.glut.dangjian.mapper.background.other.EducationMapper;
import com.glut.dangjian.mapper.background.other.JgbMapper;
import com.glut.dangjian.mapper.background.other.NationMapper;
import com.glut.dangjian.mapper.background.other.PartyJobMapper;
import com.glut.dangjian.mapper.background.other.PoliticsStateMapper;

/** 
* @author xulankong
* @date 创建时间:  2018年12月23日 上午9:15:26
* @version 1.0
*/
public interface CommonFrontService {

    List<Bmb> getDepartMentList();

    List<Zbb> getAllBranch();

    List<Zbb> getBranchListByDeptId(Integer deptId);

    List<Zzmmb> getAllPoliticsState();

    List<Xzzwb> getAllAdministrativeJob();

    List<Dnzwb> getAllPartyJob();

    List<Jgb> getPlace();
    
    List<Jgb> getPlaceByProvince( int province);

    List<Mzb> getNation();

    List<Xlb> getEducation();
    
}
