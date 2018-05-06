package com.phone.service.impl;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.jws.soap.SOAPBinding.Use;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jsoup.select.Evaluator.IsEmpty;
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

	//用户注册
	public int registerUser(User user) {
		
		if(usermapper.selectUserByPhone(user.getPhone())!=null){
			return -1;
		}else if(usermapper.selectUserByusername(user.getUsername())!=null){
			return 1;
		}
		
		user.setPassword(MD5.MD5Encode("666666"));
		user.setRegTime(TimeUtil.getTimestamp());
		user.setStatus(0);
		int i = usermapper.insertSelective(user);
		if(i!=1){
			return 2;
			
		}
		return 0;
	}

	/**
	 * 修改用户密码
	 */
	public int updatePass(String pwd, String newpwd,HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		User user = (User)session.getAttribute("user");
		
		if(!user.getPassword().equals(MD5.MD5Encode(pwd))){
			return -1;
		}else{
			//加密保存
			user.setPassword(MD5.MD5Encode(newpwd));
			int i = usermapper.updateByPrimaryKeySelective(user);
			if(i==1){
				return 1;
			}
    			return 0;
		}
		
	}

	//查询单个用户
	public User qryUser(int uid) {
		return usermapper.selectByPrimaryKey(uid);
	}

	//更新一个用户信息
	public int updatePersonMsg(User user) {
		return usermapper.updateByPrimaryKey(user);
	}

}
