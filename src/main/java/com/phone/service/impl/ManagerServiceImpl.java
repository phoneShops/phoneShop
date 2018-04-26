package com.phone.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.phone.dao.UserMapper;
import com.phone.pojo.User;
import com.phone.service.ManagerService;

@Service
public class ManagerServiceImpl implements ManagerService{
	@Autowired
	private UserMapper usermapper;
	public List<User> queryUser(Map<String, Object> map) {
		
		return usermapper.queryUser(map);
	}

	@Override
	public int queryUserCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return usermapper.queryUserCount(map)
				;
	}

	

}
