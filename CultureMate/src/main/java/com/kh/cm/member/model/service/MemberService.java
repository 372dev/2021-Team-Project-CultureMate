package com.kh.cm.member.model.service;

import java.util.List;

import com.kh.cm.common.util.PageInfo;
import com.kh.cm.member.model.vo.Member;

public interface MemberService {
	Member login(String userId, String password);
	
	Member findMemberByUserId(String userId);
	
	int saveMember(Member member);
	
	int deleteMember(String userId);
	
	String findId(String userName, String email, String phone);
	
	void findPwd(String userId, String email, String phone) throws Exception;
	
//	void sendMailAndUpdatePwd(Member member);
	
	int changePwd(String userId, String password);

	int validate(String userId);

	void sendMail(Member member) throws Exception;

	Member userAuth(String userId, String authkey);

	int updateMember(Member member, String password);

	// 모든멤버 수 조회
	int memberAllCount();
    
	// 모든 멤버 리스트 조회
	List<Member> getMemberList(PageInfo pageInfopageInfo);
    
	// 관리자페이지에서 멤버조회
	Member findMember(String userId);

	// 관리자페이지에서 멤버정보업데이트
	int adminupdateMember(Member member);

	// 관리자페이지에서 멤버 탈퇴시키기
	int admindeleteMember(String userId);

	// 검색한 수 출력
	int memberSearchCount(String search, String keyword);

	// 검색한 리스트 불러오기
	List<Member> memberSearchList(PageInfo pageInfo);



	



}
