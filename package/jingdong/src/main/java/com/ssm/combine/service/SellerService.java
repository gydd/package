package com.ssm.combine.service;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssm.combine.DAO.OrderMapper;
import com.ssm.combine.DAO.ProductAdsMapper;
import com.ssm.combine.DAO.ProductDAO;
import com.ssm.combine.DAO.SellerDAO;
import com.ssm.combine.DAO.ShopDAO;
import com.ssm.combine.DAO.shopAdsMapper;
import com.ssm.combine.model.Order;
import com.ssm.combine.model.Product;
import com.ssm.combine.model.ProductAds;
import com.ssm.combine.model.Seller;
import com.ssm.combine.model.Shop;
import com.ssm.combine.model.shopAds;

@Service("sellerService")
public class SellerService {
	@Autowired
	private SellerDAO sellerDAO;
	@Autowired
	private	ShopDAO shopDAO;
	@Autowired
	private ProductDAO	productDAO;
	@Autowired
	private OrderMapper orderMapper;
	@Autowired
	private shopAdsMapper shopAdsMapper;
	@Autowired
	private ProductAdsMapper productAdsMapper;

	public Seller login(String id, String password) 
	{						
		Seller seller = sellerDAO.selectSellerName(id, password);
		return seller;
	}
	
	@Transactional
	public boolean register(Seller seller) {//register
		Seller hasSeller = sellerDAO.selectSeller(seller.getTelePhone());
		if(hasSeller==null)
		{
			Date date=new Date();
			Timestamp registerDate=new Timestamp(date.getTime());
			seller.setRegisterTime(registerDate);
			seller.setUpdateTime(registerDate);
			sellerDAO.insertIntoSeller(seller);
			return true;//success
		}
		return false;//failure
	}
	
	
	@Transactional
	public boolean modifyPassword(String telephone, String oldPassword,
			String newPassword) {// forget&modify password
		try {
			Seller seller = sellerDAO.selectSeller(telephone);
			if (seller.getPassword().equals(oldPassword)) {
				Date date = new Date();
				Timestamp updateDate = new Timestamp(date.getTime());
				sellerDAO.updateTime(telephone, updateDate);
				sellerDAO.updateSeller(telephone, newPassword);
				return true;
			} else
				return false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	@Transactional
	public boolean	applyShop(Shop shop)
	{
		Shop applyShop=shopDAO.selectShopsBySellerID(shop.getSellerID());
		if(applyShop==null)
		{
			Timestamp time=new Timestamp(System.currentTimeMillis());
			shop.setUpdateTime(time);
			shop.setRegisterTime(time);
			return shopDAO.insertIntoShop(shop)==1;
		}else if(applyShop.getApplyStatus()==-1)
		{
			shopDAO.deleteShop(applyShop.getId());
			Timestamp time=new Timestamp(System.currentTimeMillis());
			shop.setUpdateTime(time);
			shop.setRegisterTime(time);
			return shopDAO.insertIntoShop(shop)==1;
		}
		else
			return false;
	}
	public Shop getShop(String sellerID)
	{
		return shopDAO.selectShopsBySellerID(sellerID);
	}
	public boolean modifyShop(Shop shop)
	{
		return	shopDAO.updateShopDetails(shop)==1;
	}
	public boolean addProduct(Product product)
	{
		Shop shop=shopDAO.selectShopsBySellerID(product.getSellerID());
		if(shop==null)
			return false;
		
		if(shop.getApplyStatus()==0||shop.getApplyStatus()==-1)
			return false;
		Timestamp time=new Timestamp(System.currentTimeMillis());
		product.setUpdateTime(time);
		product.setRegisterTime(time);
		return productDAO.insertIntoProduct(product)==1;
	}
	public boolean deleteProduct(int id)
	{
		return productDAO.deleteProduct(id)>=1;
	}
	public boolean modifyProductPrice(int id,double price)
	{
		return productDAO.updatePrice(id, price)==1;
	}
	public boolean addProductTotal(int id,int number)
	{
		return productDAO.updateTotal(id, number)==1;
	}
	public List<Product> getProducts(String telePhone)
	{
		List<Product> products=productDAO.selectProductsBySellerID(telePhone);
		return products;
	}
	
	public boolean deleteOrder(int id) {
		return orderMapper.deleteByPrimaryKey(id)==1;
	}
	public boolean changeOrderToDelivered(int id)
	{
		Order order=new Order();
		order.setId(id);
		order.setStatus(2);
		return orderMapper.updateByPrimaryKeySelective(order)==1;
	}
	public List<Order> getOrders(String sellerID) {
		return orderMapper.selectBySellerID(sellerID);
	}
	public boolean applyShopAds(shopAds shopAds)
	{
		shopAds shopAds2=shopAdsMapper.selectSellerAds(shopAds.getShopID());
		if(shopAds2==null)
		{
			shopAds.setRegister_time(new Date());
			shopAds.setUpdate_time(new Date());
			shopAds.setStatus(0);
			return shopAdsMapper.insertSelective(shopAds)==1;
		}
		else
			return false;
	}
	public shopAds getShopAds(int shopID)
	{
		return shopAdsMapper.selectSellerAds(shopID);
	}
	public boolean payForShopAds(int adsID)
	{
		return shopAdsMapper.updateStatus(adsID, 2, new Date())==1;
	}
	public boolean applyProductAds(ProductAds productAds)
	{
		productAds .setUpdate_time(new Date());
		productAds.setRegister_time(new Date());
		productAds.setStatus(0);
		return productAdsMapper.insertSelective(productAds)==1;
	}
	public List<ProductAds> getProductAds(String sellerID)
	{
		return productAdsMapper.selectBysellerID(sellerID);
	}
	public boolean payForProductAds(int adsID)
	{
		ProductAds productAds=new ProductAds();
		productAds.setId(adsID);
		productAds.setStatus(2);
		return productAdsMapper.updateByPrimaryKeySelective(productAds)==1;
	}
}
