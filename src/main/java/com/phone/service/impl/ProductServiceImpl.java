package com.phone.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.phone.pojo.Product;
import com.phone.service.ProductService;

@Service("productService")
public class ProductServiceImpl  implements ProductService{

	public List<Product> queryProductByPname(String pname, String headnum, String endnum) {
		
		
		return null;
	}

}
