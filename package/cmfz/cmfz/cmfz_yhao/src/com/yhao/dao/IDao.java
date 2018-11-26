package com.yhao.dao;

import java.util.List;

public interface IDao <T> {
	
   void insertItem(T t);
   
   void updateItem(T t);
   
   void deleteItem(T t);
   
   T selectItem(T t);
   
   List<T> selectItems();
}
