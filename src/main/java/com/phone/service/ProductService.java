package com.phone.service;

import java.util.List;
import java.util.Map;

import com.phone.pojo.Product;
import com.phone.pojo.Product_Type;
import com.phone.pojo.Product_attr_biz;
import com.phone.pojo.Product_picture;

public interface ProductService {

	public List<Map<Object,Object>> queryProductByName(String pname,int headnum,int endnum);
	
	public List<Product_Type> queryAllProductType();

	public Product qryProductByPid(int pid);

	public List<Product_picture> qryProductPictureByPid(int pid);

	public List<Product_attr_biz> qryProductAttrByPid(int pid);

	public List<Product_picture> qryAllProductPictureByPid(int pid);
}
