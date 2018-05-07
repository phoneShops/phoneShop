package com.phone.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.phone.controller.base.BaseController;

@Controller
@RequestMapping("/ViewManage")
public class ViewController extends BaseController{
	private  ModelAndView model = new ModelAndView();
	@RequestMapping(value="/toViewTop")
	public Object toHome1(HttpServletRequest request ){
		return "manage/top";
	}
	@RequestMapping(value="/toViewLeft")
	public Object toHome2(HttpServletRequest request ){
		return "manage/left";
	}
	@RequestMapping(value="/toViewIndex")
	public Object toHome3(HttpServletRequest request ){
		return "manage/index";
	}
	//用户信息管理控制
	@RequestMapping("/ManagerMession")
	public ModelAndView toStaff(){
		model.setViewName("manage/userMession");
		return model;
	}
	//跳转到产品数据表
	@RequestMapping("/productData")
	public ModelAndView toProductData(){
		model.setViewName("manage/productData");
		return model;
	}
}
