package com.ssm.combine.DAO;

import com.ssm.combine.model.Administrator;

public interface AdministratorDAO {
	public Administrator isCorrect(int id,String password);//login
	public String getName(int id);
	public int modifyPassword(String oldPassword,String newPassword);	
}
