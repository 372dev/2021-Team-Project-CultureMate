package com.kh.cm.member.model.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.kh.cm.member.model.vo.Member;

@Mapper
public interface MemberDao {

	Member selectMember(@Param("userId") String userId); 
	
	int validate(String userId);
	
	int insertMember(Member member); // 회원가입
	
	int updateMember(Member member); // 회원정보 수정
	
	int updatePassword(@Param("userId") String userId, @Param("password") String password);

	int deleteMember(String userId);
	
	String findId(@Param("userName") String userName, @Param("email") String email, @Param("phone") String phone); // 아이디 찾기
	
	void updateTempPwd(String userId, String email, String phone, @Param("tempPwd") String password);

	void updateAuthkey(Member member); // 인증키 수정

	Member checkAuth(String authkey); // 이메일 인증코드 확인

	int successAuthkey(Member member); // 인증 후 계정 활성화

}
