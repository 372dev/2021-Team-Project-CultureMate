package com.kh.cm.mate.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cm.common.util.PageInfo;
import com.kh.cm.mate.model.service.MateService;
import com.kh.cm.mate.model.vo.Mate;
import com.kh.cm.mate.model.vo.MateReply;
import com.kh.cm.member.model.vo.Member;
import com.kh.cm.share.model.vo.Share;
import com.kh.cm.share.model.vo.ShareReply;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/mate")
public class MateController {
	
	@Autowired
	private MateService service;
	
	@RequestMapping(value="/list", method = {RequestMethod.GET}) 
	public ModelAndView mateList(ModelAndView model,
				@RequestParam(value="page", required=false, defaultValue="1") int page,
				@RequestParam(value="listlimit", required=false, defaultValue="10") int listLimit) {
			
		List<Mate> mateList = null;
		int mateCount = service.getMateCount();
		
		PageInfo pageInfo = new PageInfo(page, 10, mateCount, listLimit);
		
		mateList = service.getMateList(pageInfo);
		
		model.addObject("mateList", mateList);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("board/mate/mateList");
	 return model;
	}
	
	@RequestMapping(value="/write", method = {RequestMethod.GET}) 
	public String mateWrite( ) {
		return "board/mate/mateWrite";
	}
	
	@RequestMapping(value="/write", method = {RequestMethod.POST}) 
	public ModelAndView mateWrite(ModelAndView model,
			@SessionAttribute(name="loginMember", required=false) Member loginMember,
			 Mate mate) {
		
		int result = 0;
				
		if(loginMember.getUserNick().equals(mate.getUserNick())) {
			mate.setMateWriteId(loginMember.getId());
						
		result = service.saveMate(mate);
		
		if(result > 0) {
			model.addObject("msg", "메이트글 등록에 성공했습니다.");
			model.addObject("location", "/mate/list");
		} else {
			model.addObject("msg", "메이트글 등록에 실패했습니다.");
			model.addObject("location", "/mate/list");
		}
	} else {
		model.addObject("msg", "잘못된 접근입니다.");
		model.addObject("location", "/");
		
	}	
		model.setViewName("/common/msg");
		
		return model;
}
	
	@RequestMapping(value="/view", method = {RequestMethod.GET}) 
	public ModelAndView mateView(@RequestParam("mateId")int mateId, ModelAndView model,
			@RequestParam(value="page", required=false, defaultValue="1") int page,
			@RequestParam(value="listlimit", required=false, defaultValue="3") int listLimit) {
		Mate mate = service.findMateByMateId(mateId);
		
		boolean updateMateCount = service.updateMateCount(mateId);
		int mateReplyCount = service.getMateReplyCount(mateId);
		
		PageInfo pageInfo = new PageInfo(page, 5, mateReplyCount, 3);
		List<MateReply> mateReplies = service.findMateReplyByMateId(mateId, pageInfo);
		

			
		model.addObject("mate", mate);
		model.addObject("mateReplies", mateReplies);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("/board/mate/mateView");
		
		System.out.println(mateReplies);
		
		return model;
	}

	

	@RequestMapping(value="/update", method = {RequestMethod.GET}) 
	public ModelAndView mateUpdateView(ModelAndView model, @RequestParam("mateId") int mateId) {
		Mate mate = service.findMateByMateId(mateId);
		
		model.addObject("mate", mate);
		model.setViewName("/board/mate/mateUpdate");
		
		return model;
	}
	

	@RequestMapping(value="/update", method = {RequestMethod.POST}) 
	public ModelAndView shareUpdate(@SessionAttribute(name = "loginMember", required=false) Member loginMember, Mate mate, ModelAndView model) {
		
		int result = 0;
		if(loginMember.getUserNick().equals(loginMember.getUserNick())) {
			
			result = service.saveMate(mate);
			
			if(result > 0) {
				model.addObject("msg", "게시글이 정상적으로 수정되었습니다.");
				model.addObject("location", "/mate/view?mateId=" + mate.getMateId());
			} else {
				model.addObject("msg", "게시글 수정에 실패하였습니다.");
				model.addObject("location", "/mate/list");
			}
		} else {
			model.addObject("msg", "잘못된 접근입니다.");
			model.addObject("location", "/");
		}
		model.setViewName("common/msg");
				
		return model;
	}
	
	@RequestMapping(value ="/delete", method ={RequestMethod.GET})
	private ModelAndView delete(ModelAndView model, @RequestParam("mateId") int mateId ) {
		int result = 0;
		
		result = service.deleteMate(mateId);
		
		if(result > 0) {
			model.addObject("msg", "게시글이 삭제되었습니다.");
			model.addObject("location", "/mate/list");
		} else {
			model.addObject("msg", "게시글 삭제에 실패했습니다.");
			model.addObject("location", "/");
		}
		model.setViewName("common/msg");
		
		return model;
	}
	
	@RequestMapping(value = "/reply/write", method={RequestMethod.POST})
	public ModelAndView writeReply(@SessionAttribute(name = "loginMember", required=false) Member loginMember,
				@RequestParam(name ="mateId") int mateId,@RequestParam(name ="writer") String writer,
				@RequestParam(name ="content") String content, MateReply mateReply,
				ModelAndView model) {
		int result = 0;
		
		if(loginMember.getUserNick().equals(writer)) {
			mateReply.setMateId(mateId);
			mateReply.setMateReplyContent(content);
			mateReply.setMateReplyWriteId(loginMember.getId());
			
			result = service.saveMateReply(mateReply);
			
			if(result > 0) {
				model.addObject("msg", "댓글 등록에 성공했습니다.");
				model.addObject("location", "/mate/view?mateId=" + mateReply.getMateId());
			} else {
				model.addObject("msg", "댓글 등록에 실패했습니다.");
				model.addObject("location", "/mate/list");
				
			}
		} else {
			model.addObject("msg", "잘못된 접근입니다.");
			model.addObject("location", "/mate/list");
		}
		
		model.setViewName("common/msg");
		return model;
	}
//	
//	@RequestMapping(value="/update", method = {RequestMethod.GET}) 
//	public String mateUpdate( ) {
//		return "board/mate/mateUpdate";
//	}
//	
//	@RequestMapping(value="/view", method = {RequestMethod.GET}) 
//	public String mateView( ) {
//		return "board/mate/mateView";
//	}
//	@RequestMapping(value="/list", method = {RequestMethod.GET}) 
//	public String mateList( ) {
//		return "board/mate/mateList";
//	}
	
//	@RequestMapping(value="/update", method = {RequestMethod.POST}) 
//	public ModelAndView mateUpdate(@RequestParam("mateId") Mate mateId,ModelAndView model) {
//		
//		return model;
//	}
	
//	public ModelAndView mateView(ModelAndView model) {
//		return model;
//	}
}
