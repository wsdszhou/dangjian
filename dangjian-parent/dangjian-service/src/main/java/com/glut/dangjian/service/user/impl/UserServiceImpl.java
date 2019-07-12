package com.glut.dangjian.service.user.impl;

import static org.hamcrest.CoreMatchers.nullValue;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.glut.dangjian.background.authority.service.RoleService;
import com.glut.dangjian.background.department.service.BranchService;
import com.glut.dangjian.background.department.service.DepartmentService;
import com.glut.dangjian.background.other.service.AdministrativeJobService;
import com.glut.dangjian.background.other.service.EducationService;
import com.glut.dangjian.background.other.service.JgService;
import com.glut.dangjian.background.other.service.NationService;
import com.glut.dangjian.background.other.service.PartyJobService;
import com.glut.dangjian.background.other.service.PoliticsStateService;
import com.glut.dangjian.background.other.service.UserStateService;
import com.glut.dangjian.entity.authority.UserRole;
import com.glut.dangjian.entity.user.YhXxb;
import com.glut.dangjian.entity.user.Yhb;
import com.glut.dangjian.entity.view.ViewYhxx;
import com.glut.dangjian.mapper.system.view.ViewYhxxMapper;
import com.glut.dangjian.mapper.user.UserMapper;
import com.glut.dangjian.service.user.UserService;
import com.glut.dangjian.utils.MD5Utils;
import com.glut.dangjian.utils.StringTools;

@Service
@Transactional(propagation=Propagation.NESTED)
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private ViewYhxxMapper viewUserInfoMapper;

    @Autowired
    private EducationService educationService;

    @Autowired
    private JgService jgService;

    @Autowired
    private PartyJobService partyJobService;

    @Autowired
    private NationService nationService;

    @Autowired
    private AdministrativeJobService administrativeJobService;

    @Autowired
    private DepartmentService departmentService;

    @Autowired
    private BranchService branchService;

    @Autowired
    private UserStateService userStateService;

    @Autowired
    private PoliticsStateService politicsStateService;

    @Autowired
    private RoleService roleService;
    
    /**
     * 修改密码业务处理
     */
    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, readOnly = false)
    public void updateUserPassword(Yhb yhb) {
        // 加密密码
        String password = MD5Utils.getMD5Str(yhb.getUserMm() + yhb.getUserPwk());
        yhb.setUserMm(password);
        userMapper.updateYhPassword(yhb);
    }

    @Override
    public void updateYhPassword(Yhb yhb) {

        userMapper.updateYhPassword(yhb);
    }

    /**
     * 修改个人信息
     */
    @Override
    public void updateViewUserInfo(ViewYhxx viewYhxx) {

        viewUserInfoMapper.updateViewYhxx(viewYhxx);
    }

    /**
     * 获取个人信息
     */
    @Override
    public ViewYhxx getUserInfo(Yhb yhb) {

        return viewUserInfoMapper.getViewYhxxByUserId(yhb.getUserId());
    }

    /**
     * 分页查询
     */
    @Override
    public PageInfo<ViewYhxx> loadUserInfoPageList(Integer pageNum, Integer pageSize, ViewYhxx viewYhxx) {

        PageHelper.startPage(pageNum, pageSize);
        List<ViewYhxx> viewYhxxs = viewUserInfoMapper.loadUserInfoPageList(viewYhxx);
        return new PageInfo<ViewYhxx>(viewYhxxs);
    }

    /**
     * 获取个人信息
     */
    @Override
    @Cacheable(value="userCache", key="'#p0.getUserId()'+'#root.methodName'"  )
    public ViewYhxx getYhxx(Yhb yhb) {

        return viewUserInfoMapper.getViewYhxxByUserId(yhb.getUserId());
    }

    /**
     * 添加用户
     */
    @Override
    @CacheEvict(value="userCache", allEntries=true)
    public void saveUser(ViewYhxx viewYhxx) {

        String userInfoId = StringTools.getUUID();
        String userId = StringTools.getUUID();

        userMapper.insertUserInfoIfNot(new YhXxb(userInfoId, viewYhxx.getYhxxXm(), viewYhxx.getYhxxXb(), viewYhxx.getYhxxCsrq(),
                viewYhxx.getYhxxSjh(), viewYhxx.getYhxxDhhm(), viewYhxx.getYhxxYx(), viewYhxx.getYhxxSfzh(), null,
                viewYhxx.getUserMs(), null, viewYhxx.getXlId(), viewYhxx.getZzmmId(), viewYhxx.getJgId(),
                viewYhxx.getMzId(), viewYhxx.getDnzwId(), viewYhxx.getXzzwId(), viewYhxx.getBmId(),
                viewYhxx.getZbId(), viewYhxx.getYhxxMj()));

        Yhb yhb = new Yhb(userId, viewYhxx.getUserMc(), null, MD5Utils.getMD5Str("123456"), null, null,
                viewYhxx.getUserMs(), new Date(), viewYhxx.getUserZtId(), userInfoId);
        if (viewYhxx.getUserFlag() == null) {
            yhb.setUserFlag(0);
        }
        userMapper.insertUserIfNot(yhb);

        if (viewYhxx.getRoleIds() != null && viewYhxx.getRoleIds().length > 0) {
            for (Integer roleId : viewYhxx.getRoleIds()) {
                userMapper.addUserRole(new UserRole(roleId, userId));
            }
        }
    }

    /**
     * 删除用户
     */
    @Override
    @CacheEvict(value="userCache", allEntries=true)
    public void deleteUser(String[] userIds) {

        String userInfoId = null;
        for (String userId : userIds) {
            userInfoId = viewUserInfoMapper.getUserInfoIdByUserId(userId);
            userMapper.deleteUserById(userId);
            userMapper.deleteUserInfoById(userInfoId);
        }
    }

    /**
     * 批量保存用户
     */
    @Override
    @CacheEvict(value="userCache", allEntries=true)
    public void saveBatchUser(List<ViewYhxx> viewYhxxs) {

        String userInfoId = null;
        String userId = null;
        Yhb yhb = null;
        YhXxb yhXxb = null;
        ViewYhxx viewYhxx = null;
        Map<String, Integer> educationAllMap = educationService.getAll();
        Map<String, Integer> placeAllMap = jgService.getAll();
        Map<String, Integer> partyJobJobAllMap = partyJobService.getAll();
        Map<String, Integer> nationAllMap = nationService.getAll();
        Map<String, Integer> administrativeJobAllMap = administrativeJobService.getAll();
        Map<String, Integer> departmentAllMap = departmentService.getAll();
        Map<String, Integer> branchAllMap = branchService.getAll();
        Map<String, Integer> userStateAllMap = userStateService.getAll();
        Map<String, Integer> politicsStateAllMap = politicsStateService.getAll();

        List<Yhb> yhbs = new ArrayList<Yhb>();
        List<YhXxb> yhXxbs = new ArrayList<YhXxb>();
        Iterator<ViewYhxx> iterator = viewYhxxs.iterator();
        while (iterator.hasNext()) {
            viewYhxx = iterator.next();
            userInfoId = StringTools.getUUID();
            userId = StringTools.getUUID();

            yhb = new Yhb(userId, viewYhxx.getUserMc(), null, "123456", "", "",
                    "", new Date(), userStateAllMap.get(viewYhxx.getUserZtMc()), userInfoId);

            yhXxb = new YhXxb(userInfoId, viewYhxx.getYhxxXm(), viewYhxx.getYhxxXb(), viewYhxx.getYhxxCsrq(),
                    viewYhxx.getYhxxSjh(), viewYhxx.getYhxxDhhm(), viewYhxx.getYhxxYx(), viewYhxx.getYhxxSfzh(),
                    null, "", null,
                    educationAllMap.get(viewYhxx.getXlMc()), politicsStateAllMap.get(viewYhxx.getZzmmMc()),
                    placeAllMap.get(viewYhxx.getJgMc()), nationAllMap.get(viewYhxx.getMzMc()),
                    partyJobJobAllMap.get(viewYhxx.getDnzwMc()), administrativeJobAllMap.get(viewYhxx.getXzzwMc()),
                    departmentAllMap.get(viewYhxx.getBmMc()), branchAllMap.get(viewYhxx.getZbMc()),
                    viewYhxx.getYhxxMj());
            yhbs.add(yhb);
            yhXxbs.add(yhXxb);
        }

        userMapper.batchAddUserInfo(yhXxbs);
        userMapper.batchAddUser(yhbs);
    }

    /**
     * 获取所有用户信息
     */
    @Override
    @Cacheable(value="userCache", key="#root.methodName"  )
    public List<ViewYhxx> getUserAllList() {
        
        return viewUserInfoMapper.getListViewYhxx();
    }

    @Override
    @CacheEvict(value="userCache", allEntries=true)
    public void updateUser(ViewYhxx viewYhxx) {

        String userInfoId = viewUserInfoMapper.getUserInfoIdByUserId(viewYhxx.getUserId());

        YhXxb yhXxb = new YhXxb(userInfoId,
                viewYhxx.getYhxxXm(),
                viewYhxx.getYhxxXb(),
                viewYhxx.getYhxxCsrq(),
                viewYhxx.getYhxxSjh(),
                viewYhxx.getYhxxDhhm(),
                viewYhxx.getYhxxYx(),
                viewYhxx.getYhxxSfzh(),
                viewYhxx.getYhxxDhhm(),
                viewYhxx.getUserMs(),
                null,
                viewYhxx.getXlId(),
                viewYhxx.getZzmmId(),
                viewYhxx.getJgId(),
                viewYhxx.getMzId(),
                viewYhxx.getDnzwId(),
                viewYhxx.getXzzwId(),
                viewYhxx.getBmId(),
                viewYhxx.getZbId(),
                viewYhxx.getYhxxMj());

        Yhb yhb = new Yhb(viewYhxx.getUserId(), viewYhxx.getUserMc(), null, null, null, null,
                viewYhxx.getUserMs(), null, viewYhxx.getUserZtId(), userInfoId);

        userMapper.updateUser(yhb);
        userMapper.updateUserInfo(yhXxb);

    }

    @Override
    public boolean validateUserName(String userName) {

        ViewYhxx viewYhxx = viewUserInfoMapper.getViewYhxxByUserMc(userName);
        if (viewYhxx == null) {
            return true;
        }
        return false;
    }

    /**
     * 用户授权
     */
    @Override
    public void authorityUser(ViewYhxx viewYhxx) {

        System.err.println(viewYhxx.getRoleIds());
        for(Integer id : viewYhxx.getRoleIds()) {
            System.err.println(id);
        }
        //roleService.authorityUser(viewYhxx.getUserId(), viewYhxx.getRoleIds());
    }

    /**
     * 验证身份是否一致
     */
    @Override
    public boolean validateInformation(ViewYhxx viewYhxx) {
        String identity = viewUserInfoMapper.getIdentityByUserMc(viewYhxx.getUserMc());
        if (identity.equals(viewYhxx.getYhxxSfzh())) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 根据用户名修改密码
     */
    @Override
    public void setPasswordByUserMc(String userMc, String password) {
        password = MD5Utils.getMD5Str(password);
        userMapper.setPasswordByUserMc(userMc, password);
    }

    /**
     * 修改密码
     */
    @Override
    public boolean validatePassword(String oldPassword, String newPassword, Yhb yhb) {
        String password = userMapper.getPaawordByUserId(yhb.getUserId());
        if (password.equals(MD5Utils.getMD5Str(oldPassword))) {
            userMapper.updatePassword(MD5Utils.getMD5Str(newPassword), yhb.getUserId());
            return true;
        } else {
            return false;
        }
    }

    /**
     * 修改头像
     */
    @Override
    public void updatePortrait(String portrait, Yhb yhb) {
        userMapper.updatePortrait(portrait, yhb.getUserId());
    }

    @Override
    public Yhb getUserByuserName(String userMc) {
        
        return userMapper.getUserByuserName(userMc);
    }


}
