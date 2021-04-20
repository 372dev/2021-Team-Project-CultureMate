package com.kh.cm.mkshow.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

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
	@ResponseBody
	public int ajax_addComment(
			@ModelAttribute("review") ShowReview review,
			HttpServletRequest request) {
		
		System.out.println("컨트롤러 호출");

		service.saveReview(review);
		int reviewnum = service.countReview(review.getMt20id());
        
        return reviewnum;
	}
	
	
	 	@RequestMapping(value="/list.do", produces="application/json; charset=utf8")
	    @ResponseBody
	    public String ajax_commentList(@ModelAttribute("review") ShowReview review, 
	    		@SessionAttribute(name="loginMember", required = false)  Member loginMember,
	    	 HttpServletRequest request) throws Exception{
	    	
	        ArrayList<HashMap> hmlist = new ArrayList<HashMap>();
	        
	        // 해당 게시물 댓글
	        System.out.println("원하는 제목 값 " + review.getMt20id());
	        
	        List<ShowReview> commentVO = service.getReviewList(review.getMt20id());
	        log.info("사이즈값" + commentVO.size());
	        if(commentVO.size() > 0){
	            for(int i=0; i<commentVO.size(); i++){
	                HashMap<String, Comparable> hm = new HashMap();
	                hm.put("reviewID", commentVO.get(i).getReviewID());
	                hm.put("reviewContent", commentVO.get(i).getReviewContent());
	                hm.put("reviewDate", commentVO.get(i).getReviewDate().substring(0, 10));
	                hm.put("reviewRating", commentVO.get(i).getReviewRating());
	                hm.put("userNick", commentVO.get(i).getUserNick());
	                hm.put("userId", commentVO.get(i).getId());
	                hm.put("reviewsize", commentVO.size());
	                hm.put("reserve", commentVO.get(i).getReserve());
	                hmlist.add(hm);
	            }
	            
	        }else {
	        	HashMap<String, Comparable> hm = new HashMap();
	        	 hm.put("reviewsize", commentVO.size());
	        	 hmlist.add(hm);
	        }
	        
	        JSONArray json = new JSONArray(hmlist);        
	        return json.toString();
	    }
	 
	 	@RequestMapping(value = "/delete.do", method = {RequestMethod.GET})
	 	@ResponseBody
	    public int deleteReview(int no, ModelAndView model, @SessionAttribute(name="loginMember", required = false)  Member loginMember,
	    		HttpServletRequest request) {
	    	
	      	System.out.println(no);
	        System.out.println("삭제 함수 실행");
	        
	        service.delReview(no);
	        String rno = service.findReviewWriter(no).get(0).getMt20id();
	        int reviewcount = service.countReview(rno);
	      
	        return reviewcount;
	    }
	 	
	 		@RequestMapping(value = "/star.do", method = {RequestMethod.POST})
	 		@ResponseBody
	 		public String star(@RequestParam Map<String,Object> param) {
	 		
	 			String star = (String) param.get("num");
	 			int star1 = Integer.parseInt(star);
	 		
	 		return star;
	 	}
	 		
	 		@RequestMapping(value = "/update.do", method = {RequestMethod.POST})
	 		@ResponseBody
		    public ModelAndView updateReview(ShowReview review,
		    		 @SessionAttribute(name="loginMember", required = false)  Member loginMember,
		    		 ModelAndView model,
		    		HttpServletRequest request) {
		    	
		        System.out.println("수정 함수 실행" + review.getReviewID());
		        service.updateReview(review);
		      
		        model.setViewName("home");
		      
		        return model;
		    }
	 		
	 		@RequestMapping(value = "/reco.do", method = {RequestMethod.POST})
	 		@ResponseBody
	 		public String reco(int no, int reco, HttpServletRequest request) {
	 		
	 			//service.updatereco();
	 			
	 		
	 		return "";}
}
