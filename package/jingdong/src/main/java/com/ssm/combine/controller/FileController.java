package com.ssm.combine.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Controller
public class FileController {

	/* 文件上传 */
	@RequestMapping("file/upload.do")
	public String uploadFile(@RequestParam("file") CommonsMultipartFile uploadFile, HttpServletRequest request,ModelMap model) {
		String Path = request.getSession().getServletContext().getRealPath("/fileUpload");

		String filename = uploadFile.getOriginalFilename();
		
		if(filename.equals(""))
		{ 
			model.addAttribute("msg", "上传文件为空，上传失败！");
			return "file/fileUpLoadResult";
		}
		File saveFile = new File(Path, filename);
		if (!saveFile.exists())
			saveFile.mkdirs();
		try {
			uploadFile.transferTo(saveFile);
		} catch (IllegalStateException | IOException e) {
			model.addAttribute("msg", "文件上传异常为空，上传失败！");
			return "file/fileUpLoadResult";
		}
		model.addAttribute("msg", "文件上传成功！");
		return "file/fileUpLoadResult";
	}

	/* 多文件上传 */
	@RequestMapping("file/uploads.do")
	public String uploadFiles(@RequestParam("file") CommonsMultipartFile[] uploadFiles, HttpServletRequest request) {
		String Path = request.getSession().getServletContext().getRealPath("/fileUpload");

		for (CommonsMultipartFile uploadFile : uploadFiles) {
			String filename = uploadFile.getOriginalFilename();
			File saveFile = new File(Path, filename);
			if (!saveFile.exists())
				saveFile.mkdirs();
			try {
				uploadFile.transferTo(saveFile);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
				return "welcome/index";
			}
		}
		return "file/fileUpLoadSucess";
	}

	/* 文件下载 */
	@RequestMapping("file/load.do")
	public void fileLoad(HttpServletRequest request, HttpServletResponse response) {
		String Path = request.getSession().getServletContext().getRealPath("/fileUpload");
		try {
			/*避免参数中文乱码*/
			String fileName = new String(request.getParameter("fileName").getBytes("ISO8859_1"),"UTF-8");
			File loadFile = new File(Path, fileName);
			if (!loadFile.exists()) {
				request.setAttribute("message", "下载资源已删除!");
				System.out.println(fileName);
				System.out.println("File not found!");
				return;
			}

			// 设置响应头，控制浏览器下载该文件
			response.setHeader("content-disposition", "attachment;filename=" + URLEncoder.encode(fileName, "UTF-8"));
			// 文件输入流
			FileInputStream in = new FileInputStream(loadFile);
			ServletOutputStream outputStream = response.getOutputStream();

			byte[] buffer = new byte[1024];
			@SuppressWarnings("unused")
			int len = 0;
			while ((len = in.read(buffer)) > 0) {
				outputStream.write(buffer);
			}
			in.close();
			outputStream.close();

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			request.setAttribute("message", "下载资源已删除!");
			return;
		} catch (IOException e) {
			return;
		}
	}

	/* 获取上传的文件列表 */
	@RequestMapping("file/loadList.do")
	public String fileLoadList(HttpServletRequest request, ModelMap model) {
		List<String> fileLists = new ArrayList<>();

		String Path = request.getSession().getServletContext().getRealPath("/fileUpload");
		File baseFile = new File(Path);
		if (baseFile.exists())
			fileLists = getFileList(baseFile);

		model.addAttribute("fileList", fileLists);
		return "file/fileLoadList";
	}

	// 获取path路径下所有文件并返回文件名数组
	private List<String> getFileList(File file) {
		File[] files = file.listFiles();
		List<String> lists = new ArrayList<>();

		for (File file2 : files) {
			if (file2.isFile())
				lists.add(file2.getName());
			else {
				getFileList(file2);
			}
		}
		return lists;
	}
}
