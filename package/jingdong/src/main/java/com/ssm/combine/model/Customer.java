package com.ssm.combine.model;

import java.sql.Timestamp;

public class Customer {
	private int id;
	private String name;
	private String password;
	private String telephone;
	private String address;
	private String e_mail;
	private int isBlack;
	private Timestamp  registerTime;
	private Timestamp  updateTime;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getE_mail() {
		return e_mail;
	}
	public void setE_mail(String e_mail) {
		this.e_mail = e_mail;
	}
	public int getIsBlack() {
		return isBlack;
	}
	public void setIsBack(int isBlack) {
		this.isBlack = isBlack;
	}
	
	@Override
	public String toString() {
		return "ID:"+id+"\tname:"+name;
	}
	public Timestamp getRegisterTime() {
		return registerTime;
	}
	public void setRegisterTime(Timestamp registerTime) {
		this.registerTime = registerTime;
	}
	public Timestamp getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Timestamp updateTime) {
		this.updateTime = updateTime;
	}
	
}
