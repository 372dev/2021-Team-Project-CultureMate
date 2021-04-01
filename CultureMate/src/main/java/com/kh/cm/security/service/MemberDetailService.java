package com.kh.cm.security.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.kh.cm.member.model.dao.MemberDao;
import com.kh.cm.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class MemberDetailService implements UserDetailsService {

	@Autowired
	private MemberDao memberDao;
	
	@Override
	public UserDetails loadUserByUsername(String username) {
		
		// 사용자 정보 SELECT
		Member member = memberDao.selectUserInfoOne(username);
		
		if(member == null) {
			throw new UsernameNotFoundException("username " + username + " not found");
		}
		
		log.info("USER ID : {}", member.getUsername());
		
		return member;
	}

}
