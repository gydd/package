package com.ssm.combine.DAO;

import java.util.List;

import com.ssm.combine.model.Order;

public interface OrderMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Order record);

    int insertSelective(Order record);

    Order selectByPrimaryKey(Integer id);
    List<Order> selectUnpaidByCustomerID(String id);
    List<Order> selectPaidByCustomerID(String id);
    List<Order> selectBySellerID(String id);
    List<Order> selectOrders();

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);
}