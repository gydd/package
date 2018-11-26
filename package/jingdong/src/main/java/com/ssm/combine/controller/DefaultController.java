package com.ssm.combine.controller;

import com.ssm.combine.DAO.ProductAdsMapper;
import com.ssm.combine.DAO.ProductDAO;
import com.ssm.combine.DAO.ShopDAO;
import com.ssm.combine.DAO.shopAdsMapper;
import com.ssm.combine.model.Product;
import com.ssm.combine.model.ProductAds;
import com.ssm.combine.model.Shop;
import com.ssm.combine.model.shopAds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.List;

@Controller
public class DefaultController {
	@Autowired
	private ShopDAO shopDAO;
	@Autowired
	private shopAdsMapper shopAdsDAO;
	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private ProductAdsMapper productAdsDAO;

	@RequestMapping("/")
	public ModelAndView defaultController() {
		ModelAndView mv = new ModelAndView();
		List<shopAds> shopAds = shopAdsDAO.selectByStatus(2);
		List<Shop> shops = new ArrayList<>();
		for (shopAds shopAds2 : shopAds) {
			Shop shop = shopDAO.selectShopsByShopID(shopAds2.getShopID());
			if (shop.getBlackStatus() == 0)
				shops.add(shop);
		}

		List<ProductAds> productAds = productAdsDAO.selectByStatus(2);
		List<Product> products = new ArrayList<>();
		for (ProductAds productAds2 : productAds) {
			Product product = productDAO.selectById(productAds2.getProductID());
			if (product.getIsBlack() == 0)
				products.add(product);
		}

		mv.addObject("shopAdses", shops);
		mv.addObject("productAdses", products);
		mv.setViewName("index");
		return mv;
	}

	@RequestMapping(value = "getShopAdsPicture.do", method = RequestMethod.GET)
	public void getShopAdsPicture(int id, final HttpServletResponse response)
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

	@RequestMapping("return.do")
	public ModelAndView backContext() {
		ModelAndView mv = new ModelAndView();
		List<shopAds> shopAds = shopAdsDAO.selectByStatus(2);
		List<Shop> shops = new ArrayList<>();
		for (shopAds shopAds2 : shopAds) {
			Shop shop = shopDAO.selectShopsByShopID(shopAds2.getShopID());
			if (shop.getBlackStatus() == 0)
				shops.add(shop);
		}

		List<ProductAds> productAds = productAdsDAO.selectByStatus(2);
		List<Product> products = new ArrayList<>();
		for (ProductAds productAds2 : productAds) {
			Product product = productDAO.selectById(productAds2.getProductID());
			if (product.getIsBlack() == 0)
				products.add(product);
		}

		mv.addObject("shopAdses", shops);
		mv.addObject("productAdses", products);
		mv.setViewName("index");
		return mv;
	}

	public static void main(String[] args) throws UnknownHostException {
		System.out.println(InetAddress.getLocalHost());
	}
}
