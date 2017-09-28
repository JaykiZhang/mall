package com.situ.mall.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.situ.mall.pojo.Product;

public interface ProductDao {

	int getProductCount();

	List<Product> productList(@Param("index")int index, @Param("pageSize")int pageSize);

	void addProduct(Product product);

	void delProductById(int id);

	void updateStatus(@Param("status")int status,@Param("id")int id);

	Product findById(int id);

}
