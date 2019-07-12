package cn.zjw.service.impl;

import cn.zjw.mapper.PropertyMapper;
import cn.zjw.pojo.Property;
import cn.zjw.pojo.PropertyExample;
import cn.zjw.service.PropertyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PropertyServiceImpl implements PropertyService {


    @Autowired
    PropertyMapper propertyMapper;

    @Override
    public List<Property> list() {
        PropertyExample propertyExample = new PropertyExample();
        List<Property> properties = propertyMapper.selectByExample(propertyExample);
        return properties;

    }
    @Override
    public Property get(Integer id) {
        Property property = propertyMapper.selectByPrimaryKey(id);
        return property;
    }

    @Override
    public void update(Property property) {
        propertyMapper.updateByPrimaryKey(property);
    }

    @Override
    public void delete(Integer id) {
        propertyMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void insert(Property property) {
        propertyMapper.insert(property);
    }
}
