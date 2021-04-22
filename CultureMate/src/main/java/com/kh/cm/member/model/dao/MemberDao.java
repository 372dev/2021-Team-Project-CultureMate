package com.kh.cm.member.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.kh.cm.member.model.vo.Member;

@Mapper
public interface MemberDao {

	int selectMemberCount(); // 모든멤버수조회 카운트

	Member selectMember(@Param("userId") String userId);
	
	int validate(String userId);
	
	int insertMember(Member member);
	
	int updateMember(Member member);
	
	int updatePassword(String userId, String password);

	int deleteMember(String userId);
	
	Member findId(String userName, String email, String phone);
	
	Member findPwd(String userId, String userName, String email, String phone);

	void updateAuthkey(Member member); // 인증키 수정

	Member checkAuth(String authkey); // 이메일 인증코드 확인

	int successAuthkey(Member member); // 인증 후 계정 활성화

	List<Member> selectMemberList(); // 모든 멤버리스트 조회

	Member allfindMemberDetail(String userId); // 멤버상세조회

	int allfindMemberUpdate(Member member);// 관리자페이지에서 멤버 정보수정

	int admindeleteMember(String userId);



	



}
