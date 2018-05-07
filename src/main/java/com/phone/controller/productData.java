package com.phone.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.phone.pojo.Product;
import com.phone.pojo.Product_attr_biz;
import com.phone.service.ProductDataService;

@Controller
@RequestMapping("/productData")
public class productData {

 @Autowired
 private ProductDataService proservice; 

 //ajax查询产品表
 @RequestMapping(value = "/ProductList",produces = "application/json;charset=utf-8")
	public @ResponseBody String queryProduct(Integer pageIndex,Integer pageSize,String key){
		JSONObject json = new JSONObject();
		String page = null;
		List<Product> list = new ArrayList<Product>();
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map.put("pageIndex", (pageIndex-1)*pageSize);
			map.put("pageSize", pageSize);
			map.put("key", key);
			list = proservice.queryProduct(map);
			int count =proservice.queryProductCount(map);
			json.put("rows", list);
			json.put("total", count);	
			page = json.toString();
		} catch (Exception e) {
		}
		return page;
	}
 
 
//ajax查询产品详情表
@RequestMapping(value = "/loadMession",produces = "application/json;charset=utf-8")
	public @ResponseBody String queryMession(Integer pageIndex,Integer pageSize,String key){
		JSONObject json = new JSONObject();
		String page = null;
		List<Product_attr_biz> list = new ArrayList<Product_attr_biz>();
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map.put("pageIndex", (pageIndex-1)*pageSize);
			map.put("pageSize", pageSize);
			map.put("key", key);
			System.out.println(map);
			list = proservice.queryMession(map);
			int count =proservice.queryMessionCount(map);
			json.put("rows", list);
			json.put("total", count);	
			page = json.toString();
			System.out.println(page);
		} catch (Exception e) {
		}
		return page;
	}
 
}
