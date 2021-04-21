package com.kh.cm.member.model.service;

import java.util.List;

import com.kh.cm.member.model.vo.Member;

public interface MemberService {
	Member login(String userId, String password);
	
	Member findMemberByUserId(String userId);
	
	int saveMember(Member member);
	
	int deleteMember(String userId);
	
	Member findId(String userName, String email, String phone);
	
	Member findPwd(String userId, String userName, String email, String phone);
	
	int changePwd(String userId, String password);

	int validate(String userId);

	//int updateMember(Member member);

//	Member userAuth(String authkey);

	void sendMail(Member member) throws Exception;


//	Member userAuth(Member member);

	Member userAuth(String userId, String authkey);

	int updateMember(Member member, String password);

	// 모든멤버 수 조회
	int memberAllCount();
    
	// 모든 멤버 리스트 조회
	List<Member> getMemberList();

	Member findMember(String userId);



	



}
