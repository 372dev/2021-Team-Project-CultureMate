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
	private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private MemberDao memberDao;
	
	@Override
	public Member login(String userId, String password) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Member findMemberByUserId(String userId) {
		return memberDao.selectMember(userId);
	}

	@Override
	@Transactional
	public int saveMember(Member member) {
		int result = 0;
		
		if(member.getId() != 0) {
			result = memberDao.updateMember(member);
		} else {
			member.setPassword(passwordEncoder.encode(member.getPassword()));
			
			result = memberDao.insertMember(member);
		}
		
		return result;
	}

	@Override
	public boolean validate(String userId) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int deleteMember(String userId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int saveCardInfo(String cardInfo) {
		// TODO Auto-generated method stub
		return 0;
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
