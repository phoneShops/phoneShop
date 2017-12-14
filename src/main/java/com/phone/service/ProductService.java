package com.phone.service;

import java.util.List;

import com.phone.pojo.Product;
import com.phone.pojo.Product_Type;

public interface ProductService {

	public List<Product> queryProductByName(String pname,int headnum,int endnum);
	
	public List<Product_Type> queryAllProductType();
	
	public List<Product> queryProductByType(int type,int headnum,int endnum);
}
