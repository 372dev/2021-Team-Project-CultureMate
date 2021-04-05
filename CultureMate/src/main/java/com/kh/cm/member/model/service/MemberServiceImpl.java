package com.kh.cm.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.cm.member.model.dao.MemberDao;
import com.kh.cm.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	
	// 로그인
	@Override
	public Member login(String userId, String password) {
		Member loginMember = memberDao.selectMember(userId);
		
		return loginMember != null && passwordEncoder.matches(password, loginMember.getPassword()) ? loginMember : null;
	}

	@Override
	public Member findMemberByUserId(String userId) {
		return memberDao.selectMember(userId);
	}

	// 회원가입
	@Override
	@Transactional
	public int saveMember(Member member) {
		int result = 0;
		
		member.setPassword(passwordEncoder.encode(member.getPassword()));
			
		result = memberDao.insertMember(member);

		return result;
	}

	@Override
	public boolean validate(String userId) {
		Member member = memberDao.selectMember(userId);
		
		return member != null;
	}

	@Override
	public int deleteMember(String userId) {
		return memberDao.deleteMember(userId);
	}

	@Override
	public Member findId(String userName, String email, String phone) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Member findPwd(String userId, String userName, String email, String phone) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int changePwd(String userId, String password) {
		// TODO Auto-generated method stub
		return 0;
	}

}
