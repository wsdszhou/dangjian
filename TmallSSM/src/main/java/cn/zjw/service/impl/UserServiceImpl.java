package cn.zjw.service.impl;

import cn.zjw.mapper.UserMapper;
import cn.zjw.pojo.User;
import cn.zjw.pojo.UserExample;
import cn.zjw.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserMapper userMapper;

    @Override
    public List<User> list() {
        UserExample userExample = new UserExample();
        List<User> users = userMapper.selectByExample(userExample);
        return users;
    }

    @Override
    public User get(Integer id) {
        User user = userMapper.selectByPrimaryKey(id);
        return user;
    }

    @Override
    public void update(User user) {
        userMapper.updateByPrimaryKey(user);
    }
}
