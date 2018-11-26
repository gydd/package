package com.ssm.combine.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ssm.combine.model.Product;
import com.ssm.combine.service.ProductService;

@Controller
@RequestMapping("pro")
public class ProductController {
	@Autowired
	private ProductService productService; 
	
	@RequestMapping("/searchProduct.do")
	public ModelAndView searchProduct(String keyWord) {
		ModelAndView mv=new ModelAndView();
		List<Product> products=productService.searchProduct(keyWord);
		mv.addObject("searchProducts",products );
		return mv;
	}
	@RequestMapping("/getProducts.do")
	public ModelAndView searchProduct() {
		ModelAndView mv=new ModelAndView();
		List<Product> products=productService.getProducts();
		mv.addObject("allProducts",products );
		return mv;
	}
	@RequestMapping("/getProductByClassID.do")
	public ModelAndView searchProduct(int classID) {
		ModelAndView mv=new ModelAndView();
		List<Product> products=productService.getProductByClassID(classID);
		mv.addObject("classIDProducts",products );
		return mv;
	}
}
