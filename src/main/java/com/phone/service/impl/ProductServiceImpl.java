package com.phone.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.phone.dao.ProductMapper;
import com.phone.dao.Product_TypeMapper;
import com.phone.pojo.Product;
import com.phone.pojo.Product_Type;
import com.phone.service.ProductService;

@Service("productService")
public class ProductServiceImpl  implements ProductService{
	
	@Resource
	private Product_TypeMapper product_TypeMapper;
	
	@Resource
	private ProductMapper productMapper;
	

	//根据前台出入的进行查询
	public List<Product> queryProductByName(String name, int headnum, int endnum) {
		
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
			return this.queryProductByType(typeid, headnum, endnum);
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
	public List<Product> queryProductByType(int type,int headnum,int endnum){
		
		return productMapper.queryProductByType(type, headnum, endnum);
	}



}
