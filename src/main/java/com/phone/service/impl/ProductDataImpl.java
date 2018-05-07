package com.phone.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.phone.dao.ProductData11;
import com.phone.dao.Product_attr_bizMapper;
import com.phone.pojo.Product;
import com.phone.pojo.Product_attr_biz;
import com.phone.service.ProductDataService;

@Service
public class ProductDataImpl implements ProductDataService{

	@Autowired
	private ProductData11 productdata; 
	@Autowired
	private Product_attr_bizMapper proab; 
	//查询产品
	public List<Product> queryProduct(Map<String, Object> map) {
		return productdata.queryProduct(map);
	}
	//查询总数--分页用
	public int queryProductCount(Map<String, Object> map) {		
		return productdata.queryProductCount(map);
	}
	@Override
	public List<Product_attr_biz> queryMession(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return proab.queryMession(map);
	}
	@Override
	public int queryMessionCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return proab.queryMessionCount(map);
	}

	
}
