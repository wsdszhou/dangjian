package cn.zjw.service.impl;

import cn.zjw.mapper.OrderMapper;
import cn.zjw.pojo.Order;
import cn.zjw.pojo.OrderExample;
import cn.zjw.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    OrderMapper orderMapper;

    @Override
    public List<Order> list() {
        OrderExample orderExample = new OrderExample();
        List<Order> orders = orderMapper.selectByExample(orderExample);
        return orders;
    }

    @Override
    public Order get(Integer id) {
        Order order = orderMapper.selectByPrimaryKey(id);
        return order;
    }

    @Override
    public void update(Order order) {
        orderMapper.updateByPrimaryKey(order);
    }
}
