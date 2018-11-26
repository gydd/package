package com.ssm.combine.DAO;

import java.util.List;

import com.ssm.combine.model.ProductAds;

public interface ProductAdsMapper {
	int deleteRejectedList();
    int deleteByPrimaryKey(Integer id);

    int insert(ProductAds record);

    int insertSelective(ProductAds record);

    ProductAds selectByPrimaryKey(Integer id);
    List<ProductAds> selectByStatus(Integer status);
    List<ProductAds> selectNotByStatus(Integer status);
    List<ProductAds> selectByTop(Integer status);
    List<ProductAds> selectBysellerID(String sellerID);

    int updateByPrimaryKeySelective(ProductAds record);
    int updateStatusAutomatically();

    int updateByPrimaryKey(ProductAds record);
}