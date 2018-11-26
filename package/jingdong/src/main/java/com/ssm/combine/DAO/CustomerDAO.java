package com.ssm.combine.DAO;

import java.sql.Timestamp;
import java.util.List;

import com.ssm.combine.model.Customer;

public interface CustomerDAO {
	public Customer selectCustomer(String id);//check id
	public List<Customer> selectCustomerByName(String keyWord);//check id
	public Customer selectCustomerName(String id,String password);//return name
	public List<Customer> selectAllCustomers();
	public void insertIntoCustomer(Customer customer);//register
	public void updateCustomer(String id,String newpassword);//forget password
	public void updateTime(String id,Timestamp date);
	public int updateCustomerInfo(String id,String name,String address,String email);
	public void changeToBlackStatue(String id);
	public void cancelFromBlackStatue(String id);
	public int deleteFromCustomer(String id);
	public  List<Customer> getBlackList();
}
