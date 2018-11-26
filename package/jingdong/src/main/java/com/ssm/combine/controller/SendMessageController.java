package com.ssm.combine.controller;

import com.ssm.combine.service.SendMesssageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
public class SendMessageController {
	@Autowired
	private SendMesssageService sendMesssageService;
	
	@RequestMapping("sendMsg.do")
	public ModelAndView sendMessage(String telePhone,HttpSession session) {
		ModelAndView mv=new ModelAndView();
		session.removeAttribute("telCode");
		String sendCode=sendMesssageService.sendCode(telePhone);
		session.setAttribute("telCode", sendCode);
		mv.addObject("msg", "Dear user! SMS verification code has been sent to your mobile phone please check!");
		mv.setViewName("sendMsg");
		return mv;
	}
}
