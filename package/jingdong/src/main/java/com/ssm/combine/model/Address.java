package com.ssm.combine.model;

public class Address {
	private int id;
	private String addressName;
	private String customerName;
	private String customerTelephone;
	private String customerId;
	//是否默认
	private int isDefault;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAddressName() {
		return addressName;
	}
	public void setAddressName(String addressName) {
		this.addressName = addressName;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getCustomerTelephone() {
		return customerTelephone;
	}
	public void setCustomerTelephone(String customerTelephone) {
		this.customerTelephone = customerTelephone;
	}
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	@Override
	public String toString() {
		return "id:"+id+"\n"+
				"addresssName"+addressName+"\n"+
				"customerName"+customerName+"\n"+
				"customerTelphone"+customerTelephone+"\n"+
				"customerID"+customerId;
	}
	public int getIsDefault() {
		return isDefault;
	}
	public void setIsDefault(int isDefault) {
		this.isDefault = isDefault;
	}
	
}
