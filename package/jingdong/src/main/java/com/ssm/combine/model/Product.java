package com.ssm.combine.model;

import java.sql.Timestamp;
//商品的详细信息
public class Product {
	private int id;
	private int class_id;
	private String name;
	private String sellerID;
	private double price;
	private int total;
	private int selled;
	private Timestamp registerTime;
	private Timestamp updateTime;
	private	byte[] picture;
	private int isBlack;
	
	public int getClass_id() {
		return class_id;
	}

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public double getPrice() {
		return price;
	}

	public Timestamp getRegisterTime() {
		return registerTime;
	}

	public int getSelled() {
		return selled;
	}

	public String getSellerID() {
		return sellerID;
	}

	public int getTotal() {
		return total;
	}

	public Timestamp getUpdateTime() {
		return updateTime;
	}

	public void setClass_id(int class_id) {
		this.class_id = class_id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public void setRegisterTime(Timestamp registerTime) {
		this.registerTime = registerTime;
	}

	public void setSelled(int selled) {
		this.selled = selled;
	}

	public void setSellerID(String sellerID) {
		this.sellerID = sellerID;
	}

	public void setTotal(int total) {
		this.total = total;
	}
	public void setUpdateTime(Timestamp updateTime) {
		this.updateTime = updateTime;
	}

	@Override
	public String toString() {
		return "id:" + id + "\t" + "name:" + name + "\t" + "total:" + total
				+ "\t" + "selled:" + selled;
	}

	public byte[] getPicture() {
		return picture;
	}

	public void setPicture(byte[] picture) {
		this.picture = picture;
	}

	public int getIsBlack() {
		return isBlack;
	}

	public void setIsBlack(int isBlack) {
		this.isBlack = isBlack;
	}
}
