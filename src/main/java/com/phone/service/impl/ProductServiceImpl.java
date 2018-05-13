package com.phone.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.phone.dao.CartMapper;
import com.phone.dao.CityMapper;
import com.phone.dao.ProductMapper;
import com.phone.dao.Product_TypeMapper;
import com.phone.dao.Product_attr_bizMapper;
import com.phone.dao.Product_pictureMapper;
import com.phone.pojo.Cart;
import com.phone.pojo.Product;
import com.phone.pojo.Product_Type;
import com.phone.pojo.Product_attr_biz;
import com.phone.pojo.Product_picture;
import com.phone.service.ProductService;
import com.phone.util.CreateOrderId;

@Service("productService")
public class ProductServiceImpl  implements ProductService{
	
	@Resource
	private Product_TypeMapper product_TypeMapper;
	
	@Resource
	private ProductMapper productMapper;
	
	@Resource
	private Product_pictureMapper product_pictureMapper;
	
	@Resource
	private Product_attr_bizMapper product_attr_bizMapper;
	
	@Resource
	private CartMapper cartmapper;
	

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

	/**
	 * 根据产品id查询
	 */
	public Product qryProductByPid(int pid) {
		
		return	productMapper.selectByPrimaryKey(pid);
	}

	/**
	 * 查询产品图片信息
	 */
	public List<Product_picture> qryProductPictureByPid(int pid) {
		return product_pictureMapper.selectProductPicture(pid);
	}

	@Override
	public List<Product_attr_biz> qryProductAttrByPid(int pid) {
		return product_attr_bizMapper.qryProductAttrByPid(pid);
	}

	@Override
	public List<Product_picture> qryAllProductPictureByPid(int pid) {
		return product_pictureMapper.qryAllProductPictureByPid(pid);
	}

	//加入购物车
	public int insertCart(int uid, int pid) {
		
		//查询库存是否大于0
		Product product = productMapper.selectByPrimaryKey(pid);
		
		//库存大于0，先加入购物车，库存再进行减1
		
		int count = product.getStock();
		
		if(count>0){
			//获取订单号
			String order_id = CreateOrderId.getId();
			
			Cart cart = new Cart(null, order_id, uid, pid, 1);
			int result = cartmapper.insertSelective(cart);
			if(result==1){
				//对库存进行减1
				--count;
				product.setStock(count);
				int stock_result = productMapper.updateByPrimaryKeySelective(product);
				
				if(stock_result==1){
					//添加成功
					return 2;
				}else{
					//修改库存失败
					return 3;
				}
			}else{
				//加入购物车失败
				return 4;
			}
		}else{
			//库存不够
			return 1;
		}
	}

	//查询当前用户的购物车
	public List<Map<Object, Object>> qryCartByUid(int uid) {
		
		//最后返回的bean
		List<Map<Object,Object>> listbean = new ArrayList<Map<Object,Object>>();
		
		List<Cart> cartlist =  cartmapper.qryCartByUid(uid);
		
		for (int i = 0; i < cartlist.size(); i++) {
			//获得商品id
			int pid = cartlist.get(i).getPid();
			
			//查询产品信息
			Product product =  productMapper.selectByPrimaryKey(pid);
			
			//查询产品图片信息
			List<Product_picture> picturelist =  product_pictureMapper.selectProductPicture(pid);
			
			String address = "";
			
			if(!picturelist.isEmpty()){
				address = picturelist.get(0).getPrAddress();
			}
			
			Map<Object, Object> map = new HashMap<>();
			map.put("product",product);
			map.put("address",address);
			map.put("cart",cartlist.get(i));
			listbean.add(map);
		}
		
		return listbean;
	}


	//删除购物车的条数 0:删除购物车失败 -1：库存更新失败 1：成功
	public int deleteCartOpt(int uid, int pid, int cid) {
		
		int result = cartmapper.deleteByPrimaryKey(cid);
		
		//删除购物车成功
		if(result==1){
			
//			库存加1
			int resultFlag = this.updateProductStock(pid,1);
			
			if(resultFlag==1){
				return 1;
			}else{
				return -1;
			}
		}
		return 0;
	}

	//库存更新 第二个是正数则加1  否则减1
	private int updateProductStock(int pid, int i) {
		
		//查询产品
		Product product = productMapper.selectByPrimaryKey(pid);
		
		int result = 0;
		
		if(i>0&&product!=null){
			product.setStock(product.getStock()+1);
			result = productMapper.updateByPrimaryKeySelective(product);
		}else{
			product.setStock(product.getStock()-1);
			result = productMapper.updateByPrimaryKeySelective(product);
		}
		return result;
	}

	//删除条目中的数量
	public int updateCartOpt(int uid, int pid, int cid) {
		
		Cart cart = cartmapper.selectByPrimaryKey(cid);
		
		int result = 0;
		if(cart!=null){
			//购物车更新成功
			cart.setCount(cart.getCount()-1);
			result=  cartmapper.updateByPrimaryKeySelective(cart);
		}
		
		if(result==1){
			//更新库存
			int code = this.updateProductStock(pid, 1);
			if(code==1){
				return 1;
			}
		}
		
		return -1;
	}

	//添加购物车
	public int addCartOpt(int uid, int pid, int cid) {
		
		Product product = productMapper.selectByPrimaryKey(pid);
		
		if(product.getStock()<=0){
			//库存不够
			return -1;
		}else{
			product.setStock(product.getStock()-1);
			
			int result = productMapper.updateByPrimaryKeySelective(product);
			
			if(result==1){
				
				Cart cart =  cartmapper.selectByPrimaryKey(cid);
				
				cart.setCount(cart.getCount()+1);
				
				//更新购物车
				int code = cartmapper.updateByPrimaryKeySelective(cart);
				
				if(code==1){
					return 0;
				}
			}
			//库存更新失败
			return 2;
		}
	}

	//移除单个条目
	public int removeCartOpt(int uid, int pid, int cid) {
		
		//先查询出改条目的数量，并删除，然后再修改库存
		
		Cart cart = cartmapper.selectByPrimaryKey(cid);
		
		int count = cart.getCount();
		
		//删除购物车条目
		int result = cartmapper.deleteByPrimaryKey(cid);
		if(result==1){
			
			Product product = productMapper.selectByPrimaryKey(pid);
			
			product.setStock(product.getStock()+count);
			int code = productMapper.updateByPrimaryKeySelective(product);
			if(code==1){
				//成功移除
				return 1;
			}
		}
		//删除购物车条目失败
		return -1;
	}

	//展示订单信息
	public List<Map<Object, Object>> showOrderByCid(String data) {
		
		//最后返回的bean
		List<Map<Object,Object>> listbean = new ArrayList<Map<Object,Object>>();

		String []array = data.split(",");
		
		//获取订单号
		String order_id = CreateOrderId.getId();
		
		for (int i = 0; i < array.length; i++) {
			//获得cid
			int cid = Integer.valueOf(array[i]);
			
			Cart cart = cartmapper.selectByPrimaryKey(cid);
			
			int pid = cart.getPid();
			
			Product product = productMapper.selectByPrimaryKey(pid);
			
//			//查询产品图片信息
			List<Product_picture> picturelist =  product_pictureMapper.selectProductPicture(pid);
			
			
			Map<Object, Object> map = new HashMap<>();
			map.put("cart",cart);
			map.put("product",product);
			map.put("order_id",order_id);
			map.put("address",picturelist.get(0).getPrAddress());
			//将cid集合 回放进集合
			map.put("data", data);
			
			listbean.add(map);
		}
		
		return listbean;
	}

	//将用户点击下单的加入订单
	public void inserOrder(String order_id, String arrayCid, String priceTotal) {
		
		String[] array = arrayCid.split(",");
		
		for (int i = 0; i < array.length; i++) {
			int cid = Integer.valueOf(array[0]);
			
			
			
			
		}
		
		
	}


}
