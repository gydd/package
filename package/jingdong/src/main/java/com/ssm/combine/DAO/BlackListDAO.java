package com.ssm.combine.DAO;

import java.util.List;

import com.ssm.combine.model.BlackList;

public interface BlackListDAO {
	public int insetIntoBlackList(BlackList blackList);
	public List<BlackList> selectBlackLists();
	public List<BlackList> selectCustomerBlackLists();
	public List<BlackList> selectsellerBlackLists();
	public int deleteBlackList(BlackList blackList);//return BlackId
}
