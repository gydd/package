package com.ssm.combine.DAO;

import java.util.List;

import com.ssm.combine.model.Product;

public interface ProductDAO {
	public int insertIntoProduct(Product product);
	public int deleteProduct(int id);
	public int updateTotal(int id,int addNumber);
	public int updateSelled(int id,int selledNumber);
	public int updatePrice(int id,double price);
	public List<Product> selectAllProducts();
	public List<Product> selectProductsByClassID(int classID);
	public List<Product> selectProductsBySellerID(String sellerID);
	public List<Product> selectProductByName(String name);
	public List<Product> selectProductOrderByPrice(String name);
	public List<Product> selectProductOrderBySold(String name);
	public Product selectById(int id);
	public List<Product> selectNotInAds(String sellerID);
}
