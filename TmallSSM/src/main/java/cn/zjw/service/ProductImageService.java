package cn.zjw.service;

import cn.zjw.pojo.ProductImage;

import java.util.List;

public interface ProductImageService {

    List<ProductImage> list();

    void insert(ProductImage productImage);

    void update(ProductImage productImage);

    void delete(Integer id);


}
