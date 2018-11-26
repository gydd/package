package com.ssm.combine.DAO;

import java.util.Date;
import java.util.List;

import com.ssm.combine.model.shopAds;

public interface shopAdsMapper {
	int deleteByPrimaryId(Integer id);
    int insert(shopAds record);
    int insertSelective(shopAds record);
    
    int deleteRejectedList();
    int updateStatus(int id,int status,Date updateDate);
    int updateStatusAutomatically();
    
    shopAds selectSellerAds(int shopID);
    shopAds selectById(int id);
    List<shopAds> selectByStatus(int status);
    List<shopAds> selectNotByStatus(int status);
    List<shopAds> selectByTop(int count);
}