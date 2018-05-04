package com.phone.controller;

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

import com.google.code.kaptcha.Constants;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.phone.controller.base.BaseController;
import com.phone.pojo.Product;
import com.phone.pojo.Product_attr_biz;
import com.phone.pojo.Product_picture;
import com.phone.pojo.User;
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

//		List<Product> list = productService.queryProductByName(pname, Integer.valueOf(headnum),Integer.valueOf(endnum));
		List<Map<Object,Object>> list = productService.queryProductByName(pname, Integer.valueOf(headnum),Integer.valueOf(endnum));
		
		logger.info(list.size());

		return list;
	}
	
	/**
	 * 跳转到产品详情页
	 * @return
	 */
	@RequestMapping(value = "/toProductDetail")
	public String toProductDetail(int pid,Model model) {
		
		model.addAttribute("pid", pid);
//		model.addAttribute("product", product); 
//		model.addAttribute("pictureList", pictureList); 
//		model.addAttribute("attrList", attrList); 
		
		return "product/productDetail";
	}
	
	@RequestMapping(value ="/queryProductDetail")
	@ResponseBody
	public Object qryProductDetail(int pid){
		
		//查询产品信息
		Product product = productService.qryProductByPid(pid);
		
		return product;
		
	}
	
	@RequestMapping(value ="/queryProductPicture")
	@ResponseBody
	public Object qryProductPicture(int pid){
		
		//查询产品图片信息
		List<Product_picture> product_picture = productService.qryAllProductPictureByPid(pid);
		
		return product_picture;
		
	}
	
	@RequestMapping(value ="/queryProductAttr")
	@ResponseBody
	public Object qryProductAttr(int pid){
		
		//查询产品属性信息
		List<Product_attr_biz> attrList =  productService.qryProductAttrByPid(pid);
		return attrList;
	}
	
	@RequestMapping(value = "/buyProduct",produces = "application/json; charset=utf-8")
	@ResponseBody
	public Object buyProduct(int pid,HttpServletRequest request){
		
		HttpSession session = request.getSession();
		
		User user = (User) session.getAttribute("user");
		JsonObject json = new JsonObject();
		
		if(user==null){
			json.addProperty("code","-1");
		}else{
			//将用户的加入购物车
			int uid = user.getUid();
			int result = productService.insertCart(uid,pid);
			json.addProperty("code",result);
		}
		return new Gson().toJson(json);			
	}
	
	
	/**
	 * 跳转到购物车
	 * @return
	 */
	@RequestMapping(value = "/toCart")
	public String toCart(HttpServletRequest request,Model model) {
		
		HttpSession session = request.getSession();
		
		User user = (User) session.getAttribute("user");
		
		model.addAttribute("uid", user.getUid());
		
		
		
		return "product/Cart";
	}
	
	/**
	 * 查询当前用户的购物车
	 * @return
	 */
	@RequestMapping(value = "/qryCartByUid",produces = "application/json; charset=utf-8")
	@ResponseBody
	public Object qryCartByUid(int uid,HttpServletRequest request,Model model) {
		
		//查询当前用户购物车信息
		List<Map<Object, Object>> cartList = productService.qryCartByUid(uid);
		
		
		return cartList;
	}
	
	/**
	 * 删除购物车条目
	 * @return
	 */
	@RequestMapping(value="/deleteCartOpt",produces = "application/json; charset=utf-8")
	@ResponseBody
	public Object updateStock(int uid,int pid,int cid){
		
		int result = productService.deleteCartOpt(uid,pid,cid);
		
		JsonObject json = new JsonObject();
		
		json.addProperty("result",result);
		
		return new Gson().toJson(json);			
		
	}
	
	/**
	 * 减少购物车条目
	 * @return
	 */
	@RequestMapping(value="/reduceCartOpt",produces = "application/json; charset=utf-8")
	@ResponseBody
	public Object reduceCartOpt(int uid,int pid,int cid){
		
		int result = productService.updateCartOpt(uid,pid,cid);
		
		JsonObject json = new JsonObject();
		
		json.addProperty("result",result);
		return new Gson().toJson(json);			
	}
	
	
	//增加购物车
	@RequestMapping(value="/addCart",produces = "application/json; charset=utf-8")
	@ResponseBody
	public Object addCart(int uid,int pid,int cid){
		
		int result = productService.addCartOpt(uid,pid,cid);
		
		JsonObject json = new JsonObject();
		
		json.addProperty("result",result);
		return new Gson().toJson(json);			
	}
	
	//移除购物车当条条目
	@RequestMapping(value="/removeCartOpt",produces = "application/json; charset=utf-8")
	@ResponseBody
	public Object removeCartOpt(int uid,int pid,int cid){
		
		int result = productService.removeCartOpt(uid,pid,cid);
		
		JsonObject json = new JsonObject();
		
		json.addProperty("result",result);
		return new Gson().toJson(json);			
	}
	
	
}

