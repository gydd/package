package com.ssm.combine.model;

import java.sql.Timestamp;

public class Seller {
	private int id;
	private String nickName;
	private String realName;
	private String password;
	private String telePhone;
	private String id_card;
	private int isBlack;
	private Timestamp registerTime;
	private Timestamp updateTime;
	private byte[] idPicture;
	
	@Override
	public String toString() {
		return "nickName:"+nickName+"\trealName:"+realName+"\tTel:"+telePhone;
	}
	
	public int getId() {
		return id;
	}
	public String getId_card() {
		return id_card;
	}
	public int getIsBlack() {
		return isBlack;
	}
	public String getNickName() {
		return nickName;
	}
	public String getPassword() {
		return password;
	}
	public String getRealName() {
		return realName;
	}
	public Timestamp getRegisterTime() {
		return registerTime;
	}
	public String getTelePhone() {
		return telePhone;
	}
	public Timestamp getUpdateTime() {
		return updateTime;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setId_card(String id_card) {
		this.id_card = id_card;
	}
	public void setIsBlack(int isBlack) {
		this.isBlack = isBlack;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public void setRegisterTime(Timestamp registerTime) {
		this.registerTime = registerTime;
	}
	public void setTelePhone(String telePhone) {
		this.telePhone = telePhone;
	}
	public void setUpdateTime(Timestamp updateTime) {
		this.updateTime = updateTime;
	}

	public byte[] getIdPicture() {
		return idPicture;
	}

	public void setIdPicture(byte[] idPicture) {
		this.idPicture = idPicture;
	}
}
