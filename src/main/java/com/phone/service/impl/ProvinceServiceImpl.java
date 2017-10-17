package com.phone.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.phone.dao.CityMapper;
import com.phone.dao.ProvinceMapper;
import com.phone.pojo.City;
import com.phone.pojo.Province;
import com.phone.service.ProvinceService;

@Service("provinceService")
public class ProvinceServiceImpl  implements ProvinceService{

	@Resource
	private ProvinceMapper proviceMapper;
	
	@Resource
	private CityMapper cityMapper;
	
	public List<Province> selectAllProvince() {
		
		return proviceMapper.selectAllProvince();
	}

	
	public List<City> selectAllCity(int pid) {
		return cityMapper.selectAllCity(pid);
	}
	
}
