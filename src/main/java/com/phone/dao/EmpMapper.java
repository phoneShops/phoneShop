package com.phone.dao;

import com.phone.pojo.Emp;

public interface EmpMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table emp
     *
     * @mbggenerated Mon May 15 11:11:38 CST 2017
     */
    int deleteByPrimaryKey(Integer empno);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table emp
     *
     * @mbggenerated Mon May 15 11:11:38 CST 2017
     */
    int insert(Emp record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table emp
     *
     * @mbggenerated Mon May 15 11:11:38 CST 2017
     */
    int insertSelective(Emp record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table emp
     *
     * @mbggenerated Mon May 15 11:11:38 CST 2017
     */
    Emp selectByPrimaryKey(Integer empno);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table emp
     *
     * @mbggenerated Mon May 15 11:11:38 CST 2017
     */
    int updateByPrimaryKeySelective(Emp record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table emp
     *
     * @mbggenerated Mon May 15 11:11:38 CST 2017
     */
    int updateByPrimaryKey(Emp record);
}