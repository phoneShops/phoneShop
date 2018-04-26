package com.phone.controller;

import java.util.ArrayList;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.phone.controller.base.BaseController;
import com.phone.pojo.User;
import com.phone.service.ManagerService;



@Controller
@RequestMapping("/mannage")
public class mannageController{
	
	@Autowired
	private ManagerService Manservice;
	
	@RequestMapping("/toMannageLogin")
	public Object toMannageLogin(){
		return "manage/mannageLogin" ;
	}
	
	@RequestMapping("/mannageMain")
	public Object toMannageMain(){
		return "manage/mannageMain" ;
	}
	
	@RequestMapping(value = "/userList",produces = "application/json;charset=utf-8")
	public @ResponseBody String queryUser(Integer pageIndex,Integer pageSize,String key){
		JSONObject json = new JSONObject();
		String page = null;
		List<User> list = new ArrayList<User>();
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			System.out.println("nihao");
			map.put("pageIndex", (pageIndex-1)*pageSize);
			map.put("pageSize", pageSize);
			map.put("key", key);
			list = Manservice.queryUser(map);
			int count =Manservice.queryUserCount(map);
			json.put("rows", list);
			json.put("total", count);
			page = json.toString();
		} catch (Exception e) {
		}
		return page;
	}

}
