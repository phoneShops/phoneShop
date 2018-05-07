package com.phone.dao;

import java.util.List;
import java.util.Map;

import com.phone.pojo.Product;

public interface ProductData11 {
   //返回产品总数
  	public int queryProductCount(Map<String, Object> map);
  //根据索引返回产品信息
  	public List<Product> queryProduct(Map<String, Object> map);
}
