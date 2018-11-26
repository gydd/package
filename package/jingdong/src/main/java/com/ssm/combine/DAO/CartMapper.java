package com.ssm.combine.DAO;

import java.util.List;

import com.ssm.combine.model.Cart;

public interface CartMapper {
    int deleteByPrimaryKey(Integer id);
    int deleteByCart(String customerID,int productID);

    int insert(Cart record);

    int insertSelective(Cart record);

    Cart selectByPrimaryKey(Integer id);
    Cart selectByProductID(Integer id);
    Cart isExist(int productID,String customerID);
    List<Cart> selectBycustomerID(String customerID);

    int updateByPrimaryKeySelective(Cart record);

    int updateByPrimaryKey(Cart record);
}