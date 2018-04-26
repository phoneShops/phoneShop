package com.phone.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.phone.dao.ProductMapper;
import com.phone.dao.Product_TypeMapper;
import com.phone.dao.Product_pictureMapper;
import com.phone.pojo.Product;
import com.phone.pojo.Product_Type;
import com.phone.pojo.Product_picture;
import com.phone.pojo.bean.productBean;
import com.phone.service.ProductService;

@Service("productService")
public class ProductServiceImpl  implements ProductService{
	
	@Resource
	private Product_TypeMapper product_TypeMapper;
	
	@Resource
	private ProductMapper productMapper;
	
	@Resource
	private Product_pictureMapper product_pictureMapper;
	

	//根据前台出入的进行查询
	public List<Map<Object,Object>> queryProductByName(String name, int headnum, int endnum) {
		
		//最后返回的产品信息
		List<Map<Object,Object>> listbean = new ArrayList<Map<Object,Object>>();
		
		List<Product_Type> type_list =   product_TypeMapper.queryAllProductType();
		
		int status = 0;
		//初始化种类id
		int typeid = 0;
		for (int i = 0; i < type_list.size(); i++) {
			if(type_list.get(i).getTypeName().equals(name)){
				status = 1;
				 typeid = Integer.valueOf(type_list.get(i).getTypeId());
				break;
			}else{
				continue;
			}
		}
		 //状态是1代表是根据产品类型查询
		if(status==1){
			
			List<Map<Object,Object>> product_list =  queryProductByType(typeid, headnum, endnum);
			
			//产品表中查询了不为空时，进行图片地址查询
			if(!product_list.isEmpty()){
				for (int i = 0; i < product_list.size(); i++) {
					//获得产品pid
					int pid = ((Product) product_list.get(i)).getPid();
					List<Product_picture> addresslist = product_pictureMapper.selectProductPicture(pid);
					String address = addresslist.get(0).getPrAddress();
					Map<Object, Object> map = new HashMap<>();
					map.put("product",product_list.get(i));
					map.put("address",address);
					listbean.add(map);
				}
			}
			return listbean;
			
		}
		return null;
	}
	
	/**
	 * 查询所有的产品种类
	 */
	public List<Product_Type> queryAllProductType() {
		return product_TypeMapper.queryAllProductType();
	}
	
	
	/**
	 * 根据产品类型进行查询
	 */
	public List<Map<Object,Object>> queryProductByType(int type,int headnum,int endnum){
		
		return productMapper.queryProductByType(type, headnum, endnum);
	}



}
