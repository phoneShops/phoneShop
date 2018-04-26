package com.phone.service;

import java.util.List;
import java.util.Map;

import com.phone.pojo.User;


public interface ManagerService {
	//根据索引返回员工信息
		public List<User> queryUser(Map<String, Object> map);
		//返回员工总数
		public int queryUserCount(Map<String, Object> map);
}
