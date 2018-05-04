package com.phone.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.phone.controller.base.BaseController;
import com.phone.pojo.User;
import com.phone.pojo.UserAddress;
import com.phone.service.UserAddressService;

@Controller
@RequestMapping("/address")
public class AddressController  extends BaseController{
	
	@Resource
	private UserAddressService userAddressService;
	
	/**
	 * 查询用户所有地址
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/qryUserAddress",produces = "application/json;charset=utf-8")
	@ResponseBody
	public  String qryUserAddress(HttpServletRequest request){
		
		HttpSession session = request.getSession();
		
		User user = (User) session.getAttribute("user");
		
		JSONObject json = new JSONObject();
		String page = null;
		
		if(user!=null){
			
			int uid = user.getUid();
			
			List<UserAddress> list = new ArrayList<UserAddress>();
			Map<String, Object> map = new HashMap<String, Object>();
			try {
				list = userAddressService.qryUserAddress(uid);
				json.put("rows", list);
				page = json.toString();
			} catch (Exception e) {
			}
		}
		return page;
	}
	
	
	@RequestMapping(value = "/updateAddress",produces = "application/json;charset=utf-8")
	@ResponseBody
	public  Object updateAddress(int cid,int uid,String name,String phone,String detail,int province,int city,String status ){
		
		int result = userAddressService.updateAddress(cid,uid,name,phone,detail,province,city,status);
		
		JsonObject json = new JsonObject();
		
		json.addProperty("code",result);
		return new Gson().toJson(json);			
	}
	
	
	@RequestMapping(value = "/addAddress",produces = "application/json;charset=utf-8")
	@ResponseBody
	public  Object addAddress(HttpServletRequest request,String name,String phone,String detail,int province,int city,String status ){
		
		HttpSession session = request.getSession();
		
		User user = (User) session.getAttribute("user");
		int uid = 0; 
		if(user!=null){
			 uid = user.getUid();
		}
		int result = userAddressService.addAddress(uid,name,phone,detail,province,city,status);
		
		JsonObject json = new JsonObject();
		json.addProperty("code",result);
		return new Gson().toJson(json);			
	}
	
	
	@RequestMapping(value = "/delAddress",produces = "application/json;charset=utf-8")
	@ResponseBody
	public  Object delAddress(HttpServletRequest request,int uid,int cid){
		
		int result = userAddressService.delAddress(uid,cid);
		
		JsonObject json = new JsonObject();
		json.addProperty("code",result);
		return new Gson().toJson(json);			
	}
	
}
