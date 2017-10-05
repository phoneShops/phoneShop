package com.phone.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.code.kaptcha.Constants;
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
	
	
	/**
	 * 校验登录信息
	 */
	@RequestMapping(value="/checkLogin", produces = "application/json; charset=utf-8")
	@ResponseBody
	public Object checkLogin(String username,String pwd,String code,HttpServletRequest request){
		
		//原始验证码
		String original =(String) request.getSession().getAttribute(Constants.KAPTCHA_SESSION_KEY);
		
		logger.info(username);
		logger.info(pwd);
		logger.info(code);
		logger.info(original);
		
		return null;
		
		
		
	}
}
