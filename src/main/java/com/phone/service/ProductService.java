package com.phone.service;

import java.util.List;
import java.util.Map;

import com.phone.pojo.Product;
import com.phone.pojo.Product_Type;

public interface ProductService {

	public List<Map<Object,Object>> queryProductByName(String pname,int headnum,int endnum);
	
	public List<Product_Type> queryAllProductType();
}
