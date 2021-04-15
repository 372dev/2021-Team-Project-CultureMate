package com.kh.cm.member.model.service;

import com.kh.cm.member.model.vo.Member;

public interface MemberService {
	Member login(String userId, String password);
	
	Member findMemberByUserId(String userId);
	
	int saveMember(Member member);
	
	int deleteMember(String userId);
	
	String findId(String userName, String email, String phone);
	
	void findPwd(String userId, String userName, String email) throws Exception;
	
	int changePwd(String userId, String password);

	int validate(String userId);

	void sendMail(Member member) throws Exception;

	Member userAuth(String userId, String authkey);

	int updateMember(Member member, String password);


}
