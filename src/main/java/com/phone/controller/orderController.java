package com.phone.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.phone.controller.base.BaseController;
import com.phone.pojo.Product_b_order;
import com.phone.pojo.User;
import com.phone.service.ProductService;

@Controller
@RequestMapping("/order")
public class orderController extends BaseController {
	
	@Resource
	private ProductService productService;
	
	/**
	 * 查询当前用户的购物车
	 * @return
	 */
	@RequestMapping(value = "/qryOrderByUid",produces = "application/json; charset=utf-8")
	@ResponseBody
	public Object qryOrderByUid(String array,HttpServletRequest request,Model model) {
		
		//查询用户选中购物车的订单信息
		List<Map<Object, Object>> ordertList = productService.showOrderByCid(array);
		
		
		return ordertList;
	}
	
	
	/**
	 *处理订单
	 */
	@RequestMapping(value = "/checkOrder",produces = "application/json; charset=utf-8")
	@ResponseBody
	public Object checkOrder(String order_id,String arrayCid,String priceTotal,int address_id,Model model){
		
//		HttpSession session = request.getSession();
//		User user = (User) session.getAttribute("user");
		
		int result =  productService.inserOrder(order_id,arrayCid,priceTotal,address_id);
		
		
		JsonObject json = new JsonObject();
		
		json.addProperty("result",result);
		return new Gson().toJson(json);			
	}
	
	
	/**
	 * 跳转到支付界面
	 */
	@RequestMapping(value = "/toPay")
	public Object toPay(String order_id,String priceTotal,Model model){
		
		model.addAttribute("order_id",order_id);
		model.addAttribute("priceTotal",priceTotal);
		
		return "product/Pay";
	}
	
	//查询交易中的订单
	@RequestMapping(value = "/qryOrder")
	@ResponseBody
	public Object qryOrder(HttpServletRequest request){
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		
		List<Map<Object, Object>> ordertList = new ArrayList<>();
		
		if(user!=null){
			ordertList = productService.qryOrder(user.getUid());
		}
		
		return ordertList;
	}
	
	//查询已经完成的订单
	@RequestMapping(value = "/qryFinishOrder")
	@ResponseBody
	public Object qryFinishOrder(HttpServletRequest request){
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		
		List<Map<Object, Object>> ordertList = new ArrayList<>();
		
		if(user!=null){
			//查询已经完成的订单信息
			ordertList = productService.qryFinishOrder(user.getUid());
		}
		
		return ordertList;
	}
	
	//增加订单的评论
	@RequestMapping(value = "/addComment",produces = "application/json; charset=utf-8")
	@ResponseBody
	public Object addComment(int oid,int uid,String comment,HttpServletRequest request){
		
		int result =  productService.addComment(uid,oid,comment);
		
		
		JsonObject json = new JsonObject();
		
		json.addProperty("result",result);
		return new Gson().toJson(json);			
	}
	
	 	//在跳到支付界面前查询所有金额
		@RequestMapping(value = "/toPayFee",produces = "application/json; charset=utf-8")
		@ResponseBody
		public Object toPayFee(String order_id,HttpServletRequest request){
			
			double  allPrice =  productService.qryByOrder_id(order_id);
			
			
			JsonObject json = new JsonObject();
			
			json.addProperty("allPrice",allPrice);
			return new Gson().toJson(json);			
		}
}
