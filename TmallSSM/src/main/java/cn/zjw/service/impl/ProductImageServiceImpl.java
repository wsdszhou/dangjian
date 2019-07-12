package cn.zjw.service.impl;

import cn.zjw.mapper.ProductImageMapper;
import cn.zjw.pojo.ProductImage;
import cn.zjw.pojo.ProductImageExample;
import cn.zjw.service.ProductImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductImageServiceImpl implements ProductImageService {


    @Autowired
    ProductImageMapper productImageMapper;

    @Override
    public List<ProductImage> list() {
        ProductImageExample productImageExample = new ProductImageExample();
        List<ProductImage> productImages = productImageMapper.selectByExample(productImageExample);
        return productImages;
    }

    @Override
    public void insert(ProductImage productImage) {
        productImageMapper.insert(productImage);
    }

    @Override
    public void update(ProductImage productImage) {
        productImageMapper.updateByPrimaryKey(productImage);
    }

    @Override
    public void delete(Integer id) {
        productImageMapper.deleteByPrimaryKey(id);
    }
}
