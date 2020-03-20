package com.test.project01.order.dto;

public class OrderDetailDto {
	private int odNum;
	private int orderNum;
	private int itemNum;
	private String itemName;
	private String itemImg;
	private int quantity;
	private String result;
	
	public OrderDetailDto() {}

	public OrderDetailDto(int odNum, int orderNum, int itemNum, String itemName, String itemImg, int quantity,
			String result) {
		super();
		this.odNum = odNum;
		this.orderNum = orderNum;
		this.itemNum = itemNum;
		this.itemName = itemName;
		this.itemImg = itemImg;
		this.quantity = quantity;
		this.result = result;
	}

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

	public int getItemNum() {
		return itemNum;
	}

	public void setItemNum(int itemNum) {
		this.itemNum = itemNum;
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

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	
	
}
