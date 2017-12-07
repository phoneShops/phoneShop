package com.phone.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.phone.controller.base.BaseController;
import com.phone.service.ProductService;

@Controller
@RequestMapping("/product")
public class productController extends BaseController {
	
	@Resource
	private ProductService productService;
	
	/**
	 * 点击查询商品后的跳转
	 * @param sousuo
	 * @return
	 */
	@RequestMapping(value="/toProduct")
	public Object toProduct(String sousuo){
		ModelAndView mv=new ModelAndView("/product/product");  
        mv.addObject("sousuo", sousuo);
		
		return  mv;
	}
	
	/**
	 * 查询商品
	 */
	@RequestMapping(value="/queryProduct")
	@ResponseBody
	public Object queryProduct(String pname,String headnum,String endnum){
		
		System.out.println(pname);
		System.out.println(headnum);
		System.out.println(endnum);
		
		System.out.println(productService);
		
		
		
		return null;
	}
	
}
