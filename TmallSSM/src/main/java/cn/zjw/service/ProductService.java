package cn.zjw.service;

import cn.zjw.pojo.Product;

import java.util.List;

public interface ProductService {
    /**
     * 返回属性列表
     * @return
     */
    List<Product> list();


    /**
     * 通过id返回对应的数据
     * @param id
     * @return
     */
    Product get(Integer id);

    /**
     * 更新属性
     * @param product
     * @return
     */
    void update(Product product);

    /**
     * 删除属性
     * @param id
     * @return
     */
    void delete(Integer id);


    /**
     *增加属性
     * @param product
     * @return
     */
    void insert(Product product);
}
