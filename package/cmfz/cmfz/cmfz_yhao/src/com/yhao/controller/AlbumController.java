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

import com.yhao.entity.Album;
import com.yhao.service.AlbumService;

@Controller
@RequestMapping("/Album")
public class AlbumController {

	@Resource(name="albumService")
	private AlbumService albumService;
	
	//查一个
	@RequestMapping("/queryAlbum")
	@ResponseBody
	public Album queryAlbumOneController(Album album){
		return albumService.queryItem(album);
	}
	//查所有
	@RequestMapping("/queryAllAlbum")
	@ResponseBody
	public List<Album> queryAllAlbumController(){
		return albumService.queryItems();
	}
	//添加
	//删除
	
	//文件上传及添加
	@RequestMapping("/upload")
	@ResponseBody
	public void uploadFile(MultipartFile file,HttpSession session,Album album) throws IllegalStateException, IOException{
		String realPath = session.getServletContext().getRealPath("/file");
		String fileName = file.getOriginalFilename();
		File destFile = new File(realPath+"/"+fileName);
		file.transferTo(destFile);
		album.setCoverImg("/cmfz_yhao/file/"+fileName);
		album.setId((String)session.getAttribute("uuid"));
		albumService.addItem(album);
		session.setAttribute("uuid", null);
	}
	

}
