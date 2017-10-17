package com.phone.service;

import java.util.List;

import com.phone.pojo.City;
import com.phone.pojo.Province;

public interface ProvinceService {
	
	List<Province> selectAllProvince();
	
	List<City> selectAllCity(int pid);
}
