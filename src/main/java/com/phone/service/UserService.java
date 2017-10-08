package com.phone.service;

import javax.servlet.http.HttpServletRequest;

public interface UserService {
		public int checkLogin(String username,String pwd,int status,HttpServletRequest request);
}
