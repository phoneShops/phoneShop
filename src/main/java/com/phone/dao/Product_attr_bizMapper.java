package com.phone.dao;

import java.util.List;
import java.util.Map;

import com.phone.pojo.Product_attr_biz;

public interface Product_attr_bizMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table product_attr_biz
     *
     * @mbggenerated Wed Apr 25 08:18:24 CST 2018
     */
    int deleteByPrimaryKey(Integer pid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table product_attr_biz
     *
     * @mbggenerated Wed Apr 25 08:18:24 CST 2018
     */
    int insert(Product_attr_biz record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table product_attr_biz
     *
     * @mbggenerated Wed Apr 25 08:18:24 CST 2018
     */
    int insertSelective(Product_attr_biz record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table product_attr_biz
     *
     * @mbggenerated Wed Apr 25 08:18:24 CST 2018
     */
    Product_attr_biz selectByPrimaryKey(Integer pid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table product_attr_biz
     *
     * @mbggenerated Wed Apr 25 08:18:24 CST 2018
     */
    int updateByPrimaryKeySelective(Product_attr_biz record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table product_attr_biz
     *
     * @mbggenerated Wed Apr 25 08:18:24 CST 2018
     */
    int updateByPrimaryKey(Product_attr_biz record);

	List<Product_attr_biz> qryProductAttrByPid(int pid);
    
    
  //返回产品总数
  	public int queryMessionCount(Map<String, Object> map);
  //返回产品信息
  	public List<Product_attr_biz> queryMession(Map<String, Object> map);
}