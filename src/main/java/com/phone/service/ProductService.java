package com.phone.service;

import java.util.List;

import com.phone.pojo.Product;

public interface ProductService {

	List<Product> queryProductByPname(String pname,String headnum,String endnum);
}
