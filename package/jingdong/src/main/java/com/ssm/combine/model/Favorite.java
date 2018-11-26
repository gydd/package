package com.ssm.combine.model;

public class Favorite {
    private Integer id;

    private Integer favID;

    private Integer type;
    
    private Integer amount;

    private String customerID;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getFavID() {
        return favID;
    }

    public void setFavID(Integer favID) {
        this.favID = favID;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getCustomerID() {
        return customerID;
    }

    public void setCustomerID(String customerID) {
        this.customerID = customerID == null ? null : customerID.trim();
    }

	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}    
}