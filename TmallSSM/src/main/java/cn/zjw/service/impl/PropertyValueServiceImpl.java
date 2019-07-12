package cn.zjw.service.impl;

import cn.zjw.mapper.PropertyValueMapper;
import cn.zjw.pojo.PropertyValue;
import cn.zjw.pojo.PropertyValueExample;
import cn.zjw.service.PropertyValueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PropertyValueServiceImpl implements PropertyValueService {


    @Autowired
    PropertyValueMapper propertyValueMapper;

    @Override
    public List<PropertyValue> list() {
        PropertyValueExample propertyValueExample = new PropertyValueExample();
        List<PropertyValue> properties = propertyValueMapper.selectByExample(propertyValueExample);
        return properties;

    }
    @Override
    public PropertyValue get(Integer id) {
        PropertyValue propertyValue = propertyValueMapper.selectByPrimaryKey(id);
        return propertyValue;
    }

    @Override
    public void update(PropertyValue propertyValue) {
        propertyValueMapper.updateByPrimaryKey(propertyValue);
    }

    @Override
    public void delete(Integer id) {
        propertyValueMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void insert(PropertyValue propertyValue) {
        propertyValueMapper.insert(propertyValue);
    }
}
