package com.phone.dao;

import com.phone.pojo.Product_picture;

public interface Product_pictureMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table product_picture
     *
     * @mbggenerated Wed Apr 25 09:35:13 CST 2018
     */
    int deleteByPrimaryKey(Integer prId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table product_picture
     *
     * @mbggenerated Wed Apr 25 09:35:13 CST 2018
     */
    int insert(Product_picture record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table product_picture
     *
     * @mbggenerated Wed Apr 25 09:35:13 CST 2018
     */
    int insertSelective(Product_picture record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table product_picture
     *
     * @mbggenerated Wed Apr 25 09:35:13 CST 2018
     */
    Product_picture selectByPrimaryKey(Integer prId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table product_picture
     *
     * @mbggenerated Wed Apr 25 09:35:13 CST 2018
     */
    int updateByPrimaryKeySelective(Product_picture record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table product_picture
     *
     * @mbggenerated Wed Apr 25 09:35:13 CST 2018
     */
    int updateByPrimaryKey(Product_picture record);
}