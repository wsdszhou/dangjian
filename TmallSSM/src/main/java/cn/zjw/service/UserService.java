package cn.zjw.service;

import cn.zjw.pojo.User;

import java.util.List;

public interface UserService {

    List<User> list();

    User get(Integer id);

    void update(User user);
}
