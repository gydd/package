package com.yhao.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.yhao.dao.MenuDao;
import com.yhao.entity.Menu;

@Service("menuService")
@Transactional(propagation=Propagation.SUPPORTS,readOnly=true)
public class MenuServiceImpl implements MenuService {
	
	@Resource(name="menuDao")
	private MenuDao menuDao;

	@Override
	public void addItem(Menu t) {
	}

	@Override
	public void modifyItem(Menu t) {
	}

	@Override
	public void dropItem(Menu t) {
	}

	@Override
	public Menu queryItem(Menu t) {
		return null;
	}

	@Override
	public List<Menu> queryItems() {
		
		return menuDao.selectItems();
	}

}
