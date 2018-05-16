package com.phone.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.google.code.kaptcha.Constants;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.phone.controller.base.BaseController;
import com.phone.pojo.User;
import com.phone.pojo.UserAddress;
import com.phone.service.ProductService;
import com.phone.service.UserService;

@Controller
@RequestMapping("/user")
public class userController  extends BaseController{
	
	@Resource
	private UserService userService;
	
	@Resource
	private ProductService productService;
	
	/**
	 * 测试
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/test")
	public Object totest(HttpServletRequest request ){
		
		return "user/test";
	}
	
	
	/**
	 * 跳转到主页
	 */
	@RequestMapping(value="/toHome")
	public Object toHome(HttpServletRequest request,Model model ){
		
		
		//查询热销产品 并放入集合中
		List<Map<Object, Object>> list =   productService.qryHotProduct();
		
		model.addAttribute("hotList", list);
		
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
	 * 跳转到密码修改界面
	 * @return
	 */
	@RequestMapping(value="/topassword")
	public Object topassword(){
		return "user/password";
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
		return new Gson().toJson(json);			
		
	}
	
	@RequestMapping(value="/checkPassword",produces = "application/json; charset=utf-8")
	@ResponseBody
	public Object checkPassword(String pwd,String newpwd,HttpServletRequest request){
		
		JsonObject json = new JsonObject();
//		logger.info(pwd);
//		logger.info(newpwd);
		int i = userService.updatePass(pwd, newpwd, request);
		if(i==-1){
			json.addProperty("msg", "您的旧密码错误！");
		}else if(i==0){
			json.addProperty("msg","系统错误");
		}else{
			json.addProperty("msg",i);
		}
		return new Gson().toJson(json);			
	}
	
	//用户注销
	@RequestMapping(value="/userLog_On")
	public Object userLog_On(HttpServletRequest request){
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		return "user/Home";
	}
	
	//调到个人订单和地址管理界面
	@RequestMapping(value="/toPerson_Order")
	public Object toPerson_Order(){
		return "user/PersonOrder";
	}
	
	//查询个人信息
	@RequestMapping(value = "/qryUserMessage",produces = "application/json;charset=utf-8")
	@ResponseBody
	public  String qryUserMessage(HttpServletRequest request){
		
		HttpSession session = request.getSession();
		
		User user = (User) session.getAttribute("user");
		
		int uid = user.getUid();
		String username = user.getUsername();
		String phone = user.getPhone();
		String card = user.getCard();
		
		
		JsonObject json = new JsonObject();
		
		json.addProperty("uid",uid);
		json.addProperty("username",username);
		json.addProperty("phone",phone);
		json.addProperty("card",card);
		
		return  new Gson().toJson(json);
	}
	
	//更新个人信息
	@RequestMapping(value="/updatePersonMsg",produces = "application/json; charset=utf-8")
	@ResponseBody
	public Object updatePersonMsg(HttpServletRequest request,int uid,String username,String phone,String card){
		
		JsonObject json = new JsonObject();
		
		HttpSession session = request.getSession();
		
		User user = (User) session.getAttribute("user");
		
		user.setUsername(username);
		user.setPhone(phone);
		user.setCard(card);
		
		
		int result = userService.updatePersonMsg(user);
		
		json.addProperty("result",result);
		return new Gson().toJson(json);			
	}
	
	/**
	 * 跳转到订单页
	 */
	@RequestMapping(value="/toOrder")
	public Object toOrder(HttpServletRequest request ,String[] array,Model model){
		List<String> lists = new ArrayList<>();
		for (int i = 0; i < array.length; i++) {
			lists.add(array[i]);
		}
		model.addAttribute("array",new Gson().toJson(lists));
		
		return "product/Order";
	}
	
}
