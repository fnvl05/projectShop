package com.test.project01.master.category.Dto;

public class Item_OrderDetail_Dto {
	private String result;
	private String itemName;
	private int orderNum;
	private int odNum;
	
	public int getOdNum() {
		return odNum;
	}
	public void setOdNum(int odNum) {
		this.odNum = odNum;
	}
	public int getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	
	
}
