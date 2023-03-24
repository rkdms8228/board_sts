package com.web.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.web.vo.UserVo;

@Mapper
public interface UserMapper {
	
	public int join(UserVo userVo);								//회원정보 저장(회원가입)
	public UserVo idCheck(String id);							//아이디 중복체크 (회원가입)
	public UserVo login(UserVo userVo) throws Exception;		//로그인

}
