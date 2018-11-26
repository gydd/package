package com.ssm.combine.model;

public class Cart {
    private Integer id;

    private Integer productID;

    private String productName;

    private Double productPrice;

    //合计
    private Integer amount;
    //产品总数
    private Integer productTotal;
    //卖出的产品数量
    private Integer productSelled;

    private String customerID;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getProductID() {
        return productID;
    }

    public void setProductID(Integer productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName == null ? null : productName.trim();
    }

    public Double getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(Double productPrice) {
        this.productPrice = productPrice;
    }

    public Integer getProductTotal() {
        return productTotal;
    }

    public void setProductTotal(Integer productTotal) {
        this.productTotal = productTotal;
    }

    public Integer getProductSelled() {
        return productSelled;
    }

    public void setProductSelled(Integer productSelled) {
        this.productSelled = productSelled;
    }

    public String getCustomerID() {
        return customerID;
    }

    public void setCustomerID(String customerID) {
        this.customerID = customerID == null ? null : customerID.trim();
    }

	@Override
	public String toString() {
		return "id:"+id+"/tname"+productName;
	}

	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}
    
}