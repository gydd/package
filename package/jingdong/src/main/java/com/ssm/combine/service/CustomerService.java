package com.ssm.combine.service;

import com.ssm.combine.DAO.*;
import com.ssm.combine.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service("customerService")
public class CustomerService {
	@Autowired
	private CustomerDAO customerDAO;
	@Autowired
	private AddressDAO addressDAO;
	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private ShopDAO shopDAO;
	@Autowired
	private FavoriteMapper favoriteMapper;
	@Autowired
	private CartMapper cartDAO;
	@Autowired
	private OrderMapper	orderMapper;
	@Autowired
	private tradeRateMapper tradeRateDAO;
	
	@Transactional
	public Customer login(String id, String password) 
	{						
		Customer customer = customerDAO.selectCustomerName(id, password);
		return customer;
	}
	
	@Transactional
	public boolean register(Customer customer) {//register
		Customer hasCustomer = customerDAO.selectCustomer(customer.getTelephone());
		if(hasCustomer==null)
		{
			Date date=new Date();
			Timestamp registerDate=new Timestamp(date.getTime());
			
			customer.setRegisterTime(registerDate);
			customer.setUpdateTime(registerDate);
			customerDAO.insertIntoCustomer(customer);
			return true;//success
		}
		return false;//failure
	}
	
	
	@Transactional
	public boolean modifyPassword(String telephone, String oldPassword,
			String newPassword) {// forget&modify password
		try {
			Customer customer = customerDAO.selectCustomer(telephone);
			if (customer.getPassword().equals(oldPassword)) {
				Date date = new Date();
				Timestamp updateDate = new Timestamp(date.getTime());
				customerDAO.updateTime(telephone, updateDate);

				customerDAO.updateCustomer(telephone, newPassword);
				return true;
			} else
				return false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean modifyInformation(Customer customer) {
		return customerDAO.updateCustomerInfo(customer.getTelephone(), customer.getName(), customer.getAddress(), customer.getE_mail())==1;
	}
	
	public boolean addAddress(Address address) {
		List<Address> addresses=addressDAO.selectAddress(address.getCustomerId());
		int size=addresses.size();
		if(size<5)
			return addressDAO.insertIntoAddress(address)==1;
		else
			return false;
	}
	public boolean deleteAddress(int id) {
		return addressDAO.deleteAddress(id)==1;
	}
	public boolean updateAddress(Address address) {
		return addressDAO.updateAddress(address)==1;
	}
	public List<Address> getAddress(String telePhone) {
		return addressDAO.selectAddress(telePhone);
	}
	@Transactional
	public boolean updateDefaultAddresss(int id,String telePhone)
	{
		int count=addressDAO.updateToDefaultAddress(id);
		if(count==1)
			return addressDAO.updatefromDefaultAddress(id, telePhone)>=1;
		else
			return false;
	}
	@Transactional
	public Address getDefaultAddresss(String telePhone) {
		Address defaultAddress=addressDAO.selectDefaultAddress(telePhone);
		return defaultAddress;
	}
	public boolean setFavorite(String customerID,int favID,int type)
	{
		if(favoriteMapper.isExist(favID, type, customerID)==null)
		{
			Favorite favorite=new Favorite();
			favorite.setFavID(favID);
			favorite.setType(type);
			favorite.setCustomerID(customerID);
			return favoriteMapper.insertSelective(favorite)==1;
		}
		else
			return false;
	}
	public boolean deleteFavorite(String customerID,int favID,int type)
	{
		return favoriteMapper.deleteByFavID(favID, type,customerID)==1;
	}

	@Transactional
	public List<Product> getFavoriteProducts(String customerID) {
		List<Favorite> favorites = favoriteMapper.selectProductFav(customerID);

		List<Product> products = new ArrayList<>();
		for (Favorite favorite : favorites) {
			Product product = productDAO.selectById(favorite.getFavID());
			products.add(product);
		}
		return products;
	}
	@Transactional
	public List<Shop> getFavoriteShops(String customerID) {
		List<Favorite> favorites = favoriteMapper.selectShopFav(customerID);
		List<Shop> shops = new ArrayList<>();
		for (Favorite favorite : favorites) {
			Shop shop = shopDAO.selectShopsByShopID(favorite.getFavID());
			shops.add(shop);
		}
		return shops;
	}

	@Transactional
	public boolean addCart(Cart cart) {
		if (cartDAO.isExist(cart.getProductID(), cart.getCustomerID()) == null) {
			cartDAO.insertSelective(cart);
			return true;
		} else
			return false;
	}
	public boolean deleteCart(int id)
	{
		return cartDAO.deleteByPrimaryKey(id)==1;
	}

	public List<Cart> getCart(String customerID)
	{
		List<Cart> carts=cartDAO.selectBycustomerID(customerID);
		return carts;
	}
	public boolean createOrder(Order order)
	{
		try {
			order.setStatus(0);
			orderMapper.insertSelective(order);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	public boolean deleteOrder(int id) {
		return orderMapper.deleteByPrimaryKey(id)==1;
	}
	public boolean changeOrderToReceive(int id)
	{
		Order order=new Order();
		order.setId(id);
		order.setStatus(3);
		return orderMapper.updateByPrimaryKeySelective(order)==1;
	}
	@Transactional
	public boolean payOrder(int id)
	{
		Order order=orderMapper.selectByPrimaryKey(id);
		Product product=productDAO.selectById(order.getProductID());
		order.setStatus(1);
		double totalPrice=order.getTotalPrice();
		double adminPrice=totalPrice*tradeRateDAO.selectRate()/100;
		order.setAdminPrice(adminPrice);
		
		if(product.getTotal()>=order.getProductCount())
		{
			
			
			productDAO.updateSelled(order.getProductID(), order.getProductCount());
			return orderMapper.updateByPrimaryKeySelective(order)==1;
		}else
			return false;
	}
	@Transactional
	public boolean payOrder2(int id,int amount)
	{
		Order order=orderMapper.selectByPrimaryKey(id);
		Product product=productDAO.selectById(order.getProductID());
		
		if(product.getTotal()>=order.getProductCount())
		{
			order.setTotalPrice(order.getTotalPrice()*amount/order.getProductCount());
			order.setProductCount(amount);
			return orderMapper.updateByPrimaryKeySelective(order)==1;
		}else
			return false;
	}
	public List<Order> getUnpaidOrders(String customerID) {
		return orderMapper.selectUnpaidByCustomerID(customerID);
	}
	public List<Order> getPaidOrders(String customerID) {
		return orderMapper.selectPaidByCustomerID(customerID);
	}
}
