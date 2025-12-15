package com.mall.shop.dao;

import com.mall.shop.bean.PageBean;
import com.mall.shop.bean.Product;
import java.util.List;

public interface ProductDao {
	//商品分页列表
    List<Product> productList(PageBean pb);
	//商品列表
    List<Product> productAll();
    //统计总数
    long productReadCount();
    //商品删除
    boolean productDel(int productId);
    //商品批量删除
    boolean productBatDelById(String ids);
    //查找商品名称
    boolean findProductByName(String productName);
    Product findProductById(int id);
    //增加商品
    boolean productAdd(Product product);
    //修改商品
    boolean productUpdate(Product product);

    public List<Product>findAllfproduct(Integer product_fid);
    public List<Product>findAllcproduct(Integer product_cid);

}
