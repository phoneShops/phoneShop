package com.phone.pojo.bean;

import com.phone.pojo.Product;
import com.phone.pojo.Product_attr_biz;

public class productBean {

	private Product product;

	private String address;

	private Product_attr_biz product_attr_biz;

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Product_attr_biz getProduct_attr_biz() {
		return product_attr_biz;
	}

	public void setProduct_attr_biz(Product_attr_biz product_attr_biz) {
		this.product_attr_biz = product_attr_biz;
	}

	
	public productBean() {
		// TODO Auto-generated constructor stub
	}
	
	public productBean(Product product, String address, Product_attr_biz product_attr_biz) {
		super();
		this.product = product;
		this.address = address;
		this.product_attr_biz = product_attr_biz;
	}

	@Override
	public String toString() {
		return "productBean [product=" + product + ", address=" + address + ", product_attr_biz=" + product_attr_biz
				+ "]";
	}
	
}
