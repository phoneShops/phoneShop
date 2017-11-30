package com.phone.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.phone.controller.base.BaseController;

@Controller
@RequestMapping("/product")
public class productController extends BaseController {
	
	@RequestMapping(value="/toProduct")
	public Object toProduct(String sousuo){
		
		
		logger.info(sousuo);
		
		return  "product/product";
	}
}
