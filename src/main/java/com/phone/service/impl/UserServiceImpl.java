package com.phone.service.impl;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.jws.soap.SOAPBinding.Use;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.phone.dao.UserMapper;
import com.phone.pojo.User;
import com.phone.service.UserService;
import com.phone.util.MD5;
import com.phone.util.TimeUtil;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Resource
	private UserMapper usermapper;

	// 登录校验
	public int checkLogin(String username, String pwd, int status, HttpServletRequest request) {

		/**
		 * 输入的是手机号
		 */

		User user = null;

		if (status == 0) {
			user = usermapper.selectUserByPhone(username);
			if (user == null) {
				return 0;
			} else if (!user.getPassword().equals(MD5.MD5Encode(pwd))) {
				// 密码错误
				return -1;
			} else {
				HttpSession session = request.getSession();
				session.setAttribute("user", user);
				// 更新登录时间

				user.setLoginTime(TimeUtil.getTimestamp());

				usermapper.updateByPrimaryKey(user);
				return 1;
			}
			/**
			 * 输入的是用户名
			 */
		} else {
			user = usermapper.selectUserByusername(username);
			if (user == null) {
				return 0;
			} else if (!user.getPassword().equals(MD5.MD5Encode(pwd))) {
				// 密码错误
				return -1;
			} else {
				HttpSession session = request.getSession();
				session.setAttribute("user", user);
				// 更新登录时间
				user.setLoginTime(TimeUtil.getTimestamp());

				usermapper.updateByPrimaryKey(user);
				return 1;
			}
		}
	}

}
