package com.ssm.combine.DAO;

import java.util.List;

import org.springframework.stereotype.Component;

import com.ssm.combine.model.Favorite;

@Component("favoriteMapper")
public interface FavoriteMapper {
    int deleteByPrimaryKey(Integer id);
    
    int deleteByFavID(Integer favID,Integer type,String customerID);

    int insert(Favorite record);
    int insertSelective(Favorite record);

    Favorite selectByPrimaryKey(Integer id);
    Favorite isExist(Integer id,int type,String customerID);
    
    List<Favorite> selectProductFav(String customerID);
    List<Favorite> selectShopFav(String customerID);

    int updateByPrimaryKeySelective(Favorite record);

    int updateByPrimaryKey(Favorite record);
}