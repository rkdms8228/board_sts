package com.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.mapper.UserMapper;
import com.web.vo.UserVo;

@Service
public class UserService {
	
	@Autowired
	private UserMapper userMapper;
	
	//회원가입
	public int join(UserVo userVo) {
		
		//Mapper를 통해서 데이터 저장
		int count = userMapper.join(userVo);
		
		return count;
		
	}
	
	//아이디 중복체크 (회원가입)
	public String idCheck(String id) {

		UserVo userVo = userMapper.idCheck(id);
		
		if(userVo == null) {
			return "success";
		}
		
		return "fail";
		
	}
	
	//로그인
	public UserVo login(UserVo userVo) throws Exception{

		return userMapper.login(userVo);
		
	}

}
