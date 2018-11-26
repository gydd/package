package com.ssm.combine.service;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssm.combine.DAO.ProductDAO;
import com.ssm.combine.model.Product;

@Service("productService")
public class ProductService {
	@Autowired
	private ProductDAO	productDAO;
	
	public List<Product> getProducts() {
		List<Product> products=productDAO.selectAllProducts();
		return products;
	}
	
	public List<Product> getProductByClassID(int classID) {
		List<Product> products=productDAO.selectProductsByClassID(classID);
		return products;
	}
	
	public List<Product> getProductBySellerID(String sellerID) {
		List<Product> products=productDAO.selectProductsBySellerID(sellerID);
		return products;
	}
	
	public byte[] getProductPicture(int id) {
		Product product=productDAO.selectById(id);
		return product.getPicture();
	}
	
	@Transactional
	public List<Product> searchProduct(String keyword) {
		String keyWord="%"+keyword+"%";
		List<Product> products=productDAO.selectProductByName(keyWord);
		return products;
	}
	@Transactional
	public List<Product> searchProductOrderByPrice(String keyword) {
		String keyWord="%"+keyword+"%";
		List<Product> products=productDAO.selectProductOrderByPrice(keyWord);
		return products;
	}
	@Transactional
	public List<Product> searchProductOrderBySold(String keyword) {
		String keyWord="%"+keyword+"%";
		List<Product> products=productDAO.selectProductOrderBySold(keyWord);
		return products;
	}
	public Product getProduct(int id) {
		return productDAO.selectById(id);
	}
	public boolean addProductTotal(int id,int number) {
		int count=productDAO.updateTotal(id, number);
		if(count==1)
			return true;
		else
			return false;
	}
	
	public boolean sellerProduct(int id,int number) {
		int count=productDAO.updateSelled(id, number);
		if(count==1)
			return true;
		else
			return false;
	}
	
	public boolean deleteProduct(int id) {
		return productDAO.deleteProduct(id)==1;
	}
	
	@Transactional
	public boolean addProduct(Product product) {
		Timestamp date=new Timestamp(System.currentTimeMillis());
		product.setRegisterTime(date);
		product.setUpdateTime(date);
		return productDAO.insertIntoProduct(product)==1;
	}
}
