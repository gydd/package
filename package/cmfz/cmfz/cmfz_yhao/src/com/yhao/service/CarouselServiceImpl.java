package com.yhao.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.yhao.dao.CarouselDao;
import com.yhao.entity.Carousel;

@Service("carouselService")
@Transactional(propagation=Propagation.SUPPORTS,readOnly=true)
public class CarouselServiceImpl implements CarouselService {

	@Resource(name="carouselDao")
	private CarouselDao carouselDao;
	
	@Override
	public void addItem(Carousel t) {
		carouselDao.insertItem(t);

	}

	@Override
	public void modifyItem(Carousel t) {
		carouselDao.updateItem(t);

	}

	@Override
	public void dropItem(Carousel t) {
		carouselDao.deleteItem(t);

	}

	@Override
	public Carousel queryItem(Carousel t) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Carousel> queryItems() {
		return carouselDao.selectItems();
	}

}
