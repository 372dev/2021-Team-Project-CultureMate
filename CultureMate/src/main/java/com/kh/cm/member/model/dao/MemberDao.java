package com.kh.cm.member.model.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.kh.cm.member.model.vo.Member;

@Mapper
public interface MemberDao {

	Member selectUserInfoOne(@Param("userId") String username);

	Member selectMember(String userId);
	
	int insertMember(Member member);
	
	int updateMember(Member member);
	
	int deleteMember(String userId);
	
	int insertCardInfo(String userId);
	
	Member findId(String userName, String email, String phone);
	
	Member findPwd(String userId, String userName, String email, String phone);
	
	int updatePwd(String userId, String password);
}
