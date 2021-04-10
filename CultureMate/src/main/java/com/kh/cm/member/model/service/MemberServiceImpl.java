package com.kh.cm.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.cm.member.model.dao.MemberDao;
import com.kh.cm.member.model.vo.MailHandler;
import com.kh.cm.member.model.vo.Member;
import com.kh.cm.member.model.vo.TempKey;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private JavaMailSender mailSender;
	
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
//	@Override
//	@Transactional
//	public int saveMember(Member member) {
//		int result = 0;
//		
//		member.setPassword(passwordEncoder.encode(member.getPassword()));
//		
//		result = memberDao.insertMember(member);
//
//		return result;
//	}
	
	@Override
	@Transactional
	public int saveMember(Member member) {
		int result = 0;
		
		member.setPassword(passwordEncoder.encode(member.getPassword()));
		
		result = memberDao.insertMember(member);
		
		try {
			sendMail(member);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;
	}
	
	@Override
	public void sendMail(Member member) throws Exception{
		String key = new TempKey().init(); // 인증키 생성
		member.setAuthkey(key);
		
		log.info("key : " + key);
		
		memberDao.updateAuthkey(member);
		
		MailHandler sendMail = new MailHandler(mailSender);
        sendMail.setSubject("[컬쳐메이트] 회원가입 이메일 인증");
        sendMail.setText(new StringBuffer().append("<h2>컬쳐메이트를 이용해주셔서 감사합니다!</h2>")
        		.append("<h3>회원가입을 아래 링크를 눌러 마무리 해주세요~!</h3>")
                .append("<a href='http://localhost:8088/member/emailConfirm?authKey=")
                .append(key)
                .append("' target='_blank'>컬쳐메이트 이메일 인증하러 가기~!</a>")
                .toString());
        
        sendMail.setFrom("CultureMate", "컬쳐메이트");
        sendMail.setTo(member.getEmail());
        sendMail.send();
	}
	
	// 이메일 인증 키 검증
	@Override
	public Member userAuth(String authkey) {
		Member member = new Member();
		member = memberDao.checkAuth(authkey); // 이메일 인증 코드 확인
		
		if(member != null) {
			try {
				memberDao.successAuthkey(member); // 인증 후 계정 활성화
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return member;
	}

	// 회원탈퇴
	@Override
	public int deleteMember(String userId) {
		return memberDao.deleteMember(userId);
	}

	// 아이디 찾기
	@Override
	public Member findId(String userName, String email, String phone) {
		return null;
	}

	// 비밀번호 찾기
	@Override
	public Member findPwd(String userId, String userName, String email, String phone) {
		return null;
	}

	// 비밀번호 변경
	@Override
	public int changePwd(String userId, String password) {
		return 0;
	}

	// 아이디 중복 체크
	@Override
	public int validate(String userId) {
		return memberDao.validate(userId);
	}

	// 회원정보 수정
	@Override
	public int updateMember(Member member) {
		return memberDao.updateMember(member);
	}


}
