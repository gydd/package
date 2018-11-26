package com.ssm.combine.model;
//order->订单
public class Order {
    private Integer id;

    private Integer productID;

    private String productName;

    private Integer productCount;

    private Double totalPrice;
    private Double adminPrice;

    private String customerID;
    //卖家id
    private String sellerID;

    private Integer status;

    private Integer addressID;

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

    public Integer getProductCount() {
        return productCount;
    }

    public void setProductCount(Integer productCount) {
        this.productCount = productCount;
    }

    public Double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getCustomerID() {
        return customerID;
    }

    public void setCustomerID(String customerID) {
        this.customerID = customerID == null ? null : customerID.trim();
    }

    public String getSellerID() {
        return sellerID;
    }

    public void setSellerID(String sellerID) {
        this.sellerID = sellerID == null ? null : sellerID.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getAddressID() {
        return addressID;
    }

    public void setAddressID(Integer addressID) {
        this.addressID = addressID;
    }

	@Override
	public String toString() {
		return "id"+id+"\t"+"name"+productName;
	}

	public Double getAdminPrice() {
		return adminPrice;
	}

	public void setAdminPrice(Double adminPrice) {
		this.adminPrice = adminPrice;
	}
    
}