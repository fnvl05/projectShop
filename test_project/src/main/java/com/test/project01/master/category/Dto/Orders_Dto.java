package com.test.project01.master.category.Dto;

import java.sql.Date;

public class Orders_Dto {
	private int orderNum;
	private String userId;
	private String orderRec;
	private String orderPhone1;
	private String orderPhone2;
	private String userAddr1;
	private String userAddr2;
	private String userAddr3;
	private Date orderDate;
	private String delivery;
	private String itemName;
	private String itemImg;
	

	public int getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getOrderRec() {
		return orderRec;
	}
	public void setOrderRec(String orderRec) {
		this.orderRec = orderRec;
	}
	public String getOrderPhone1() {
		return orderPhone1;
	}
	public void setOrderPhone1(String orderPhone1) {
		this.orderPhone1 = orderPhone1;
	}
	public String getOrderPhone2() {
		return orderPhone2;
	}
	public void setOrderPhone2(String orderPhone2) {
		this.orderPhone2 = orderPhone2;
	}
	public String getUserAddr1() {
		return userAddr1;
	}
	public void setUserAddr1(String userAddr1) {
		this.userAddr1 = userAddr1;
	}
	public String getUserAddr2() {
		return userAddr2;
	}
	public void setUserAddr2(String userAddr2) {
		this.userAddr2 = userAddr2;
	}
	public String getUserAddr3() {
		return userAddr3;
	}
	public void setUserAddr3(String userAddr3) {
		this.userAddr3 = userAddr3;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public String getDelivery() {
		return delivery;
	}
	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getItemImg() {
		return itemImg;
	}
	public void setItemImg(String itemImg) {
		this.itemImg = itemImg;
	}
	
	
	
	

}
