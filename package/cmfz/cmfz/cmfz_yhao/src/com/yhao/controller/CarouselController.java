package com.yhao.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.yhao.entity.Carousel;
import com.yhao.service.CarouselService;

@Controller
@RequestMapping("/Carousel")
public class CarouselController {
	
	@Resource(name="carouselService")
	private CarouselService carouselService;
	
	//添加
	@ResponseBody
	@RequestMapping("/addCarousel")
	public void addCarouselController(Carousel carousel){
		carouselService.addItem(carousel);
	}
	//修改
	@ResponseBody
	@RequestMapping("/modifyCarousel")
	public void modifyCarouselController(Carousel carousel){
		carouselService.modifyItem(carousel);
	}
	//删除
	@ResponseBody
	@RequestMapping("/dropCarousel")
	public void dropCarouselController(Carousel carousel){
		carouselService.dropItem(carousel);
	}
	//查询
	@ResponseBody
	@RequestMapping("/queryCarousel")
	public List<Carousel> queryCarouselController(){
		return carouselService.queryItems();
	}
	
	//文件上传及添加
	@RequestMapping("/upload")
	@ResponseBody
	public void uploadFile(MultipartFile file,HttpSession session,Carousel carousel) throws IllegalStateException, IOException{
		System.out.println(carousel);
		String realPath = session.getServletContext().getRealPath("/file");
		String fileName = file.getOriginalFilename();
		System.out.println(realPath);
		File destFile = new File(realPath+"/"+fileName);
		file.transferTo(destFile);
		carousel.setImgPath("/cmfz_yhao/file/"+fileName);
		carouselService.addItem(carousel);
	}
}
