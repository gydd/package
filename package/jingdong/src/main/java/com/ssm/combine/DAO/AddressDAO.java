package com.ssm.combine.DAO;

import java.util.List;

import com.ssm.combine.model.Address;

public interface AddressDAO {
	public int insertIntoAddress(Address address);
	public int deleteAddress(int id);
	public int updateAddress(Address address);
	public List<Address> selectAddress(String telePhone);
	public int updateToDefaultAddress(int id);
	public int updatefromDefaultAddress(int id,String telePhone);
	public Address selectDefaultAddress(String telePhone);
}
