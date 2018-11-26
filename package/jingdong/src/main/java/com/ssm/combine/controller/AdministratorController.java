package com.ssm.combine.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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

import com.ssm.combine.DAO.OrderMapper;
import com.ssm.combine.DAO.SellerDAO;
import com.ssm.combine.DAO.ShopDAO;
import com.ssm.combine.DAO.shopAdsMapper;
import com.ssm.combine.DAO.tradeRateMapper;
import com.ssm.combine.model.Administrator;
import com.ssm.combine.model.BlackList;
import com.ssm.combine.model.Customer;
import com.ssm.combine.model.Order;
import com.ssm.combine.model.ProductAds;
import com.ssm.combine.model.Seller;
import com.ssm.combine.model.Shop;
import com.ssm.combine.model.shopAds;
import com.ssm.combine.service.AdministratorService;

@Controller
public class AdministratorController {
	@Autowired
	private AdministratorService administratorService;
	@Autowired
	private ShopDAO shopDAO;
	@Autowired
	private SellerDAO sellerDAO;
	@Autowired
	private shopAdsMapper shopAdsDAO;
	@Autowired
	private tradeRateMapper tradeRateDAO;
	@Autowired
	private OrderMapper orderMapper;

	@RequestMapping("adm_login.do")
	public ModelAndView login(HttpSession session, String username,
			String password) {
		ModelAndView mv = new ModelAndView();
		Administrator administrator = new Administrator();
		administrator.setId(Integer.parseInt(username));
		administrator.setPassword(password);
		String name = administratorService.login(administrator.getId(),
				administrator.getPassword());

		if (name == null) {
			mv.addObject("msg", "Login failed user name or password error");
			mv.setViewName("index");
		} else {
			session.removeAttribute("admInfo");
			session.removeAttribute("unTreatedShops");
			session.removeAttribute("unTreatedShopAds");
			session.removeAttribute("unTreatedProductAds");
			session.removeAttribute("treatedShops");
			session.removeAttribute("treatedShopAds");
			session.removeAttribute("treatedProductAds");
			session.removeAttribute("customers");
			session.removeAttribute("sellers");
			session.removeAttribute("customersOnBlack");
			session.removeAttribute("sellersOnBlack");
			session.removeAttribute("rate");
			session.removeAttribute("adminOrders");
			List<Shop> unTreatedshops = shopDAO.selectShopsByApplyStatus(0);
			List<Shop> treatedshops = shopDAO.selectShopsNotByApplyStatus(0);
			List<Customer> customers = administratorService.getCustomers();
			List<Seller> sellers = administratorService.getSellers();
			List<Customer> customersOnBlack = administratorService
					.getCustomerBlackLists();
			List<Seller> sellersOnBlack = administratorService
					.getSellerBlackLists();
			List<shopAds> treatedShopAds = administratorService.getShopAds();
			List<shopAds> unTreatedShopAds = administratorService
					.getApplyingShopAds();
			List<ProductAds> treatedProductAds = administratorService
					.getProductAds();
			List<ProductAds> unTreatedProductAds = administratorService
					.getApplyingProductAds();
			List<Order> orders = orderMapper.selectOrders();

			double rate = tradeRateDAO.selectRate();

			administrator.setName(name);
			mv.setViewName("admin");
			session.setAttribute("admInfo", administrator);
			session.setAttribute("unTreatedShops", unTreatedshops);
			session.setAttribute("unTreatedShopAds", unTreatedShopAds);
			session.setAttribute("unTreatedProductAds", unTreatedProductAds);
			session.setAttribute("treatedShops", treatedshops);
			session.setAttribute("treatedShopAds", treatedShopAds);
			session.setAttribute("treatedProductAds", treatedProductAds);
			session.setAttribute("customers", customers);
			session.setAttribute("sellers", sellers);
			session.setAttribute("customersOnBlack", customersOnBlack);
			session.setAttribute("sellersOnBlack", sellersOnBlack);
			session.setAttribute("rate", rate);
			session.setAttribute("adminOrders", orders);
		}
		return mv;
	}

	@RequestMapping("adm_loginOut.do")
	public String logOut(HttpSession session) {
		session.removeAttribute("admInfo");
		session.removeAttribute("unTreatedShops");
		session.removeAttribute("unTreatedShopAds");
		session.removeAttribute("unTreatedProductAds");
		session.removeAttribute("treatedShops");
		session.removeAttribute("treatedShopAds");
		session.removeAttribute("treatedProductAds");
		session.removeAttribute("customers");
		session.removeAttribute("sellers");
		session.removeAttribute("customersOnBlack");
		session.removeAttribute("sellersOnBlack");
		session.removeAttribute("rate");
		session.removeAttribute("adminOrders");
		return "index";
	}

	@RequestMapping("adm_Sellerinfo.do")
	public ModelAndView getIDPicture(String sellerID) {
		ModelAndView mv = new ModelAndView();

		Seller seller = sellerDAO.selectSeller(sellerID);
		mv.addObject("product", seller);
		mv.setViewName("SellerInfo");
		return mv;
	}

	@RequestMapping(value = "adm_getIDPicture.do", method = RequestMethod.GET)
	public void getProductPicture2(String id, final HttpServletResponse response)
			throws IOException {
		byte[] data = sellerDAO.selectSeller(id).getIdPicture();
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

	@RequestMapping("adm_modifyPassword.do")
	public String modifyPassword(String oldPassword, String newPassword,
			ModelMap map) {
		if (oldPassword.equals(newPassword)) {
			map.addAttribute("msg",
					"The new password is the same as the old one!");
			return "admin";
		}
		if (administratorService.modifyPassword(oldPassword, newPassword))
			map.addAttribute("msg", "Password modification success!");
		else
			map.addAttribute("msg", "Old Password was wrong！");
		return "admin";
	}

	@RequestMapping("/getCustomer.do")
	public ModelAndView getCustomer(String telephone) {
		ModelAndView mv = new ModelAndView();

		Customer customer = administratorService.getCustomer(telephone);
		mv.addObject("customerInfo", customer);
		return mv;
	}

	@RequestMapping("/searchCustomer.do")
	public ModelAndView searchCustomer(String keyWord) {
		ModelAndView mv = new ModelAndView();

		List<Customer> customers = administratorService
				.searchCustomers(keyWord);
		mv.addObject("searchCustomers", customers);
		return mv;
	}

	@RequestMapping("/getSeller.do")
	public ModelAndView getSeller(String telephone) {
		ModelAndView mv = new ModelAndView();

		Seller seller = administratorService.getSeller(telephone);
		mv.addObject("sellerInfo", seller);
		return mv;
	}

	@RequestMapping("/searchSeller.do")
	public ModelAndView searchSeller(String keyWord) {
		ModelAndView mv = new ModelAndView();

		List<Seller> sellers = administratorService.searchSellers(keyWord);
		mv.addObject("searchSellers", sellers);
		return mv;
	}

	@RequestMapping("adm_searchShops.do")
	public String searchShop(String keyWord, ModelMap map) {
		List<Shop> shops = administratorService.searchShops(keyWord);
		map.addAttribute("searchShops", shops);
		return "admin";
	}

	@RequestMapping("adm_searchPersons.do")
	public ModelAndView searchPersons(String keyWord) {
		ModelAndView mv = new ModelAndView();

		List<Seller> sellers = administratorService.searchSellers(keyWord);
		List<Customer> customers = administratorService
				.searchCustomers(keyWord);
		mv.addObject("searchCustomers", customers);
		mv.addObject("searchSellers", sellers);
		mv.setViewName("admin");
		return mv;
	}

	@RequestMapping("/getCustomers.do")
	public ModelAndView getCustomers() {
		ModelAndView mv = new ModelAndView();

		List<Customer> customers = administratorService.getCustomers();
		mv.addObject("customersInfo", customers);
		return mv;
	}

	@RequestMapping("/getSellers.do")
	public ModelAndView getSellers() {
		ModelAndView mv = new ModelAndView();

		List<Seller> sellers = administratorService.getSellers();
		mv.addObject("sellersInfo", sellers);
		return mv;
	}

	@RequestMapping("/getShops.do")
	public ModelAndView getShops() {
		ModelAndView mv = new ModelAndView();

		List<Shop> shops = administratorService.getShops();
		mv.addObject("shopsInfo", shops);
		return mv;
	}

	@RequestMapping("adm_deleteCustomer.do")
	public String deleteCustomer(String telePhone, HttpSession session,
			ModelMap map) {
		if (administratorService.deleteCustomer(telePhone)) {
			session.removeAttribute("customers");
			List<Customer> customers = administratorService.getCustomers();
			map.addAttribute("msg", "Customer has been deleted!");
			session.setAttribute("customers", customers);
		} else
			map.addAttribute("msg", "Don't delete again!");
		return "admin";
	}

	@RequestMapping("adm_deleteSeller.do")
	public String deleteSeller(String telePhone, HttpSession session,
			ModelMap map) {
		if (administratorService.deleteSeller(telePhone)) {
			session.removeAttribute("sellers");
			List<Seller> sellers = administratorService.getSellers();
			map.addAttribute("msg", "Seller has been deleted!");
			session.setAttribute("sellers", sellers);
		} else
			map.addAttribute("msg", "Don't delete again!");
		return "admin";
	}

	@RequestMapping("adm_deleteShop.do")
	public String deleteShop(int id, ModelMap map, HttpSession session) {
		List<Shop> treatedshops = shopDAO.selectShopsNotByApplyStatus(0);
		if (administratorService.deleteShop(id))
			map.addAttribute("msg", "delete Shop success!");
		else
			map.addAttribute("msg", "delete Shop failure!");
		session.removeAttribute("treatedShops");
		session.setAttribute("treatedShops", treatedshops);
		return "admin";
	}

	@RequestMapping("adm_addBlackList.do")
	public String addBlackList(String blackID, int type, HttpSession session,
			ModelMap map) {
		if (type == 0) {
			if (administratorService.addBlackList(blackID, type)) {
				session.removeAttribute("customersOnBlack");
				session.removeAttribute("customers");
				List<Customer> customersOnBlack = administratorService
						.getCustomerBlackLists();
				List<Customer> customers = administratorService.getCustomers();
				session.setAttribute("customersOnBlack", customersOnBlack);
				session.setAttribute("customers", customers);
				map.addAttribute("msg", "Customer joined the blacklist!");
			} else
				map.addAttribute("msg", "Don't Pull black again!");
		} else {
			if (administratorService.addBlackList(blackID, type)) {
				session.removeAttribute("sellersOnBlack");
				session.removeAttribute("sellers");
				List<Seller> sellersOnBlack = administratorService
						.getSellerBlackLists();
				List<Seller> sellers = administratorService.getSellers();
				session.setAttribute("sellersOnBlack", sellersOnBlack);
				session.setAttribute("sellers", sellers);
				map.addAttribute("msg", "Seller joined the blacklist!");
			} else
				map.addAttribute("msg", "Don't Pull black again!");
		}
		return "admin";
	}

	@RequestMapping("/getCustomerBlackLists.do")
	public ModelAndView getCustomerBlackLists() {
		ModelAndView mv = new ModelAndView();
		List<Customer> blackLists = administratorService
				.getCustomerBlackLists();
		mv.addObject("customerBlackLists", blackLists);
		return mv;
	}

	@RequestMapping("/getSellerBlackLists.do")
	public ModelAndView getSellerBlackLists() {
		ModelAndView mv = new ModelAndView();
		List<Seller> blackLists = administratorService.getSellerBlackLists();
		mv.addObject("sellerBlackLists", blackLists);
		return mv;
	}

	@RequestMapping("/getShopBlackLists.do")
	public ModelAndView getShopBlackLists() {
		ModelAndView mv = new ModelAndView();
		List<Shop> blackLists = administratorService.getShopBlackLists();
		mv.addObject("shopBlackLists", blackLists);
		return mv;
	}

	@RequestMapping("adm_removeBlackList.do")
	public String deleteBlackList(BlackList blackList, HttpSession session,
			ModelMap map) {
		if (blackList.getType() == 0) {
			if (administratorService.deleteBlackList(blackList)) {
				session.removeAttribute("customersOnBlack");
				session.removeAttribute("customers");
				List<Customer> customersOnBlack = administratorService
						.getCustomerBlackLists();
				List<Customer> customers = administratorService.getCustomers();
				session.setAttribute("customersOnBlack", customersOnBlack);
				session.setAttribute("customers", customers);
				map.addAttribute("msg",
						"Customer has been removed from the blacklist!");
			} else
				map.addAttribute("msg", "Don't remove again!");
		} else {
			if (administratorService.deleteBlackList(blackList)) {
				session.removeAttribute("sellersOnBlack");
				session.removeAttribute("sellers");
				List<Seller> sellersOnBlack = administratorService
						.getSellerBlackLists();
				List<Seller> sellers = administratorService.getSellers();
				session.setAttribute("sellersOnBlack", sellersOnBlack);
				session.setAttribute("sellers", sellers);
				map.addAttribute("msg",
						"Seller has been removed from the blacklist!");
			} else
				map.addAttribute("msg", "Don't remove again!");
		}
		return "admin";
	}

	@RequestMapping("/getUntreatedShop.do")
	public ModelAndView getUntreatedShop() {
		ModelAndView mv = new ModelAndView();

		List<Shop> shops = administratorService.getUntreatedShop();
		mv.addObject("unTreatedShop", shops);
		return mv;
	}

	@RequestMapping(value = "/getIdPicture.do", method = RequestMethod.GET)
	public void getProductPicture(String telephone,
			final HttpServletResponse response) throws IOException {
		Seller seller = sellerDAO.selectSeller(telephone);
		byte[] data = seller.getIdPicture();
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

	@RequestMapping("/getRejectedShop.do")
	public ModelAndView getRejectShop() {
		ModelAndView mv = new ModelAndView();

		List<Shop> shops = administratorService.getRejectedShop();
		mv.addObject("rejectedShop", shops);
		return mv;
	}

	@RequestMapping("/getPermittedShop.do")
	public ModelAndView getPermittedShop() {
		ModelAndView mv = new ModelAndView();

		List<Shop> shops = administratorService.getPermittedShop();
		mv.addObject("permittedShop", shops);
		return mv;
	}

	@RequestMapping("adm_disposeShopRequest.do")
	public String disposeShopRequest(HttpSession session, int shopID,
			int status, String reason, ModelMap map) {
		if (administratorService.dealWithShop(shopID, status, reason))
			map.addAttribute("msg", "success!");
		else
			map.addAttribute("msg", "failure!");
		List<Shop> unTreatedshops = shopDAO.selectShopsByApplyStatus(0);
		List<Shop> treatedshops = shopDAO.selectShopsNotByApplyStatus(0);
		session.removeAttribute("unTreatedShops");
		session.removeAttribute("treatedShops");
		session.setAttribute("unTreatedShops", unTreatedshops);
		session.setAttribute("treatedShops", treatedshops);
		Shop sellerShop = shopDAO.selectShopsByShopID(shopID);
		session.removeAttribute("shopInfo");
		session.setAttribute("shopInfo", sellerShop);
		return "admin";
	}

	@RequestMapping("adm_backupDB.do")
	public String backupDB(ModelMap map) {
		Path path = Paths.get("C:", "Users", "duyu1", "Desktop");
		String filename = "database.sql";
		if (administratorService.backUpDB(path.toString(), filename))
			map.addAttribute("msg", "Database backup success!");
		else
			map.addAttribute("msg", "Database backup failure! Please Try Again");
		return "admin";
	}

	@RequestMapping("adm_restoreDB.do")
	public String restoreDB(
			@RequestParam("databaseFile") CommonsMultipartFile uploadFile,
			HttpServletRequest request, ModelMap map) {
		Path path = Paths.get("C:", "Users", "duyu1", "Desktop");
		String fileName = uploadFile.getOriginalFilename();
		if (administratorService.restoreDB(path.toString(), fileName))
			map.addAttribute("msg", "restore Database success!");
		else
			map.addAttribute("msg", "restore Database failed!");
		return "admin";
	}

	@RequestMapping("/getShopAds.do")
	public ModelAndView getPassShopAds() {
		ModelAndView mv = new ModelAndView();
		List<shopAds> shopAds = administratorService.getShopAds();
		mv.setViewName("admin");
		mv.addObject("shopAds", shopAds);
		return mv;
	}

	@RequestMapping("adm_deleteShopAds.do")
	public String deleteShopAds(int id, ModelMap map, HttpSession session) {
		if (administratorService.deleteShopAds(id)) {
			session.removeAttribute("treatedShopAds");
			List<shopAds> treatedShopAds = administratorService.getShopAds();
			session.setAttribute("treatedShopAds", treatedShopAds);
			map.addAttribute("msg", "delete success!");
		} else
			map.addAttribute("msg", "delete failure!");
		return "admin";
	}

	@RequestMapping("/getApplyingShopAds.do")
	public ModelAndView getApplyingShopAds() {
		ModelAndView mv = new ModelAndView();
		List<shopAds> shopAds = administratorService.getApplyingShopAds();
		mv.setViewName("admin");
		mv.addObject("applyingShopAds", shopAds);
		return mv;
	}

	@RequestMapping("adm_dealShopAdsByHand.do")
	public String dealShopAdsByHand(int id, int status, ModelMap map,
			HttpSession session) {
		if (administratorService.dealWithShopAdsApplyByIntem(id, status)) {
			session.removeAttribute("unTreatedShopAds");
			session.removeAttribute("treatedShopAds");
			List<shopAds> treatedShopAds = administratorService.getShopAds();
			List<shopAds> unTreatedShopAds = administratorService
					.getApplyingShopAds();
			shopAds shopAds = shopAdsDAO.selectById(id);
			session.removeAttribute("shopAds");
			session.setAttribute("shopAds", shopAds);
			session.setAttribute("unTreatedShopAds", unTreatedShopAds);
			session.setAttribute("treatedShopAds", treatedShopAds);

			map.addAttribute("msg", "deal with shopAds manage success!");
		} else
			map.addAttribute("msg", "deal with shopAds manage failure!");
		return "admin";
	}

	@RequestMapping("adm_dealShopAdsAuto.do")
	public String dealShopAdsAuto(ModelMap map, HttpSession session) {
		if (administratorService.dealWithShopAdsApplyAutomatically()) {
			session.removeAttribute("unTreatedShopAds");
			session.removeAttribute("treatedShopAds");
			List<shopAds> treatedShopAds = administratorService.getShopAds();
			List<shopAds> unTreatedShopAds = administratorService
					.getApplyingShopAds();
			session.setAttribute("unTreatedShopAds", unTreatedShopAds);
			session.setAttribute("treatedShopAds", treatedShopAds);
			map.addAttribute("msg", "deal with shopAds manage success!");
		} else
			map.addAttribute("msg", "failure!");
		return "admin";
	}

	@RequestMapping("/getRejectedShopAds.do")
	public ModelAndView getRejectedShopAds() {
		ModelAndView mv = new ModelAndView();
		List<shopAds> shopAds = administratorService.getRejectedShopAds();
		mv.setViewName("admin");
		mv.addObject("rejectedShopAds", shopAds);
		return mv;
	}

	@RequestMapping("adm_deleteRejectedShopAds.do")
	public String deleteRejectedShopAds(HttpSession session, ModelMap map) {
		if (administratorService.deleteRejectedShopAdsList()) {
			session.removeAttribute("treatedShopAds");
			List<shopAds> treatedShopAds = administratorService.getShopAds();
			session.setAttribute("treatedShopAds", treatedShopAds);
			map.addAttribute("msg", "delete success!");
		} else
			map.addAttribute("msg", "failure!");
		return "admin";
	}

	@RequestMapping("/getProductAds.do")
	public ModelAndView getPassProductAds() {
		ModelAndView mv = new ModelAndView();
		List<ProductAds> productAds = administratorService.getProductAds();
		mv.setViewName("admin");
		mv.addObject("productAds", productAds);
		return mv;
	}

	@RequestMapping("adm_deleteProductAds.do")
	public String deleteProductAds(int id, ModelMap map) {
		if (administratorService.deleteProductAds(id))
			map.addAttribute("msg", "delete productAds Success!");
		else
			map.addAttribute("msg", "Don't delete again!");
		return "admin";
	}

	@RequestMapping("/getApplyingProductAds.do")
	public ModelAndView getApplyingProductAds() {
		ModelAndView mv = new ModelAndView();
		List<ProductAds> productAds = administratorService
				.getApplyingProductAds();
		mv.setViewName("admin");
		mv.addObject("applyingProductAds", productAds);
		return mv;
	}

	@RequestMapping("adm_dealProductAdsByHand.do")
	public String dealProductAdsByHand(int id, int status, ModelMap map) {
		if (administratorService.dealWithProductAdsApplyByIntem(id, status))
			map.addAttribute("msg", "success!");
		else
			map.addAttribute("msg", "failure!");
		return "admin";
	}

	@RequestMapping("adm_dealProductAdsAuto.do")
	public String dealProductAdsAuto(ModelMap map) {
		if (administratorService.dealWithProductAdsApplyAutomatically())
			map.addAttribute("msg", "success!");
		else
			map.addAttribute("msg", "failure!");
		return "admin";
	}

	@RequestMapping("/getRejectedProductAds.do")
	public ModelAndView getRejectedProductAds() {
		ModelAndView mv = new ModelAndView();
		List<ProductAds> productAds = administratorService
				.getRejectedProductAds();
		mv.setViewName("admin");
		mv.addObject("rejectedProductAds", productAds);
		return mv;
	}

	@RequestMapping("adm_deleteRejectedProductAds.do")
	public String deleteRejectedProductAds(ModelMap map) {
		if (administratorService.deleteRejectedProductAdsList()) {
			map.addAttribute("msg", "delete productAds Success!");
		} else
			map.addAttribute("msg", "Don't delete again!");
		return "admin";
	}

	@RequestMapping("modifyRate.do")
	public String modeifyRate(double rate, HttpSession session, ModelMap map) {
		if (rate <= 0.00 || rate >= 100.00) {
			map.addAttribute("msg", "rate was illegal please re-enter!");
			return "admin";
		}
		if (tradeRateDAO.updateRate(rate) == 1) {
			session.removeAttribute("rate");
			map.addAttribute("msg", "Interest rate modification success!");
			session.setAttribute("rate", rate);
		} else
			map.addAttribute("msg", "Interest rate modification failure!");
		return "admin";
	}
}
