package cn.zjw.service.impl;

import cn.zjw.mapper.ProductMapper;
import cn.zjw.pojo.Product;
import cn.zjw.pojo.ProductExample;
import cn.zjw.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {


    @Autowired
    ProductMapper productMapper;

    @Override
    public List<Product> list() {
        ProductExample ProductExample = new ProductExample();
        List<Product> properties = productMapper.selectByExample(ProductExample);
        return properties;

    }
    @Override
    public Product get(Integer id) {
        Product product = productMapper.selectByPrimaryKey(id);
        return product;
    }

    @Override
    public void update(Product product) {
        productMapper.updateByPrimaryKey(product);
    }

    @Override
    public void delete(Integer id) {
        productMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void insert(Product product) {
        productMapper.insert(product);
    }
}
