package com.phone.service;

import java.util.List;
import java.util.Map;

import com.phone.pojo.Product;
import com.phone.pojo.Product_Type;
import com.phone.pojo.Product_attr_biz;
import com.phone.pojo.Product_picture;

public interface ProductService {

	public List<Map<Object,Object>> queryProductByName(String pname,int headnum,int endnum);
	
	public List<Product_Type> queryAllProductType();

	public Product qryProductByPid(int pid);

	public List<Product_picture> qryProductPictureByPid(int pid);

	public List<Product_attr_biz> qryProductAttrByPid(int pid);

	public List<Product_picture> qryAllProductPictureByPid(int pid);

	public int insertCart(int uid, int pid);

	public List<Map<Object, Object>> qryCartByUid(int uid);

	public int deleteCartOpt(int uid, int pid, int cid);

	public int updateCartOpt(int uid, int pid, int cid);

	public int addCartOpt(int uid, int pid, int cid);

	public int removeCartOpt(int uid, int pid, int cid);

	public List<Map<Object, Object>> showOrderByCid(String data);

	public int inserOrder(String order_id, String arrayCid, String priceTotal,int address_id);

	public List<Map<Object, Object>> qryOrder(Integer uid);

	public List<Map<Object, Object>> qryFinishOrder(Integer uid);

	public int addComment(int uid, int oid, String comment);

	public double qryByOrder_id(String order_id);

	public List<Map<Object, Object>> qryComment(int pid);

	public List<Map<Object, Object>> qryHotProduct();

	public List<Map<Object, Object>> queryProductByTypeId(int type_id);

	public int confirmOrder(int uid, int oid);
}
