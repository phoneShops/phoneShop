package com.phone.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.phone.controller.base.BaseController;

@Controller
@RequestMapping("mannage")
public class mannageController extends BaseController{
	@RequestMapping("toMannageLogin")
	public Object toMannageLogin(){
		return "manage/mannageLogin" ;
	}
	@RequestMapping("mannageMain")
	public Object toMannageMain(){
		return "manage/mannageMain" ;
	}
}
