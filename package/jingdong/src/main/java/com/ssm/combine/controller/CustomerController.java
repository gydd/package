package com.ssm.combine.controller;

import com.ssm.combine.DAO.CartMapper;
import com.ssm.combine.DAO.CustomerDAO;
import com.ssm.combine.DAO.FavoriteMapper;
import com.ssm.combine.DAO.ShopDAO;
import com.ssm.combine.model.*;
import com.ssm.combine.service.CustomerService;
import com.ssm.combine.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class CustomerController {
	@Autowired
	private CustomerService customerService;
	@Autowired
	private CustomerDAO customerDAO;
	@Autowired
	private ProductService productService;
	@Autowired
	private ShopDAO shopDAO;
	@Autowired
	private CartMapper cartDAO;
	@Autowired
	private FavoriteMapper favoriteDAO;

	@RequestMapping("cus_login.do")
	public ModelAndView login(HttpSession session, Customer customer) {
		ModelAndView mv = new ModelAndView();
		Customer loginCustomer = customerService.login(customer.getTelephone(),
				customer.getPassword());
		if (loginCustomer == null) {
			mv.addObject("msg",
					"Login failed user does not exist or password error!");
			mv.setViewName("login");
		} else if (loginCustomer.getIsBlack() == 1) {
			mv.addObject("msg", "Login failed user on black list!");
			mv.setViewName("login");
		} else {
			session.removeAttribute("cusInfo");
			session.removeAttribute("addresses");
			session.removeAttribute("carts");
			session.removeAttribute("shopFavs");
			session.removeAttribute("productFavs");
			session.removeAttribute("cusUnpaidOrders");
			session.removeAttribute("cusPaidOrders");
			Date date = new Date();
			Timestamp updateDate = new Timestamp(date.getTime());
			customerDAO.updateTime(customer.getTelephone(), updateDate);
			mv.setViewName("user");
			List<Address> addresses = customerService.getAddress(customer
					.getTelephone());
			List<Cart> carts = customerService.getCart(customer.getTelephone());
			List<Shop> shopFavs = customerService.getFavoriteShops(customer
					.getTelephone());
			List<Product> productFavs = customerService
					.getFavoriteProducts(customer.getTelephone());
			List<Order> unpaidOrder = customerService.getUnpaidOrders(customer
					.getTelephone());
			List<Order> paidOrder = customerService.getPaidOrders(customer
					.getTelephone());
			session.setAttribute("cusInfo", loginCustomer);
			session.setAttribute("addresses", addresses);
			session.setAttribute("carts", carts);
			session.setAttribute("shopFavs", shopFavs);
			session.setAttribute("productFavs", productFavs);
			session.setAttribute("cusUnpaidOrders", unpaidOrder);
			session.setAttribute("cusPaidOrders", paidOrder);
		}
		return mv;
	}

	@RequestMapping("cus_logOut.do")
	public String logOut(HttpSession session) {
		session.removeAttribute("cusInfo");
		session.removeAttribute("addresses");
		session.removeAttribute("carts");
		session.removeAttribute("shopFavs");
		session.removeAttribute("productFavs");
		session.removeAttribute("cusUnpaidOrders");
		session.removeAttribute("cusPaidOrders");
		return "index";
	}

	@RequestMapping("cus_register.do")
	public ModelAndView register(Customer customer, HttpSession session,
			String telCode) {
		ModelAndView mv = new ModelAndView();

		if (customer.getTelephone().length() != 11) {
			mv.addObject("msg", "Phone number error!");
			mv.setViewName("login");
			return mv;
		}
		if (!session.getAttribute("telCode").equals(telCode)) {
			mv.addObject("msg", "Verification code error!");
			mv.setViewName("login");
			return mv;
		}

		if (customerService.register(customer)) {
			session.removeAttribute("cusInfo");
			session.removeAttribute("addresses");
			session.removeAttribute("carts");
			session.removeAttribute("shopFavs");
			session.removeAttribute("productFavs");
			mv.setViewName("user");
			session.setAttribute("cusInfo", customer);
		} else {
			mv.addObject("msg", "Phone number has been registered!");
			mv.setViewName("login");
		}
		return mv;
	}

	@RequestMapping("cus_modifyPassword.do")
	public String modifyPassword(String telephone, String oldPassword,
			String newPassword, ModelMap map) {
		if (oldPassword.equals(newPassword)) {
			map.addAttribute("msg",
					"The new password is the same as the old one!");
			return "user";
		}

		if (customerService.modifyPassword(telephone, oldPassword, newPassword))
			map.addAttribute("msg", "Password modification success!");
		else
			map.addAttribute("msg", "Old Password was wrong！");
		return "user";
	}

	@RequestMapping("cus_modifyInformation.do")
	public String modifyInformation(Customer customer, HttpSession session,
			ModelMap map) {
		if (customerService.modifyInformation(customer)) {
			Customer modifyCustomer = customerDAO.selectCustomer(customer
					.getTelephone());
			session.removeAttribute("cusInfo");
			session.setAttribute("cusInfo", modifyCustomer);
			map.addAttribute("msg", "Information modification success!");
		} else
			map.addAttribute("msg", "Information modification failure!");
		return "user";
	}

	@RequestMapping("cus_addAddress.do")
	public String addAddress(Address address, HttpSession session, ModelMap map) {
		if (customerService.addAddress(address)) {
			session.removeAttribute("addresses");
			map.addAttribute("msg", "Add Address success!");
			List<Address> addresses = customerService.getAddress(address
					.getCustomerId());
			session.setAttribute("addresses", addresses);
		} else
			map.addAttribute("msg", "Up to five addresses");
		return "user";
	}

	@RequestMapping("cus_deleteAddress.do")
	//id为地址id
	public String deleteAddress(int id, String customerID, HttpSession session,
			ModelMap map) {
		if (customerService.deleteAddress(id)) {
			session.removeAttribute("addresses");
			map.addAttribute("msg", "Delete Address success!");
			List<Address> addresses = customerService.getAddress(customerID);
			session.setAttribute("addresses", addresses);
		} else
			map.addAttribute("msg", "Delete Address failure!");
		return "user";
	}

	@RequestMapping("cus_updateAddress.do")
	public String updateAddress(Address address) {
		if (customerService.updateAddress(address))
			return "success";
		else
			return "failure";
	}

	@RequestMapping("cus_getAddresss.do")
	public ModelAndView getAddresss(String telePhone) {
		ModelAndView mv = new ModelAndView();

		List<Address> addresses = customerService.getAddress(telePhone);
		mv.addObject("addressList", addresses);
		return mv;
	}

	@RequestMapping("cus_setDefaultAddress.do")
	public String setDefaultAddress(int addresssId, String customerId) {
		if (customerService.updateDefaultAddresss(addresssId, customerId))
			return "user";
		else
			return "user";
	}

	@RequestMapping("cus_getDefaultAddress.do")
	public ModelAndView getDefaultAddress(String telePhone) {
		ModelAndView mv = new ModelAndView();

		Address address = customerService.getDefaultAddresss(telePhone);
		mv.addObject("defaultAddress", address);
		return mv;
	}

	@RequestMapping("cus_searchProduct.do")
	public ModelAndView searchAllProductByKeyWord(String keyWord) {
		ModelAndView mv = new ModelAndView();

		if (keyWord.equals("") || keyWord == null)
			keyWord = "";
		List<Product> products = new ArrayList<Product>();
		products = productService.searchProduct(keyWord);
		mv.addObject("keyword", keyWord);
		mv.addObject("products", products);
		mv.setViewName("index");
		return mv;
	}

	@RequestMapping("cus_searchByPrice.do")
	public ModelAndView searchAllProductOrderByPrice(String keyWord) {
		ModelAndView mv = new ModelAndView();

		if (keyWord.equals("") || keyWord == null)
			keyWord = "";
		List<Product> products = new ArrayList<Product>();
		products = productService.searchProductOrderByPrice(keyWord);
		mv.addObject("keyword", keyWord);
		mv.addObject("products", products);
		mv.setViewName("index");
		return mv;
	}

	@RequestMapping("cus_searchBySold.do")
	public ModelAndView searchAllProductOrderBySold(String keyWord) {
		ModelAndView mv = new ModelAndView();

		if (keyWord.equals("") || keyWord == null)
			keyWord = "";
		List<Product> products = new ArrayList<Product>();
		products = productService.searchProductOrderBySold(keyWord);
		mv.addObject("keyword", keyWord);
		mv.addObject("products", products);
		mv.setViewName("index");
		return mv;
	}

	@RequestMapping("cus_searchProductByClassID.do")
	public ModelAndView searchProductByClassID(int classID) {
		ModelAndView mv = new ModelAndView();

		List<Product> products = productService.getProductByClassID(classID);
		mv.addObject("products", products);
		mv.setViewName("index");
		return mv;
	}

	@RequestMapping(value = "cus_getProductPicture.do", method = RequestMethod.GET)
	public void getProductPicture(int id, final HttpServletResponse response)
			throws IOException {
		byte[] data = productService.getProductPicture(id);
		response.setContentType("image/jpg");
		response.setCharacterEncoding("UTF-8");

		OutputStream outputSream = response.getOutputStream();
		InputStream in = new ByteArrayInputStream(data);
		int len = 0;
		byte[] buf = new byte[1024];
		while ((len = in.read(buf, 0, 1024)) != -1) {
			outputSream.write(buf, 0, len);
		}
		outputSream.close();
	}

	@RequestMapping("cus_getProduct.do")
	public ModelAndView getProduct(int id) {
		ModelAndView mv = new ModelAndView();
		Product product = productService.getProduct(id);
		mv.setViewName("product");
		mv.addObject("product", product);
		return mv;
	}

	@RequestMapping("cus_goShop.do")
	public ModelAndView goShop(String sellerID) {
		ModelAndView mv = new ModelAndView();
		Shop shop = shopDAO.selectShopsBySellerID(sellerID);
		List<Product> products = productService.getProductBySellerID(sellerID);
		mv.setViewName("shop");
		mv.addObject("shop", shop);
		mv.addObject("products", products);
		return mv;
	}

	@RequestMapping("cus_favoriteProducts.do")
	public ModelAndView getMyfavoriteProducts(String customerID) {
		ModelAndView mv = new ModelAndView();

		List<Product> products = customerService
				.getFavoriteProducts(customerID);
		mv.addObject("favoriteProducts", products);
		return mv;
	}

	@RequestMapping("cus_favoriteShops.do")
	public ModelAndView getMyfavoriteShops(String customerID) {
		ModelAndView mv = new ModelAndView();

		List<Shop> shops = customerService.getFavoriteShops(customerID);
		mv.addObject("favoriteShops", shops);
		return mv;
	}

	@RequestMapping("cus_addFavorite.do")
	public String addFavorite(HttpServletRequest req, String customerID,
			int favID, int type, ModelMap map) {
		HttpSession session = req.getSession();
		if (session.getAttribute("cusInfo") == null)
			return "login";

		if (customerService.setFavorite(customerID, favID, type))
			map.addAttribute("msg", "Add success!");
		else {
			if (type == 0)
				map.addAttribute("msg", "You have a collection of the pruduct!");
			else
				map.addAttribute("msg", "You have a collection of the shop!");
		}
		if (type == 0) {
			Product product = productService.getProduct(favID);
			map.addAttribute("product", product);
			return "product";
		} else {
			Shop shop = shopDAO.selectShopsByShopID(favID);
			map.addAttribute("shop", shop);
			return "shop";
		}

	}

	@RequestMapping("cus_removeFavorite.do")
	public String removeFavorite(String customerID, int favID, int type,
			ModelMap map) {
		if (customerService.deleteFavorite(customerID, favID, type))
			map.addAttribute("msg", "removeFavorite success!");
		else
			map.addAttribute("msg", "removeFavorite failure!");
		return "user";
	}

	@RequestMapping("cus_getCart.do")
	public ModelAndView getCart(String customerID) {
		ModelAndView mv = new ModelAndView();
		List<Cart> carts = customerService.getCart(customerID);
		mv.setViewName("user");
		mv.addObject("shopcart", carts);
		return mv;
	}

	@RequestMapping("cus_deleteCart.do")
	public String deleteCart(int id, ModelMap map) {
		if (customerService.deleteCart(id))
			map.addAttribute("msg", "delete shopCart success!");
		else
			map.addAttribute("msg", "delete shopCart failed!");
		return "user";
	}

	@RequestMapping("cus_addCart.do")
	public String addCart(HttpServletRequest req, Cart cart, ModelMap map) {
		HttpSession session = req.getSession();
		if (session.getAttribute("cusInfo") == null)
			return "login";

		Product product = productService.getProduct(cart.getProductID());
		if (productService.getProduct(cart.getProductID()).getTotal() == 0) {
			map.addAttribute("msg", "Stock is zero!");
			map.addAttribute("product", product);
			return "product";
		}

		if (customerService.addCart(cart))
			map.addAttribute("msg", "add shopCart success!");
		else
			map.addAttribute("msg",
					"The Product has been added to the shopping cart!");

		map.addAttribute("product", product);
		return "product";
	}

	@RequestMapping("cus_createOrder.do")
	public ModelAndView createOrder(HttpServletRequest req, Integer amount,
			Integer createType, Order order) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = req.getSession();
		if (session.getAttribute("cusInfo") == null) {
			mv.setViewName("login");
			return mv;
		}

		Product product = productService.getProduct(order.getProductID());
		if (product.getTotal() == 0) {
			mv.setViewName("product");
			mv.addObject("msg", "Stock is zero!");
			mv.addObject("product", product);
			return mv;
		}
		Address address = customerService.getDefaultAddresss(order
				.getCustomerID());
		order.setProductCount(amount);
		order.setTotalPrice(amount * product.getPrice());
		order.setAddressID(address.getId());
		order.setSellerID(product.getSellerID());
		if (customerService.createOrder(order)) {
			if (createType == 1)
				cartDAO.deleteByCart(order.getCustomerID(),
						order.getProductID());
			mv.setViewName("user");
			mv.addObject("msg", "Create order success,Check your Order to pay!");
			return mv;
		} else {
			mv.setViewName("product");
			mv.addObject("msg",
					"Order creation failed,Please modify your Order!");
			mv.addObject("product", product);
			return mv;
		}
	}

	@RequestMapping("cus_deleteOrder.do")
	public String deleteOrder(int id, ModelMap map) {
		if (customerService.deleteOrder(id))
			map.addAttribute("msg", "Order has been deleted!");
		else
			map.addAttribute("msg", "Order deletion failed!");
		return "user";
	}

	@RequestMapping("cus_modifyOrderAmount.do")
	public String modifyOrderAmount(int id, Integer number, ModelMap map,HttpSession session) {
		if (customerService.payOrder2(id, number))
		{
			List<Order> unpaidOrder = customerService.getUnpaidOrders(((Customer)session.getAttribute("cusInfo")).getTelephone());
			List<Order> paidOrder = customerService.getPaidOrders(((Customer)session.getAttribute("cusInfo")).getTelephone());
			session.removeAttribute("cusUnpaidOrders");
			session.removeAttribute("cusPaidOrders");
			session.setAttribute("cusUnpaidOrders", unpaidOrder);
			session.setAttribute("cusPaidOrders", paidOrder);
			return "user";
		}
		else {
			map.addAttribute("msg", "low stocks!");
			return "user";
		}
	}

	@RequestMapping("cus_payOrder.do")
	public String payOrder(int id, ModelMap map,HttpSession session) {
		if (customerService.payOrder(id))
		{
			map.addAttribute("msg",
					"Pay success,Wait for the seller to delivery!");
			List<Order> unpaidOrder = customerService.getUnpaidOrders(((Customer)session.getAttribute("cusInfo")).getTelephone());
			List<Order> paidOrder = customerService.getPaidOrders(((Customer)session.getAttribute("cusInfo")).getTelephone());
			session.removeAttribute("cusUnpaidOrders");
			session.removeAttribute("cusPaidOrders");
			session.setAttribute("cusUnpaidOrders", unpaidOrder);
			session.setAttribute("cusPaidOrders", paidOrder);
		}
			
		else
			map.addAttribute("msg", "low stocks!Delete and create order again!");
		return "user";
	}

	@RequestMapping("cus_changeOrderReceived.do")
	public String updateOrder(int id, ModelMap map,HttpSession session) {
		customerService.changeOrderToReceive(id);
		
		List<Order> unpaidOrder = customerService.getUnpaidOrders(((Customer)session.getAttribute("cusInfo")).getTelephone());
		List<Order> paidOrder = customerService.getPaidOrders(((Customer)session.getAttribute("cusInfo")).getTelephone());
		session.removeAttribute("cusUnpaidOrders");
		session.removeAttribute("cusPaidOrders");
		session.setAttribute("cusUnpaidOrders", unpaidOrder);
		session.setAttribute("cusPaidOrders", paidOrder);
		return "user";
	}

}
