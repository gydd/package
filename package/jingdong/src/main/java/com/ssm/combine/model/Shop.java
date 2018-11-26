package com.ssm.combine.model;

import java.sql.Timestamp;
//店铺信息
public class Shop {
	private int id;
	private String name;
	//描述
	private String description;
	private String sellerID;
	private Timestamp registerTime;
	private Timestamp updateTime;
	private	byte[] picture;
	//支付状态
	private int applyStatus;
	//显示状态
	private int blackStatus;
	//原因，我猜是加如黑名单的原因
	private String reason;
	
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getSellerID() {
		return sellerID;
	}
	public void setSellerID(String sellerID) {
		this.sellerID = sellerID;
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
	public byte[] getPicture() {
		return picture;
	}
	public void setPicture(byte[] picture) {
		this.picture = picture;
	}
	@Override
	public String toString() {
		return "id:"+id+"\t"
				+"description:"+description
				+"\treason"+reason;
	}
	public int getBlackStatus() {
		return blackStatus;
	}
	public void setBlackStatus(int blackStatus) {
		this.blackStatus = blackStatus;
	}
	public int getApplyStatus() {
		return applyStatus;
	}
	public void setApplyStatus(int applyStatus) {
		this.applyStatus = applyStatus;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
}
