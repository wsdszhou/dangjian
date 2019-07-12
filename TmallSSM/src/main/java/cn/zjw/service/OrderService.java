package cn.zjw.service;


import cn.zjw.pojo.Order;

import java.util.List;

public interface OrderService {

    List<Order> list();

    Order get(Integer id);

    void update(Order order);


}
