package com.yhao.controller;

import java.awt.image.BufferedImage;
import java.io.IOException;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yhao.entity.Admin;
import com.yhao.service.AdminService;
import com.yhao.util.SecurityCode;
import com.yhao.util.SecurityImage;

@Controller
@RequestMapping("/Admin")
public class AdminController {
	
	@Resource(name="adminService")
	private AdminService adminService;
	
	//管理员验证
	@RequestMapping("/queryOne")
	public String queryOneController(Admin admin,HttpSession session){
		System.out.println(admin);
		Admin adm = adminService.queryItem(admin);
		if(adm != null){
			session.setAttribute("admin", adm);
			return "redirect:/cmfz/main/main.jsp";
		}else{
			return "redirect:/cmfz/login.jsp";
		}
		
	}
	
	//验证码
	@ResponseBody
	@RequestMapping("/securityCode")
	public void securityCodeController(HttpSession session,HttpServletResponse response) throws IOException{
		String code = SecurityCode.getSecurityCode();
		session.setAttribute("code", code);
		BufferedImage createImage = SecurityImage.createImage(code);
		ServletOutputStream out = response.getOutputStream();
		ImageIO.write(createImage, "jpeg", out);
	}
	
	//验证码验证
	@ResponseBody
	@RequestMapping("/verifyCode")
	public String verifyCodeController(String newCode,HttpSession session){
		String oldCode = (String) session.getAttribute("code");
		if(newCode.equals(oldCode)){
			return "true";
		}else{
			return "false";
		}
	}
}
