package com.kh.cm.member.model.service;

import com.kh.cm.member.model.vo.Member;

public interface MemberService {
	Member login(String userId, String password);
	
	Member findMemberByUserId(String userId);
	
	int saveMember(Member member);
	
	boolean validate(String userId);
	
	int deleteMember(String userId);
	
	Member findId(String userName, String email, String phone);
	
	Member findPwd(String userId, String userName, String email, String phone);
	
	int changePwd(String userId, String password);
}
