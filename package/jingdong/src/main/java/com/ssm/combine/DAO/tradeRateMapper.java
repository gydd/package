package com.ssm.combine.DAO;

import com.ssm.combine.model.tradeRate;

public interface tradeRateMapper {
    int insert(tradeRate record);

    int insertSelective(tradeRate record);
    Double selectRate();
    int updateRate(Double rate);
}