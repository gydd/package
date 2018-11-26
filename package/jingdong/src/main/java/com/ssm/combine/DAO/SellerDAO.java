package com.ssm.combine.DAO;

import java.sql.Timestamp;
import java.util.List;

import com.ssm.combine.model.Seller;

public interface SellerDAO {
	public Seller selectSeller(String id);//check id
	public List<Seller> selectSellerByName(String keyWord);//check id
	public Seller selectSellerName(String id,String password);//return name
	public List<Seller> selectAllSellers();
	public void insertIntoSeller(Seller seller);//register
	public void updateSeller(String id,String newpassword);//forget password
	public void updateTime(String id,Timestamp date);
	public void changeToBlackStatue(String id);
	public void cancelFromBlackStatue(String id);
	public int deleteFromSeller(String id);
	public List<Seller> getBlackList();
}
