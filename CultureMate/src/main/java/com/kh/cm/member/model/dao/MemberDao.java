package com.kh.cm.member.model.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.kh.cm.member.model.vo.Member;

@Mapper
public interface MemberDao {

	Member selectMember(@Param("userId") String userId);
	
	int validate(String userId);
	
	int insertMember(Member member);
	
	int updateMember(Member member);
	
	int deleteMember(String userId);
	
	Member findId(String userName, String email, String phone);
	
	Member findPwd(String userId, String userName, String email, String phone);
	
	int updatePwd(String userId, String password);
	
	void createMember(Member member);

	void updateAuthkey(Member member); // 인증키 수정

	Member checkAuth(String authkey); // 이메일 인증코드 확인

	int successAuthkey(Member member); // 인증 후 계정 활성화

}
