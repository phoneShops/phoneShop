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
	}
	
	
	@RequestMapping(value="/checkRegister",produces = "application/json; charset=utf-8")
	@ResponseBody
	public Object checkRegister(User user){
		JsonObject json = new JsonObject();
		
		logger.info(user.getCard());
		logger.info(user.getCid());
		logger.info(user.getPid());
		logger.info(user.getPhone());
		logger.info(user.getAddress());
		
		int i = userService.registerUser(user);
		
		if(i==1){
			json.addProperty("msg","用户名已经存在"); 
		}else if(i==2){
			json.addProperty("msg","注册出错"); 
		}else if(i==-1){
			json.addProperty("msg","电话号码已经存在"); 
		}else{
			json.addProperty("msg","0"); 
		}
//		String username,String phone,int province,int city,String card,String detail
		return new Gson().toJson(json);			
		
	}
}