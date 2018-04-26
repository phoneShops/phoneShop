package com.phone.dao;

import java.util.List;
import java.util.Map;


import com.phone.pojo.User;

public interface UserMapper {
	
	
	/**
	 *通过用户名查询用户 
	 */
	User selectUserByusername(String username);
	
	/**
	 * 通过手机号查询用户
	 */
	User selectUserByPhone(String phone);
	
    int deleteByPrimaryKey(Integer uid);
    int insert(User record);
    int insertSelective(User record);
    User selectByPrimaryKey(Integer uid);
    int updateByPrimaryKeySelective(User record);
    int updateByPrimaryKey(User record);
    
    /**
     * 更新登陆时间
     */
    
    int updateLoginTime(User user);
    
  //返回用户总数
  	public int queryUserCount(Map<String, Object> map);
  //根据索引返回用户信息
  	public List<User> queryUser(Map<String, Object> map);
    
}