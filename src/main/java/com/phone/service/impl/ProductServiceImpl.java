package com.phone.service.impl;

import java.text.SimpleDateFormat;
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
import com.phone.dao.Product_b_orderMapper;
import com.phone.dao.Product_bh_orderMapper;
import com.phone.dao.Product_commentMapper;
import com.phone.dao.Product_pictureMapper;
import com.phone.dao.UserMapper;
import com.phone.pojo.Cart;
import com.phone.pojo.Product;
import com.phone.pojo.Product_Type;
import com.phone.pojo.Product_attr_biz;
import com.phone.pojo.Product_b_order;
import com.phone.pojo.Product_bh_order;
import com.phone.pojo.Product_comment;
import com.phone.pojo.Product_picture;
import com.phone.pojo.User;
import com.phone.service.ProductService;
import com.phone.util.CreateOrderId;
import com.phone.util.TimeUtil;

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
	
	@Resource
	private Product_b_orderMapper product_b_orderMapper;
	
	@Resource
	private Product_bh_orderMapper product_bh_orderMapper;
	
	@Resource
	private Product_commentMapper product_commentMapper;
	
	@Resource
	private UserMapper userMapper;

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
	public int inserOrder(String order_id, String arrayCid, String priceTotal,int address_id) {
		
		int result = 0;
		
		String[] array = arrayCid.split(",");
		
		for (int i = 0; i < array.length; i++) {
			int cid = Integer.valueOf(array[i]);
			
			//获得购物车信息
			Cart cart =  cartmapper.selectByPrimaryKey(cid);
			
			Product product =  new Product();
			
			if(cart!=null){
				product = productMapper.selectByPrimaryKey(cart.getPid());
				double price = product.getPrice()*cart.getCount();
				
				Product_b_order order = new Product_b_order();
				
				order.setOrderId(order_id);
				order.setUid(cart.getUid());
				order.setPid(cart.getPid());
				order.setAddressid(address_id);
				order.setCout(cart.getCount());
				order.setPrice(price);
				
				order.setOrderTime(TimeUtil.getTimestamp());

				order.setOrderStatus(0);
				
				int code = product_b_orderMapper.insert(order);
				
				//如果订单加入成功，购物车则删除
				if(code==1){
					cartmapper.deleteByPrimaryKey(cart.getCid());
					result = 1;
				}
			}
		}
		
		
		return result;
	}

	//查询交易中的订单
	public List<Map<Object, Object>> qryOrder(Integer uid) {
		
		//最后返回的bean
		List<Map<Object,Object>> listbean = new ArrayList<Map<Object,Object>>();
		
		List<Product_b_order>  orderlist = product_b_orderMapper.qryOrder(uid);
		
		for (int i = 0; i < orderlist.size(); i++) {
			//循环遍历订单集合
			Product_b_order  order = orderlist.get(i);
			
			Product product = productMapper.selectByPrimaryKey(order.getPid());
			
			List<Product_picture> picturelist = product_pictureMapper.selectProductPicture(order.getPid());
			
			double allPrice = order.getCout()*product.getPrice();
			
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String dateString = formatter.format(order.getOrderTime());
			
			Map<Object, Object> map = new HashMap<>();
			map.put("order",order);
			map.put("product",product);
			map.put("allprice",allPrice);
			map.put("orderTime",dateString);
			map.put("address",picturelist.get(0).getPrAddress());
			
			listbean.add(map);
		}
				
		return listbean;
	}

	//查询已经完成的订单
	public List<Map<Object, Object>> qryFinishOrder(Integer uid) {
		
			//最后返回的bean
				List<Map<Object,Object>> listbean = new ArrayList<Map<Object,Object>>();
				
				List<Product_bh_order>  orderlist = product_bh_orderMapper.qryFinishOrder(uid);
				
				for (int i = 0; i < orderlist.size(); i++) {
					//循环遍历订单集合
					Product_bh_order  order = orderlist.get(i);
					
					Product product = productMapper.selectByPrimaryKey(order.getPid());
					
					List<Product_picture> picturelist = product_pictureMapper.selectProductPicture(order.getPid());
					
//					double allPrice = order.getCout()*product.getPrice();
					
					SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					String dateString = formatter.format(order.getFinishTime());
					
					Map<Object, Object> map = new HashMap<>();
					map.put("order",order);
					map.put("product",product);
					map.put("allprice",order.getPrice());
					map.put("orderTime",dateString);
					map.put("address",picturelist.get(0).getPrAddress());
					
					listbean.add(map);
				}
						
				return listbean;
	}

	//插入产品评论
	public int addComment(int uid, int oid, String comment) {
		
		//先插入评论表 然后 删除该条订单，移到历史表中
		
		Product_b_order order =  product_b_orderMapper.selectByPrimaryKey(oid);
		
		
		Product_comment comm = new Product_comment();
		
		if(order!=null){
			comm.setCommentmsg(comment);
			comm.setUid(uid);
			comm.setPid(order.getPid());
			comm.setCommenttime(TimeUtil.getTimestamp());
		}
		
		int result_first = product_commentMapper.insert(comm);

		if(result_first==1){
			
			Product_bh_order bhorder  =new Product_bh_order();
			
			bhorder.setCout(order.getCout());
			bhorder.setOrderId(order.getOrderId());
			bhorder.setPid(order.getPid());
			bhorder.setPrice(order.getPrice());
			bhorder.setUid(order.getUid());
			bhorder.setFinishTime(TimeUtil.getTimestamp());
			
			//插入历史表
			int result_second = product_bh_orderMapper.insert(bhorder);
			
			if(result_second>=1){
				
				int result_thread = product_b_orderMapper.deleteByPrimaryKey(oid);
				return result_thread;
			}
			return result_second;
		}
		return result_first;
	}

	//查询订单总价
	public double qryByOrder_id(String order_id) {
		
		List<Product_b_order>  orderlist = product_b_orderMapper.qryByOrderId(order_id);
		
		double allPrice = 0;
		
		if(orderlist!=null){
			
			for (int i = 0; i < orderlist.size(); i++) {
				
				Product_b_order order = orderlist.get(i);
				
				allPrice += order.getPrice()*order.getCout();
			}
		}
		return allPrice;
	}

	//产品详情 查询评论信息
	public List<Map<Object, Object>> qryComment(int pid) {
		
		//最后返回的bean
		List<Map<Object,Object>> listbean = new ArrayList<Map<Object,Object>>();
		
		List<Product_comment>list =  product_commentMapper.qryCommByPid(pid);
		
		if(list!=null){
			
			for (int i = 0; i < list.size(); i++) {
				
				int uid = list.get(i).getUid();
				User user =  userMapper.selectByPrimaryKey(uid);
				
				if(user!=null){
					
					SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					String dateString = formatter.format(list.get(i).getCommenttime());
					
					
					Map<Object, Object> map = new HashMap<>();
					map.put("comment",list.get(i));
					map.put("username",user.getUsername());
					map.put("commtime",dateString);
					listbean.add(map);
				}
			}
		}
		return listbean;
	}

	@Override
	public List<Map<Object, Object>> qryHotProduct() {
		
		//最后返回的bean
		List<Map<Object,Object>> listbean = new ArrayList<Map<Object,Object>>();
		
		//查询热销产品
		List<Product> list =  productMapper.qryHotProduct();
		
		if(list!=null){
			
			for (int i = 0; i < list.size(); i++) {
				
				Product product = list.get(i);
				
				List<Product_picture> picturelist = product_pictureMapper.selectProductPicture(product.getPid());
			 
				Map<Object, Object> map = new HashMap<>();
				
				if(picturelist.size()>0){
					map.put("product",product);
					map.put("picture",picturelist.get(0));
					listbean.add(map);
				}
			}
		}
		return listbean;
	}

	//通过产品类型 查询产品
	public List<Map<Object, Object>> queryProductByTypeId(int type_id) {
		
		
		//最后返回的bean
		List<Map<Object,Object>> listbean = new ArrayList<Map<Object,Object>>();
				
		List<Product> list =  productMapper.qryProductByTypeId(type_id);
		
		if(list!=null){
			
			for (int i = 0; i < list.size(); i++) {
				
				Product product = list.get(i);
				
				List<Product_picture> picturelist = product_pictureMapper.selectProductPicture(product.getPid());
			 
				Map<Object, Object> map = new HashMap<>();
				if(picturelist.size()>0){
					map.put("product",product);
					map.put("picture",picturelist.get(0));
				}
				listbean.add(map);
			}
			
		}
		
		return listbean;
	}

	//用户确认收款
	public int confirmOrder(int uid, int oid) {
		
		Product_b_order order =  product_b_orderMapper.selectByPrimaryKey(oid);
		
		order.setOrderStatus(3);
		return product_b_orderMapper.updateByPrimaryKey(order);
	}
}
