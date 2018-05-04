package com.phone.service;

import java.util.List;

import com.phone.pojo.UserAddress;

public interface UserAddressService {

	List<UserAddress> qryUserAddress(int uid);

	int updateAddress(int cid, int uid, String name, String phone, String detail, int province, int city, String status);

	int addAddress(int uid,String name, String phone, String detail, int province, int city, String status);

	int delAddress(int uid, int cid);

}
