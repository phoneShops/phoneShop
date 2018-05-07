package com.phone.service;

import java.util.List;
import java.util.Map;

import com.phone.pojo.Product;
import com.phone.pojo.Product_attr_biz;


public interface ProductDataService {
	//根据索引返回用户信息
			public List<Product> queryProduct(Map<String, Object> map);
	//返回用户总数
			public int queryProductCount(Map<String, Object> map);
	//返回产品详情信息
			public List<Product_attr_biz> queryMession(Map<String, Object> map);
	//返回产品总数
			public int queryMessionCount(Map<String, Object> map);
}
