package com.phone.dao;

import java.util.List;

import com.phone.pojo.Product_comment;

public interface Product_commentMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table product_comment
     *
     * @mbggenerated Mon May 21 21:51:40 CST 2018
     */
    int deleteByPrimaryKey(Integer comid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table product_comment
     *
     * @mbggenerated Mon May 21 21:51:40 CST 2018
     */
    int insert(Product_comment record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table product_comment
     *
     * @mbggenerated Mon May 21 21:51:40 CST 2018
     */
    int insertSelective(Product_comment record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table product_comment
     *
     * @mbggenerated Mon May 21 21:51:40 CST 2018
     */
    Product_comment selectByPrimaryKey(Integer comid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table product_comment
     *
     * @mbggenerated Mon May 21 21:51:40 CST 2018
     */
    int updateByPrimaryKeySelective(Product_comment record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table product_comment
     *
     * @mbggenerated Mon May 21 21:51:40 CST 2018
     */
    int updateByPrimaryKey(Product_comment record);
    
    List<Product_comment> qryCommByPid(int pid);
}