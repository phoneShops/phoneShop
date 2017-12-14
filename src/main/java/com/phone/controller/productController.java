package com.phone.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.phone.controller.base.BaseController;
import com.phone.pojo.Product;
import com.phone.service.ProductService;

@Controller
@RequestMapping("/product")
public class productController extends BaseController {

	@Resource
	private ProductService productService;

	/**
	 * 点击查询商品后的跳转
	 * 
	 * @param sousuo
	 * @return
	 */
	@RequestMapping(value = "/toProduct")
	public Object toProduct(String name) {
		ModelAndView mv = new ModelAndView("/product/product");
		mv.addObject("name", name);
		return mv;
	}

	/**
	 * 查询商品
	 * 
	 * @param pname
	 * @param headnum
	 * @param endnum
	 * @param status:标识
	 *            手机名称还是手机类型
	 * @return
	 */
	@RequestMapping(value = "/queryProduct")
	@ResponseBody
	public Object queryProduct(String pname, String headnum, String endnum) {

		logger.info(pname);
		logger.info(headnum);
		logger.info(endnum);

		List<Product> list = productService.queryProductByName(pname, Integer.valueOf(headnum),
				Integer.valueOf(endnum));
		
		logger.info(list.size());

		return list;
	}

}
