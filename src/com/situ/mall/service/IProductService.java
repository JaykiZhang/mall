package com.situ.mall.service;

import com.situ.mall.pojo.Product;
import com.situ.mall.vo.PageBean;

public interface IProductService {

	PageBean productList(Integer pageIndexs);

	void addProduct(Product product);

	void delProductById(int id);

	void updateStatus(int status, int id);

	Product findById(int id);

	

}
