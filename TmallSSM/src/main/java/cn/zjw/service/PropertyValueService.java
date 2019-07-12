package cn.zjw.service;

import cn.zjw.pojo.PropertyValue;

import java.util.List;

public interface PropertyValueService {
    /**
     * 返回属性列表
     * @return
     */
    List<PropertyValue> list();


    /**
     * 通过id返回对应的数据
     * @param id
     * @return
     */
    PropertyValue get(Integer id);

    /**
     * 更新属性
     * @param propertyValue
     * @return
     */
    void update(PropertyValue propertyValue);

    /**
     * 删除属性
     * @param id
     * @return
     */
    void delete(Integer id);


    /**
     *增加属性
     * @param propertyValue
     * @return
     */
    void insert(PropertyValue propertyValue);
}
