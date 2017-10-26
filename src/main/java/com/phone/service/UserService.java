package com.phone.service;

import javax.servlet.http.HttpServletRequest;

import com.phone.pojo.User;

public interface UserService {
		public int checkLogin(String username,String pwd,int status,HttpServletRequest request);
		
		public int registerUser(User user);
}
