package com.phone.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.code.kaptcha.Constants;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.phone.controller.base.BaseController;
import com.phone.pojo.User;
import com.phone.service.UserService;

@Controller
@RequestMapping("/user")
public class userController  extends BaseController{
	
	@Resource
	private UserService userService;
	
	/**
	 * 跳转到主页
	 */
	@RequestMapping(value="/toHome")
	public Object toHome(HttpServletRequest request ){
		
		logger.info(userService);
		
//		HttpServletRequest request = null;
//		HttpSession session = request.getSession();
//		
//		User u = new User();
//		u.setUid(1);
//		session.setAttribute("user",u);
		
		return "user/Home";
		
		
	}
	
	
	/**
	 * 跳转到登录界面
	 * @return
	 */
	@RequestMapping(value="/tologin")
	public Object tologin(){
		return "user/Login";
	}
	
	/**
	 * 跳转到注册界面
	 * @return
	 */
	@RequestMapping(value="/toregister")
	public Object toregister(){
		return "user/register";
	}
	
	
	/**
	 * 校验登录信息
	 */
	@ResponseBody
	@RequestMapping(value="/checkLogin",produces = "application/json; charset=utf-8")
	public Object checkLogin(String username,String pwd,String code,int status,HttpServletRequest request){
		JsonObject json = new JsonObject();
		
		//原始验证码
		String original =(String) request.getSession().getAttribute(Constants.KAPTCHA_SESSION_KEY);
//		logger.info(username);
//		logger.info(pwd);
//		logger.info(code);
//		logger.info(original);
//		logger.info(status);
		
		if(!code.equals(original)){
			json.addProperty("msg","验证码错误");
			return new Gson().toJson(json);			
		}else{
			
			int result = userService.checkLogin(username, pwd,status,request);
			if(result==0){
				json.addProperty("msg","该用户不存在");
			}else if(result==-1){
				json.addProperty("msg","密码错误");
			}else{
				json.addProperty("msg","success");
			}
			return new Gson().toJson(json);			

		}
		
		
//		logger.info(userService);
		
	}
}
