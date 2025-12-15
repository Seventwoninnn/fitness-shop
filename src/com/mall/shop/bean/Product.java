package com.mall.shop.bean;

import java.math.BigDecimal;

/**
 * 商品
 */
public class Product {

	private Integer id;
	/** 商品名称 */
	private String productName;
	/** 产品简介 */
	private String productDescription;
	/** 价格 */
	private Double productPrice;
	/** 库存 */
	private Integer productStock;
	/** 一级分类 */
	private Integer productFid;
	/** 二级分类 */
	private Integer productCid;
	/** 商品图片 */
	private String productImage;
	private String productFidName;
	private String productCidName;
	/** 商品状态 */
	private Integer productStatus;

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getId() {
		return this.id;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductName() {
		return this.productName;
	}

	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	public String getProductDescription() {
		return this.productDescription;
	}

	public void setProductPrice(Double productPrice) {
		this.productPrice = productPrice;
	}

	public Double getProductPrice() {
		return this.productPrice;
	}

	public void setProductStock(Integer productStock) {
		this.productStock = productStock;
	}

	public Integer getProductStock() {
		return this.productStock;
	}

	public void setProductFid(Integer productFid) {
		this.productFid = productFid;
	}

	public Integer getProductFid() {
		return this.productFid;
	}

	public void setProductCid(Integer productCid) {
		this.productCid = productCid;
	}

	public Integer getProductCid() {
		return this.productCid;
	}

	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}

	public String getProductImage() {
		return this.productImage;
	}

	public void setProductStatus(Integer productStatus) {
		this.productStatus = productStatus;
	}

	public String getProductFidName() {
		return productFidName;
	}

	public void setProductFidName(String productFidName) {
		this.productFidName = productFidName;
	}

	public String getProductCidName() {
		return productCidName;
	}

	public void setProductCidName(String productCidName) {
		this.productCidName = productCidName;
	}

	public Integer getProductStatus() {
		return this.productStatus;
	}

	public Product(String productName, String productDescription, Double productPrice, Integer productStock, Integer productFid, Integer productCid, String productImage, Integer productStatus) {
		this.productName = productName;
		this.productDescription = productDescription;
		this.productPrice = productPrice;
		this.productStock = productStock;
		this.productFid = productFid;
		this.productCid = productCid;
		this.productImage = productImage;
		this.productStatus = productStatus;
	}

	public Product() {
	}

	public Product(Integer id, String productName, String productDescription, Double productPrice, Integer productStock, Integer productFid, Integer productCid, String productImage, Integer productStatus) {
		this.id = id;
		this.productName = productName;
		this.productDescription = productDescription;
		this.productPrice = productPrice;
		this.productStock = productStock;
		this.productFid = productFid;
		this.productCid = productCid;
		this.productImage = productImage;
		this.productStatus = productStatus;
	}

}
