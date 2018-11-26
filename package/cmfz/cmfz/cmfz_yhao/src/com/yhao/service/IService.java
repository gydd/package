package com.yhao.service;

import java.util.List;

public interface IService<T> {
	
	   void addItem(T t);
	   
	   void modifyItem(T t);
	   
	   void dropItem(T t);
	   
	   T queryItem(T t);
	   
	   List<T> queryItems();
}
