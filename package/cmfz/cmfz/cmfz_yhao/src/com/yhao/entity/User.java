package com.yhao.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class User implements Serializable {
	private Integer id;
	private String phoneNum;
	private String username;
	private String password;
	private String salt;
	private String dharmName;
	private String gender;
	private String headPic;
	private String provience;
	private String city;
	private String sign;
	private String status;
	private Date date;
	private List<Course> course;
	
}
