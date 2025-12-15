package com.mall.shop.bean;

import java.util.Date;

/**
 * 订单
 */
public class Orders {

	/** 订单Id */
	private Integer id;
	/** 订单编号 */
	private String orderNo;
	/** 产品Id */
	private Integer productId;
	/** 用户Id */
	private Integer userId;
	/** 产品数量 */
	private Integer num;
	/** 产品总价 */
	private Double price;
	/** 订单创建时间 */

	private Date createTime;
	/** 订单状态 */
	private Integer status;
	/** 收货地址 */
	private String address;
	/** 收件人电话 */
	private String phone;
	/** 收件人姓名 */
	private String realname;

	private Product product;

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getId() {
		return this.id;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public String getOrderNo() {
		return this.orderNo;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public Integer getProductId() {
		return this.productId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	public Integer getNum() {
		return this.num;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Double getPrice() {
		return this.price;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Date getCreateTime() {
		return this.createTime;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddress() {
		return this.address;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public String getRealname() {
		return this.realname;
	}

	public Orders(String orderNo, Integer productId, Integer userId, Integer num, Double price, Date createTime, Integer status, String address, String phone, String realname) {
		this.orderNo = orderNo;
		this.productId = productId;
		this.userId = userId;
		this.num = num;
		this.price = price;
		this.createTime = createTime;
		this.status = status;
		this.address = address;
		this.phone = phone;
		this.realname = realname;
	}

	public Orders() {
	}

	public Orders(Integer id, String orderNo, Integer productId, Integer userId, Integer num, Double price, Date createTime, Integer status, String address, String phone, String realname) {
		this.id = id;
		this.orderNo = orderNo;
		this.productId = productId;
		this.userId = userId;
		this.num = num;
		this.price = price;
		this.createTime = createTime;
		this.status = status;
		this.address = address;
		this.phone = phone;
		this.realname = realname;
	}

}
