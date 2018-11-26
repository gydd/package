package com.ssm.combine.DAO;

import java.util.List;

import com.ssm.combine.model.Shop;

public interface ShopDAO {
	public int insertIntoShop(Shop shop);
	public int deleteShop(int id);
	public int updateApplyStatus(int id,int status,String reason);
	public int updateBlackStatus(int id,int status);
	public int updateShopDetails(Shop shop);
	public List<Shop> selectShopsByApplyStatus(int status);
	public List<Shop> selectShopsNotByApplyStatus(int status);
	public List<Shop> selectAllShops();
	public Shop selectShopsByShopID(int id);
	public Shop selectShopsBySellerID(String sellerID);
	public List<Shop> selectShopsByName(String name);
	public List<Shop> getBlackList();
	public void changeToBlackStatue(String id);
	public void cancelFromBlackStatue(String id);
}
