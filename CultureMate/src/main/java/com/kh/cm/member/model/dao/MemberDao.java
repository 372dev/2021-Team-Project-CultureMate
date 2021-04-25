package com.kh.cm.member.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.kh.cm.common.util.PageInfo;
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

	List<Member> selectMemberList(PageInfo pageInfo); // 모든 멤버리스트 조회

	Member allfindMemberDetail(String userId); // 멤버상세조회

	int allfindMemberUpdate(Member member);// 관리자페이지에서 멤버 정보수정

	int admindeleteMember(String userId);

	int selectMemberCount(); // 모든멤버수조회 카운트

	int selectmemSearchCount(@Param("search") String search, @Param("keyword")String keyword);

	List<Member> selectmemSearchList(RowBounds rowBounds, PageInfo pageInfo);

	List<Member> selectRankLsit();

	


	



}
