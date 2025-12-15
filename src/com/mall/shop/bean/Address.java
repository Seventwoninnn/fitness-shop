package com.mall.shop.bean;


/**
 * 收货地址
 */
public class Address {

	/** 地址id */
	private Integer id;
	/** 收件人电话 */
	private String phone;
	/** 收件人地址 */
	private String address;
	/** 收件人姓名 */
	private String name;
	/** 用户id */
	private Integer userId;

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getId() {
		return this.id;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddress() {
		return this.address;
	}


	public void setName(String name) {
		this.name = name;
	}

	public String getName() {
		return this.name;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public Address(String phone, String address, String name, Integer userId) {
		this.phone = phone;
		this.address = address;
		this.name = name;
		this.userId = userId;
	}

	public Address(Integer id, String phone, String address, String name, Integer userId) {
		this.id = id;
		this.phone = phone;
		this.address = address;
		this.name = name;
		this.userId = userId;
	}

	public Address() {
	}
}
