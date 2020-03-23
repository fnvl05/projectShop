package com.test.project01.order.dto;

public class OrderDetailJoinDto {
	private String itemImg;
	private String itemName;
	private String price;
	private String quantity;
	private int itemNum;
	private int orderNum;
	 
	public OrderDetailJoinDto() {}

	public OrderDetailJoinDto(String itemImg, String itemName, String price, String quantity, int itemNum,
			int orderNum) {
		super();
		this.itemImg = itemImg;
		this.itemName = itemName;
		this.price = price;
		this.quantity = quantity;
		this.itemNum = itemNum;
		this.orderNum = orderNum;
	}

	public String getItemImg() {
		return itemImg;
	}

	public void setItemImg(String itemImg) {
		this.itemImg = itemImg;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getQuantity() {
		return quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}

	public int getItemNum() {
		return itemNum;
	}

	public void setItemNum(int itemNum) {
		this.itemNum = itemNum;
	}

	public int getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}
	
	
}
