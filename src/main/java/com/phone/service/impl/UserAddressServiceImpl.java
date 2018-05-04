package com.phone.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.phone.dao.CityMapper;
import com.phone.dao.ProvinceMapper;
import com.phone.dao.UserAddressMapper;
import com.phone.pojo.City;
import com.phone.pojo.Province;
import com.phone.pojo.UserAddress;
import com.phone.service.UserAddressService;

@Service("userAddressService")
public class UserAddressServiceImpl  implements UserAddressService{

	@Resource
	private UserAddressMapper userAddressMapper;
	
	@Resource
	private ProvinceMapper provinceMapper;
	
	@Resource
	private CityMapper cityMapper;
	
	public List<UserAddress> qryUserAddress(int uid) {
		return userAddressMapper.selectByUid(uid);
	}

	
	public int updateAddress(int cid, int uid, String name, String phone, String detail, int province, int city,String status) {
		
		
		//判断status是否是0：默认 如果是默认，则将其他地址置为 非默认：1
		
		if(status.equals("0")){
			//将其他的置为1
			int result = userAddressMapper.updateToUnStatus(uid);
			
			if(result>=1){
				
				//翻译省名
				Province provinces = provinceMapper.selectProvinceById(province);
				//翻译城市名
				City citys =  cityMapper.seleCityById(city);
				
				String proname = provinces.getPname();
				String cityname = citys.getCname();
				
				UserAddress ua = new UserAddress(cid, uid, name, phone, proname, cityname, detail, status);
				
				int code = userAddressMapper.updateByPrimaryKeySelective(ua);
				
				if(code==1){
					//修改成功
					return 0;
				}else{
					//修改失败
					return 1;
				}
			}
			//修改其他地址出错
			return -1;
		}
		return 0;
	}

}
