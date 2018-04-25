package com.phone.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.phone.controller.base.BaseController;

@Controller
@RequestMapping("/ViewManage")
public class ViewController extends BaseController{
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
	
}
