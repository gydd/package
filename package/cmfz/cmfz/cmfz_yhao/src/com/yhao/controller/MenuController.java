package com.yhao.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yhao.entity.Menu;
import com.yhao.service.MenuService;

@Controller
@RequestMapping("/Menu")
public class MenuController {

	@Resource(name="menuService")
	private MenuService menuService;
	
	//菜单项查询
	@ResponseBody
	@RequestMapping("/queryAllMenu")
	public List<Menu> queryAllMenuControll(){
		return menuService.queryItems();
	}
}
