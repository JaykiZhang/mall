package com.situ.mall.controller;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.situ.mall.pojo.Category;
import com.situ.mall.pojo.Product;
import com.situ.mall.service.IProductService;
import com.situ.mall.vo.PageBean;

@Controller
@RequestMapping(value="/product")
public class StudentController {
	
	@Autowired
	private IProductService productService; 
	
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Date.class, new CustomDateEditor(
                new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"), true));
        binder.registerCustomEditor(Date.class, new CustomDateEditor(
                new SimpleDateFormat("yyyy-MM-dd"), true));
    }
	
	@RequestMapping("productList")
	public String productList(String pageIndex,Model model){
		int pageIndexs=1;
		if (pageIndex != null && !pageIndex.equals("")) {
			pageIndexs = Integer.parseInt(pageIndex);
		}
		PageBean pageBean = productService.productList(pageIndexs);
		
		model.addAttribute("pageBean", pageBean);
		return "product_list";
		
	}
	@RequestMapping("addProduct")
	public String addProduct(){
		
		return "product_add";		
	}
	@RequestMapping("addProduct1")
	public String addProduct1(Product product){
		productService.addProduct(product);
		
		return "redirect:/product/productList.action";
		
	}
	@RequestMapping("delProductById")
	public String delProductById(int id){
		productService.delProductById(id);
		return "redirect:/product/productList.action";
		
	}
	@RequestMapping("deleteAll")
	public String deleteAll(int[]selectid){
		
		for (int id : selectid) {
			productService.delProductById(id);
		}
		return "redirect:/product/productList.action";
		
	}
	@RequestMapping("updateStatus")
	public String updateStatus(int status,int id){
		productService.updateStatus(status,id);
		
		return "redirect:/product/productList.action";
		
	}
	@RequestMapping("findById")
	public String findById(int id,Model model){
		Product product = productService.findById(id);
		System.out.println("======================================"+product);
		model.addAttribute("product",product);		
		return "product_update";
	}
	@RequestMapping("updateProduct")
	public String updateProduct(){
		return "redirect:/product/productLsit.action";
	}
	@RequestMapping("selectOne")
	public @ResponseBody List<Category> selectProvinces(ModelAndView modelAndView){
		List<Category> list = productService.selectOne();
		for (Category category : list) {
			System.out.println(category);
		}
		modelAndView.addObject("one", list);
		
		return list;
	}
	@RequestMapping(value="/selectParentId")
	public @ResponseBody List<Category> selectTwo(Integer one){
		System.out.println(one);
		List<Category> list = productService.selectParentId(one);
		for (Category category : list) {
			System.out.println(category);
		}
		
		return list;
	}

	
}
