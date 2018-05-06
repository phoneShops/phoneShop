package com.phone.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.phone.controller.base.BaseController;
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
}
