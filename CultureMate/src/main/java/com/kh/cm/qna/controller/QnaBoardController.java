package com.kh.cm.qna.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.method.support.ModelAndViewContainer;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cm.common.util.PageInfo;
import com.kh.cm.member.model.vo.Member;
import com.kh.cm.qna.model.service.QnaBoardService;
import com.kh.cm.qna.model.vo.QnaBoard;
import com.kh.cm.qna.model.vo.QnaReply;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/help")
public class QnaBoardController {
	@Autowired
	private QnaBoardService service;
	
	
	@RequestMapping(value = "/qnalist", method = {RequestMethod.GET})
	public ModelAndView qnalist(
			ModelAndView model,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			QnaBoard qnaboard,
			@RequestParam(value="page", required=false, defaultValue="1") int page,
			@RequestParam(value="listlimit", required=false, defaultValue="10") int listLimit) {
		
		List<QnaBoard> list = null;
		int boardCount = service.getqnaBoardCount();
		
		PageInfo pageInfo = new PageInfo(page, 10, boardCount, listLimit);
		
	
		list = service.getqnaBoardList(pageInfo);
		
		model.addObject("qnalist", list);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("help/qnalist");
		
		return model;
}
	@RequestMapping(value = "/qnacontent", method = {RequestMethod.GET})
	public void qnacontentView() {
		
	}
	@RequestMapping(value = "/qnacontent", method = {RequestMethod.POST})
	public ModelAndView qnacontent (
			@SessionAttribute(name = "loginMember", required = false) Member loginMember, QnaBoard qnaboard,
			HttpServletRequest request,
			ModelAndView model) {

		int result =0;
		
		
		
		if(loginMember.getUserId().equals(qnaboard.getUserId())) {
			qnaboard.setQnaWriterNo(loginMember.getId());
			
			System.out.println(qnaboard);
		}
		
		result = service.saveqnaBoard(qnaboard);
		
		 if (result>0) { 
			  model.addObject("msg", "게시글이 정상적으로 등록되었습니다.");
			  model.addObject("loaction", "/help/qnalist");
		}else {
			model.addObject("msg", "게시글 등록을 실패하였습니다.");
			model.addObject("loaction", "/help/qnalist");
		}
		
	
	   model.setViewName("common/msg");
		
		return model;
	}
	
    
	@RequestMapping(value = "qnaview", method = {RequestMethod.GET})
	public ModelAndView qnaview(@RequestParam("qnaId") int qnaId, ModelAndView model) {
		
		QnaBoard qnaboard = service.findqnaBoardById(qnaId);
		
		model.addObject("qnaboard", qnaboard);
		model.setViewName("help/qnaview");
		
		return model;
	}

//	@RequestMapping(value = "qnareply", method = {RequestMethod.POST})
//	public ModelAndView qnareply(
//			            @SessionAttribute(name = "loginMember", required = false) Member loginMember,
//			            @RequestParam("qnaId") int qnaId, @RequestParam("replyWriterNo") int replyWriterNo, 
//			            @RequestParam("qnaReContent") String qnaReContent, QnaReply qnareply,
//			            ModelAndView model) {
//		int result=0;
//		
//		if(loginMember.getUserId().equals(qnareply.getUserId())) {
//			qnareply.setQnaId(qnaId);
//			qnareply.setQnaReContent(qnaReContent);
//			qnareply.setReplyWriterNo(loginMember.getId());
//
//		   result = service.saveQnaReply(qnareply);
//		
//		   System.out.println(qnareply);
//		   
//		   if(result > 0) {
//				model.addObject("msg", "댓글이 등록되었습니다.");
//				model.addObject("location", "/help/qnaview?qnaId=" + qnareply.getQnaId());
//			} else {
//				model.addObject("msg", "댓글 등록에 실패했습니다.");
//				model.addObject("location", "/help/qnalist");
//			}
//		} else {
//			model.addObject("msg", "잘못된 접근입니다.");
//			model.addObject("location", "/");
//		}
//		
//		model.setViewName("common/msg");
//				
//		return model;
//	}
	
	@RequestMapping(value = "addreply.do", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
     public String ajax_addReply(@ModelAttribute("qnareply") QnaReply qnareply, HttpServletRequest request,
    		 @SessionAttribute("loginMember") Member loginMember) {
		
			System.out.println("유저아이디??" + qnareply.getUserId());
		    try {
		    	qnareply.setReplyWriterNo(loginMember.getId());
		    	service.addreply(qnareply);
		    }catch(Exception e){
	            e.printStackTrace();
		
		    }
		    System.out.println(qnareply);
		return "success";
	}
	
	@RequestMapping(value = "replyList.do", produces = "applicaion/json; charset=utf-8")
	@ResponseBody
	public String ajax_replyList(@ModelAttribute("qnareply") QnaReply qnareply, HttpServletRequest request,
			                   @SessionAttribute(name = "loginMember", required = false ) Member loginMember
			                ) throws Exception{

		ArrayList<HashMap> hmList = new ArrayList<HashMap>();
	
	     // 게시물 댓글
        //System.out.println("게시글 아이디 " + qnareply.get);
		System.out.println("게시글의 어아다" + qnareply.getQnaId());
		List<QnaReply> replyVo = service.getqnaReplyList(qnareply.getQnaId());
		
		System.out.println("댓글 리스트 추출 성공?");
		
		if(replyVo.size() > 0) {
			for(int i = 0; i < replyVo.size(); i++) {
				HashMap<String, Comparable> hm = new HashMap();
				hm.put("userId", replyVo.get(i).getUserId());
				hm.put("replyWriterNo", replyVo.get(i).getReplyWriterNo());
				hm.put("qnaReContent", replyVo.get(i).getQnaReContent());
				hm.put("createDate", replyVo.get(i).getReplyCreateDate().substring(0, 10));
				System.out.println("1=" + replyVo.get(i).getUserId());
				System.out.println("2=" + replyVo.get(i).getReplyWriterNo());
				System.out.println("3=" + replyVo.get(i).getQnaReContent());
				hmList.add(hm);
			}
		}
		
		JSONArray json = new JSONArray(hmList);   
		return json.toString();

	}
	
	
	@RequestMapping(value = "/qnaupdate", method = {RequestMethod.GET})
	public ModelAndView qnaupdate(
			@RequestParam("qnaId") int qnaId, ModelAndView model) {
		
		QnaBoard qnaboard = service.findqnaBoardById(qnaId);
		
		model.addObject("qnaboard",qnaboard);
		model.setViewName("help/qnaupdate");
		
		return model;
	}
	
	
	@RequestMapping(value = "/qnaupdate", method = {RequestMethod.POST})
	public ModelAndView qnaupdateview (
			@SessionAttribute(name = "loginMember", required = false) Member loginMember, QnaBoard qnaboard,
			HttpServletRequest request,
			ModelAndView model) {

		int result =0;
		
		if(loginMember.getUserId().equals(qnaboard.getUserId())) {
			qnaboard.setQnaWriterNo(loginMember.getId());
			
			System.out.println(qnaboard);
		}
		
		result = service.saveqnaBoard(qnaboard);
		
		 if (result>0) { 
			  model.addObject("msg", "게시글이 정상적으로 등록되었습니다.");
			  model.addObject("loaction", "/help/viewupdate?qnaId=" + qnaboard.getQnaId());
		}else {
			model.addObject("msg", "게시글 등록을 실패하였습니다.");
			model.addObject("loaction", "/help/qnalist");
		}
		
	
	   model.setViewName("common/msg");
		
		return model;
	}
	
	@RequestMapping(value = "/delete", method = {RequestMethod.GET})
	private ModelAndView delete(ModelAndView model, @RequestParam("qnaId") int qnaId ) {
		int result = 0;
		
		result = service.deleteQna(qnaId);
		
		if(result > 0) {
			model.addObject("msg", "게시글이 삭제되었습니다.");
			model.addObject("location", "/help/qnalist");
		} else {
			model.addObject("msg", "게시글 삭제에 실패했습니다.");
			model.addObject("location", "/");
		}
		model.setViewName("common/msg");
		
		return model;
	}
	
	
}
