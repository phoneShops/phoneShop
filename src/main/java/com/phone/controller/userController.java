package com.phone.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.phone.controller.base.BaseController;

@Controller
@RequestMapping("/user")
public class userController  extends BaseController{
	
	/**
	 * 跳转到登录界面
	 * @return
	 */
	@RequestMapping(value="/tologin")
	public Object tologin(){
		return "user/Login";
	}
}
