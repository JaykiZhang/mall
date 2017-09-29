package com.situ.mall.service;

import java.util.List;

import com.situ.mall.pojo.Category;
import com.situ.mall.pojo.Product;
import com.situ.mall.vo.PageBean;

public interface IProductService {

	PageBean productList(Integer pageIndexs);

	void addProduct(Product product);

	void delProductById(int id);

	void updateStatus(int status, int id);

	Product findById(int id);

	List<Category> selectOne();

	List<Category> selectParentId(Integer one);

	void updateProduct(Product product);

	

}
