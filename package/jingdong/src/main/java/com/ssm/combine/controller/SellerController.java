package com.ssm.combine.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

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
import com.ssm.combine.service.SellerService;

@Controller
public class SellerController {
	@Autowired
	private SellerService sellerService;
	@Autowired
	private SellerDAO sellerDAO;
	@Autowired
	private ShopDAO shopDAO;
	@Autowired
	private shopAdsMapper shopAdsDAO;
	@Autowired
	private ProductDAO productDAO;

	@RequestMapping("sel_login.do")
	public ModelAndView login(HttpSession session, Seller seller) {
		ModelAndView mv = new ModelAndView();
		Seller loginSeller = sellerService.login(seller.getTelePhone(),
				seller.getPassword());
		if (loginSeller == null) {
			mv.addObject("msg",
					"Login failed user does not exist or password error!");
			mv.setViewName("login");
		} else if (loginSeller.getIsBlack() == 1) {
			mv.addObject("msg", "Login failed user on black list!");
			mv.setViewName("login");
		} else {
			session.removeAttribute("shopInfo");
			session.removeAttribute("selProducts");
			session.removeAttribute("selInfo");
			session.removeAttribute("shopAds");
			session.removeAttribute("productAds");
			session.removeAttribute("productNotAds");
			session.removeAttribute("selOrders");
			Shop shop = sellerService.getShop(seller.getTelePhone());
			List<Product> products = sellerService.getProducts(seller
					.getTelePhone());
			shopAds shopAds = null;
			if (shop != null)
				shopAds = sellerService.getShopAds(shop.getId());
			List<ProductAds> productAds = sellerService.getProductAds(seller
					.getTelePhone());
			List<Product> productNotAds = productDAO.selectNotInAds(seller
					.getTelePhone());
			List<Order> orders = sellerService.getOrders(seller.getTelePhone());
			Timestamp updateDate = new Timestamp(new Date().getTime());
			sellerDAO.updateTime(seller.getTelePhone(), updateDate);
			mv.setViewName("Seller");

			session.setAttribute("selInfo", loginSeller);
			session.setAttribute("shopInfo", shop);
			session.setAttribute("selProducts", products);
			session.setAttribute("shopAds", shopAds);
			session.setAttribute("productAds", productAds);
			session.setAttribute("productNotAds", productNotAds);
			session.setAttribute("selOrders", orders);
		}
		return mv;
	}

	@RequestMapping("sel_loginOut.do")
	public String logOut(HttpSession session) {
		session.removeAttribute("shopInfo");
		session.removeAttribute("selProducts");
		session.removeAttribute("selInfo");
		session.removeAttribute("shopAds");
		session.removeAttribute("productAds");
		session.removeAttribute("productNotAds");
		session.removeAttribute("selOrders");
		return "index";
	}

	@RequestMapping(value = "sel_register.do", method = RequestMethod.POST)
	public ModelAndView register(
			@RequestParam("IDPicture") CommonsMultipartFile uploadFile,String telCode,
			Seller seller, HttpSession session) throws IOException {
		ModelAndView mv = new ModelAndView();

		if (seller.getTelePhone().length() != 11) {
			mv.addObject("msg", "Phone number error!");
			mv.setViewName("login");
			return mv;
		}
		if(!session.getAttribute("telCode").equals(telCode))
		{
			mv.addObject("msg", "Verification code error!");
			mv.setViewName("login");
			return mv;
		}
		if(uploadFile==null||uploadFile.getSize()==0)
		{
			mv.addObject("msg", "IDPicture can not be empty!");
			mv.setViewName("login");
			return mv;
		}

		byte[] pictureData = new byte[(int) uploadFile.getSize()];
		InputStream isPictureFile = uploadFile.getInputStream();
		isPictureFile.read(pictureData);
		seller.setIdPicture(pictureData);

		if (sellerService.register(seller)) {
			session.removeAttribute("shopInfo");
			session.removeAttribute("selProducts");
			session.removeAttribute("selInfo");
			session.removeAttribute("shopAds");
			session.removeAttribute("productAds");
			session.removeAttribute("productNotAds");
			mv.setViewName("Seller");
			session.setAttribute("selInfo", seller);
		} else {
			mv.addObject("msg", "Phone number has been registered!");
			mv.setViewName("login");
		}
		isPictureFile.close();
		return mv;
	}

	@RequestMapping("sel_modifyPassword.do")
	public String modifyPassword(String telePhone, String oldPassword,
			String newPassword, ModelMap map) {
		if (oldPassword.equals(newPassword)) {
			map.addAttribute("msg",
					"The new password is the same as the old one!");
			return "Seller";
		}
		if (sellerService.modifyPassword(telePhone, oldPassword, newPassword))
			map.addAttribute("msg", "Password modification success!");
		else
			map.addAttribute("msg", "Old Password was wrong！");
		return "Seller";
	}

	@RequestMapping(value = "sel_applyShop.do", method = RequestMethod.POST)
	public ModelAndView applyForShop(Shop shop,
			@RequestParam("IDPicture") CommonsMultipartFile uploadFile,
			HttpSession session) throws IOException {
		ModelAndView mv = new ModelAndView();
		byte[] pictureData = new byte[(int) uploadFile.getSize()];
		InputStream isPictureFile = uploadFile.getInputStream();
		isPictureFile.read(pictureData);
		shop.setPicture(pictureData);

		if (sellerService.applyShop(shop)) {
			Shop applyShop = shopDAO.selectShopsBySellerID(shop.getSellerID());
			session.setAttribute("shopInfo", applyShop);
			mv.addObject("msg", "Shop Application success!");
		}

		else
			mv.addObject("msg", "Shop Application failure!Only one Shop!");
		mv.setViewName("Seller");
		return mv;
	}

	@RequestMapping("sel_getShop.do")
	public void getOwnShop(String sellerID, ModelMap map) {
		Shop shop = sellerService.getShop(sellerID);
		map.addAttribute("shop", shop);
	}

	@RequestMapping(value = "sel_getShopPicture.do", method = RequestMethod.GET)
	public void getProductPicture(int id, final HttpServletResponse response)
			throws IOException {
		Shop shop = shopDAO.selectShopsByShopID(id);
		byte[] data = shop.getPicture();
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

	@RequestMapping(value = "sel_modifyShop.do", method = RequestMethod.POST)
	public ModelAndView modifyShop(Shop shop,
			@RequestParam("shopPicture") CommonsMultipartFile uploadFile,
			HttpSession session) throws IOException {
		ModelAndView mv = new ModelAndView();
		byte[] pictureData = new byte[(int) uploadFile.getSize()];
		InputStream isPictureFile = uploadFile.getInputStream();
		isPictureFile.read(pictureData);
		shop.setPicture(pictureData);

		if (sellerService.modifyShop(shop)) {
			session.removeAttribute("shopInfo");
			session.setAttribute("shopInfo", shop);
			mv.addObject("msg", "Shop Information modification success!");
		} else
			mv.addObject("msg", "Shop Information modification failure!");
		mv.setViewName("Seller");
		return mv;
	}

	@RequestMapping(value = "sel_addProduct.do", method = RequestMethod.POST)
	public String addProduct(Product product,
			@RequestParam("productPicture") CommonsMultipartFile uploadFile,
			HttpSession session, ModelMap map) throws IOException {
		byte[] pictureData = new byte[(int) uploadFile.getSize()];
		InputStream isPictureFile = uploadFile.getInputStream();
		isPictureFile.read(pictureData);
		product.setPicture(pictureData);

		if (sellerService.addProduct(product)) {
			List<Product> products = sellerService.getProducts(product
					.getSellerID());
			session.setAttribute("selProducts", products);
			map.addAttribute("msg", "add product success!");
		}

		else
			map.addAttribute("msg", "Not yet have a passed shop!");
		return "Seller";
	}

	@RequestMapping("sel_deleteProduct.do")
	public String deleteProduct(int id, String sellerID, HttpSession session) {
		sellerService.deleteProduct(id);
		List<Product> products = sellerService.getProducts(sellerID);
		session.removeAttribute("selProducts");
		if (products != null)
			session.setAttribute("selProducts", products);
		return "Seller";
	}

	@RequestMapping("sel_modifyPrice.do")
	public String modifyProductPrice(int id, double price) {
		if (sellerService.modifyProductPrice(id, price))
			return "success";
		else
			return "failure";
	}

	@RequestMapping("sel_addProductTotal.do")
	public String addProductTotal(int id, int number,ModelMap map) {
		if(number<=0)
		{
			map.addAttribute("msg", "Illegal entry,Only Integer!");
			return "Seller";
		}
			
		if (sellerService.addProductTotal(id, number))
			map.addAttribute("msg", "Stock Add Success!");
		else
			map.addAttribute("msg", "Add failed,try again!");
		return "Seller";
	}

	@RequestMapping("sel_getProducts.do")
	public ModelAndView getProducts(String sellerID) {
		ModelAndView mv = new ModelAndView();
		List<Product> products = sellerService.getProducts(sellerID);
		mv.addObject("productsInfo", products);
		return mv;
	}

	@RequestMapping("sel_deleteOrder.do")
	public String deleteOrder(int id, ModelMap map) {
		if (sellerService.deleteOrder(id))
			map.addAttribute("msg", "Order has been deleted!");
		else
			map.addAttribute("msg", "Order deletion failed!");
		return (String) map.get("msg");
	}

	@RequestMapping("sel_changeOrderDelivered.do")
	public String updateOrder(int id, ModelMap map) {
		if (sellerService.changeOrderToDelivered(id))
			map.addAttribute("msg", "success!");
		else
			map.addAttribute("msg", "falilure!");
		return "Seller";
	}

	@RequestMapping("sel_getOrders.do")
	public ModelAndView getOrders(String sellerID) {
		ModelAndView mv = new ModelAndView();
		List<Order> orders = sellerService.getOrders(sellerID);
		mv.setViewName("user");
		mv.addObject("orders", orders);
		return mv;
	}

	@RequestMapping("sel_applyShopAds.do")
	public String applyShopAds(shopAds shopAds, ModelMap map,
			HttpSession session) {
		if (sellerService.applyShopAds(shopAds)) {
			map.addAttribute("msg", "success!");
			shopAds shopAds2 = sellerService.getShopAds(shopAds.getShopID());
			session.setAttribute("shopAds", shopAds2);
		} else
			map.addAttribute("msg", "You have already applied!");
		return "Seller";
	}

	@RequestMapping("sel_getShopAds.do")
	public ModelAndView getShopAds(String sellerID) {
		Shop shop = shopDAO.selectShopsBySellerID(sellerID);
		int shopID = shop.getId();
		ModelAndView mv = new ModelAndView();
		shopAds shopAds = sellerService.getShopAds(shopID);
		mv.setViewName("seller");
		mv.addObject("shopAds", shopAds);
		return mv;
	}

	@RequestMapping("sel_payForShopAds.do")
	public String payForShopAds(int id, ModelMap map, HttpSession session) {
		if (sellerService.payForShopAds(id)) {
			session.removeAttribute("shopAds");
			map.addAttribute("msg", "Payment success!");

			shopAds shopAds = shopAdsDAO.selectById(id);
			session.setAttribute("shopAds", shopAds);
		} else
			map.addAttribute("msg", "Payment failure");
		return "Seller";
	}

	@RequestMapping("applyProductAds.do")
	public String applyProductAds(ProductAds productAds, ModelMap map) {
		if (sellerService.applyProductAds(productAds))
			map.addAttribute("msg", "success!");
		else
			map.addAttribute("map", "Application failure!");
		return "Seller";
	}

	@RequestMapping("sel_getProductAds.do")
	public ModelAndView getProductAds(String sellerID) {
		ModelAndView mv = new ModelAndView();
		List<ProductAds> productAds = sellerService.getProductAds(sellerID);
		mv.setViewName("seller");
		mv.addObject("productAds", productAds);
		return mv;
	}

	@RequestMapping("sel_payForProductAds.do")
	public String payForProductAds(int id, ModelMap map) {
		if (sellerService.payForProductAds(id))
			map.addAttribute("msg", "Payment success!");
		else
			map.addAttribute("msg", "Payment failure!");
		return "Seller";
	}
}
