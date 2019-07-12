package cn.zjw.service;

import cn.zjw.pojo.Property;

import java.util.List;

public interface PropertyService {
    /**
     * 返回属性列表
     * @return
     */
    List<Property> list();


    /**
     * 通过id返回对应的数据
     * @param id
     * @return
     */
    Property get(Integer id);

    /**
     * 更新属性
     * @param property
     * @return
     */
    void update(Property property);

    /**
     * 删除属性
     * @param id
     * @return
     */
    void delete(Integer id);


    /**
     *增加属性
     * @param property
     * @return
     */
    void insert(Property property);
}
