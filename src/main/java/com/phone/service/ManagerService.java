package com.phone.service;

import java.util.List;


import java.util.Map;

import com.phone.pojo.User;


public interface ManagerService {
	//根据索引返回用户信息
		public List<User> queryUser(Map<String, Object> map);
	//返回用户总数
		public int queryUserCount(Map<String, Object> map);
	//修改用户信息
		public int updateUser(User user);
	//修改用户状态
		public int editStatu(Map<String, Object> map);
	//根据员工编码获取员工信息
	public User getUser(String card);
}
