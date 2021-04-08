package com.kh.cm.mkshow.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.kh.cm.member.model.vo.Member;
import com.kh.cm.mkshow.model.service.ShowReviewService;
import com.kh.cm.mkshow.model.vo.ShowReview;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/review")
public class ShowReviewController {
	
	@Autowired
	ShowReviewService service;
	
	@RequestMapping(value = "/add.do",  method = {RequestMethod.POST})
	public String ajax_addComment(
			@ModelAttribute("review") ShowReview review,
			@SessionAttribute(name="loginMember", required = false) Member loginMember,
			HttpServletRequest request) {

		System.out.println("내용값 ? : " + review.getReviewContent());
		System.out.println("컨트롤러 호출");
        
        try{
        
            service.saveReview(review);
            
        } catch (Exception e){
            e.printStackTrace();
        }
        
        return "success";
	}
	
	
	 @RequestMapping(value="/list.do", produces="application/json; charset=utf8")
	    @ResponseBody
	    public List<ShowReview>  ajax_commentList(@ModelAttribute("review") ShowReview review, HttpServletRequest request) throws Exception{
	    	
	        // 해당 게시물 댓글
	        System.out.println("원하는 제목 값 " + review.getMt20id());
	        List<ShowReview> commentVO = service.getReviewList(review.getMt20id());
	       
	        
	        return commentVO;
	    }
}
