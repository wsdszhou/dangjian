package com.glut.dangjian.background.news.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.glut.dangjian.background.news.service.LmService;
import com.glut.dangjian.entity.other.Lmb;
import com.glut.dangjian.mapper.background.news.ColumnMapper;

@Service("lmService")
@Transactional
public class LmbServiceImpl implements LmService{

    @Autowired
    private ColumnMapper lmbMapper;

    /**
     * 获取所有栏目
     * @return
     */
    @Override
    @Cacheable(value="columnCache", key="#root.methodName"  )
    public List<Lmb> getLmbList() {
        return lmbMapper.getLmbList();
    }

	/**
	 * 查询非首栏目信息
	 * @return
	 */
	@Override
    @Cacheable(value="columnCache", key="#root.methodName"  )
	public List<Lmb> getNotFirstLmbList() {
		
		return lmbMapper.getNotFirstLmbList();
	}

    /**
     * 获取一级栏目
     * @return
     */
    @Override
    @Cacheable(value="columnCache", key="#root.methodName"  )
    public List<Lmb> getFirstLmbList() {
        return lmbMapper.getFirstLmbList();
    }

    /**
     * 获取子栏目
     * @param lmId 栏目父id
     * @return
     */
    @Override
    @Cacheable(value="columnCache", key="'#root.methodName'+'#p0'"  )
    public List<Lmb> getChildrenLmbListByFid(Integer lmId) {
        return lmbMapper.getChildrenLmbListByFid(lmId);
    }

	/**
	 * 根据 pid 获取所有父级栏目
	 * @param list
	 * @param pid
	 * @return
	 */
	@Override
    @Cacheable(value="columnCache", key="'#root.methodName'+'#p0' +'--'+ '#p1'"  )
	public List<Lmb> getChildGroup(List<Lmb> list, int pid) {
		//创建一个新的 List 用来保存 其 lmPid 为 pid 的 栏目
		List<Lmb> arr = new ArrayList<>();
		//遍历 list
		for(Lmb lmb : list){
			//如果当前遍历的栏目的父id与传入的pid相同，则当前栏目为 pid 的子栏目
			if(lmb.getLmFid() == pid){
				//继续递归子栏目
				lmb.setChildrenList(getChildGroup(list,lmb.getLmId()));
				//把当前的查找到的加入到List中返回
				arr.add(lmb);
			}
		}
		return arr;
	}

	/**
	 * 添加栏目
	 * @param lmb
	 * @return
	 */
	@Override
    @CacheEvict(value="columnCache", allEntries=true)
	public Boolean addLmb(Lmb lmb) {
		lmb.setLmXgsj(new Date());
		lmb.setLmId(lmbMapper.getMaxLmId()+1);
		return lmbMapper.insert(lmb) == 1;
	}

	/**
	 * 删除栏目以及其子栏目 -_-
	 * @param id
	 * @return
	 */
    @CacheEvict(value="columnCache", allEntries=true)
	public void deleteLmbById(int id){
		lmbMapper.deleteByPrimaryKey(id);
	}

	/**
	 * 更新栏目
	 * @param lmb
	 * @return
	 */
    @CacheEvict(value="columnCache", allEntries=true)
	public boolean updateLmb(Lmb lmb) {
		lmb.setLmXgsj(new Date());
		return lmbMapper.updateByPrimaryKey(lmb) == 1;
	}

}
