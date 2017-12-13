package com.phone.service;

import java.util.List;

import com.phone.pojo.Product;
import com.phone.pojo.Product_Type;

public interface ProductService {

	public List<Product> queryProductByName(String pname,String headnum,String endnum);
	
	public List<Product_Type> queryAllProductType();
	
	public List<Product> queryProductByType(int type,String headnum,String endnum);
}
