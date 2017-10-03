package com.phone.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.phone.dao.StudentMapper;
import com.phone.pojo.Student;
import com.phone.service.StudentService;

@Service("studentService")
public class StudentImpl implements StudentService {
	
	@Resource
	private StudentMapper studentdao;
	
	public Student querybyid(int id){
		return studentdao.selectByPrimaryKey(id);
	}
}
