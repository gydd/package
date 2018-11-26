package com.ssm.combine.model;

public class BlackList {
	private int id;
	private String blackId;
	private int type;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getBlackId() {
		return blackId;
	}

	public void setBlackId(String blackId) {
		this.blackId = blackId;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "ID:"+id+"\tBlackID："+blackId;
	}
	
}
