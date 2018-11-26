package com.yhao.entity;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.alibaba.fastjson.annotation.JSONField;

public class Carousel implements Serializable {
	private Integer id;
	private String title;
	private String imgPath;
	private String description;
	private Integer status;
	@JSONField(format="yyyy-MM-dd")
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date date;
	public Carousel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Carousel(Integer id, String title, String imgPath,
			String description, Integer status, Date date) {
		super();
		this.id = id;
		this.title = title;
		this.imgPath = imgPath;
		this.description = description;
		this.status = status;
		this.date = date;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getImgPath() {
		return imgPath;
	}
	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "Carousel [id=" + id + ", title=" + title + ", imgPath="
				+ imgPath + ", description=" + description + ", status="
				+ status + ", date=" + date + "]";
	}
	
}
