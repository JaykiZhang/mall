package com.situ.mall.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.mall.dao.ProductDao;
import com.situ.mall.pojo.Product;
import com.situ.mall.service.IProductService;
import com.situ.mall.vo.PageBean;


@Service
public class ProductServiceImpl implements IProductService {
	@Autowired
	private ProductDao productDao;

	@Override
	public PageBean productList(Integer pageIndexs) {
		PageBean pageBean = new PageBean();
		pageBean.setPageIndex(pageIndexs);
		int pageSize = 3;
		pageBean.setPageSize(pageSize);
		int totalCount = productDao.getProductCount();
		pageBean.setTotalCount(totalCount);
		int totalPage = (int) Math.ceil(1.0*totalCount/pageSize);
		pageBean.setTotalPage(totalPage);
		
		int index = (pageIndexs-1)*pageSize;
		List<Product>list = productDao.productList(index,pageSize);
		pageBean.setList(list);
		
		return pageBean;
	}

	@Override
	public void addProduct(Product product) {
		productDao.addProduct(product);
	}

	@Override
	public void delProductById(int id) {
		productDao.delProductById(id);
	}

	@Override
	public void updateStatus(int status, int id) {
		productDao.updateStatus(status,id);
	}

	@Override
	public Product findById(int id) {
		Product product = productDao.findById(id);
		return product;
	}
}
