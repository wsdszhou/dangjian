package com.glut.dangjian.background.department.service.imp;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.glut.dangjian.background.department.service.DepartmentService;
import com.glut.dangjian.config.UrlConfig;
import com.glut.dangjian.entity.department.Bmb;
import com.glut.dangjian.entity.news.XwTpb;
import com.glut.dangjian.entity.news.Xwb;
import com.glut.dangjian.entity.user.Yhb;
import com.glut.dangjian.mapper.background.department.DepartmentMapper;
import com.glut.dangjian.mapper.background.picture.XwTpbMapper;
import com.glut.dangjian.utils.FileOpreateUtiles;

@Service
@Transactional(propagation=Propagation.NESTED)
public class DepartmentServiceImpl implements DepartmentService{

    @Autowired
    private DepartmentMapper bmbMapper;

    @Autowired
    private XwTpbMapper xwTpbMapper;
	/**
	 * 加载所有的部门
	 * @return
	 */
    @Override
    public List<Bmb> loadBmList() {
        return bmbMapper.loadBranchList();
    }

	/**
	 * 分页查询部门表
	 * @param pageNum 页数
	 * @param pageSize 每页记录数
	 * @return
	 */
	@Override
    @Cacheable(value="departmentCache", key="'#p0'+'#p1'"  )
	public PageInfo getBmList(Integer pageNum,Integer pageSize) {
		PageHelper.startPage(pageNum,pageSize);
		List<Bmb> list = bmbMapper.loadBmList();
		return new PageInfo<>(list);
	}

	@Override
	@CacheEvict(value="departmentCache", allEntries=true)
	public void addBm(Bmb bmb, String pictureId, Yhb yhb) {
	    bmb.setBmCjsj(new Date());
	    bmb.setBmXgsj(new Date());
		bmbMapper.insertSelective(bmb);
		Integer bmid = bmbMapper.getIdByName(bmb.getBmMc());
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

	@Override
    @CacheEvict(value="departmentCache", allEntries=true)
	public void editBm(Bmb bmb) {
	    bmb.setBmXgsj(new Date());
		bmbMapper.updateByPrimaryKeySelective(bmb);
	}

	/**
	 * 批量删除部门
	 * @param tpIds
	 */
	@Override
    @CacheEvict(value="departmentCache", allEntries=true)
	public void deleteBms(HttpServletRequest request, String[] bmIds) {
		int[] ids = new int[bmIds.length]; 
		for(int i=0; i<ids.length; i++) {
		    ids[i] = Integer.parseInt(bmIds[i]);
		}
		for(int id : ids) {
            List<String> picturnUrls =  xwTpbMapper.getPicturnUrlByNewsId("" +id +"");
            FileOpreateUtiles.deleteFile(request, picturnUrls + UrlConfig.DEPARTMENT);
        }
		bmbMapper.deleteByPrimaryKey(ids);

	}

	/**
	 * 获取所有的部门
	 */
    @Override
    @Cacheable(value="departmentCache", key="#root.methodName"  )
    public Map<String, Integer> getAll() {
        
        List<Bmb> bmbs = bmbMapper.loadBmList();
        Map<String, Integer> map = new HashMap<String, Integer>();
        Iterator iterator = bmbs.iterator();
        Bmb bmb = null;
        while(iterator.hasNext()) {
            bmb = (Bmb) iterator.next();
            map.put(bmb.getBmMc(), bmb.getBmId());
        }
        return map;
    }

}
