package com.phone.service;

import javax.servlet.http.HttpServletRequest;

import com.phone.pojo.User;

public interface UserService {
		public int checkLogin(String username,String pwd,int status,HttpServletRequest request);
		
		public int registerUser(User user);
		
		public int updatePass(String pwd,String newpwd,HttpServletRequest request);

		public User qryUser(int uid);

		public int updatePersonMsg(User user);
}
