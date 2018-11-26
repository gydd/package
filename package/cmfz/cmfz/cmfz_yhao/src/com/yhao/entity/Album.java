package com.yhao.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.alibaba.fastjson.annotation.JSONField;

public class Album implements Serializable {
	private String id;
	private String title;
	private String coverImg;
	private Integer count;
	private String score;
	private String author;
	private String brief;
	@JSONField(format="yyyy-MM-dd")
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date publishDate;
	private List<Chapter> children;
	public Album() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Album(String id){
		super();
		this.id = id;
	}
	public Album(String id, String title, String coverImg, Integer count,
			String score, String author, String brief, Date publishDate,
			List<Chapter> children) {
		super();
		this.id = id;
		this.title = title;
		this.coverImg = coverImg;
		this.count = count;
		this.score = score;
		this.author = author;
		this.brief = brief;
		this.publishDate = publishDate;
		this.children = children;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCoverImg() {
		return coverImg;
	}
	public void setCoverImg(String coverImg) {
		this.coverImg = coverImg;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getBrief() {
		return brief;
	}
	public void setBrief(String brief) {
		this.brief = brief;
	}
	public Date getPublishDate() {
		return publishDate;
	}
	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}
	public List<Chapter> getChildren() {
		return children;
	}
	public void setChildren(List<Chapter> children) {
		this.children = children;
	}
	@Override
	public String toString() {
		return "Album [id=" + id + ", title=" + title + ", coverImg="
				+ coverImg + ", count=" + count + ", score=" + score
				+ ", author=" + author + ", brief=" + brief + ", publishDate="
				+ publishDate + ", children=" + children + "]";
	}
	
	


	
}
