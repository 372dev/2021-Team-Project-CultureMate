package com.kh.cm.mkshow.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.json.JSONArray;
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
	public String ajax_addComment(
			@ModelAttribute("review") ShowReview review,
			HttpServletRequest request) {
		
		System.out.println("내용값 ? : " + review.getReviewContent());
		System.out.println("별점 값은? : " + review.getReviewRating());
		System.out.println("컨트롤러 호출");
		
        try{
          service.saveReview(review);
        } catch (Exception e){
            e.printStackTrace();
        }
        //List<ShowReview> slist = service.getReviewList(review.getMt20id());
       //System.out.println("사이즈" + slist.size());
        
        return "success";
	}
	
	
	 	@RequestMapping(value="/list.do", produces="application/json; charset=utf8")
	    @ResponseBody
	    public ResponseEntity ajax_commentList(@ModelAttribute("review") ShowReview review, 
	    		@SessionAttribute(name="loginMember", required = false)  Member loginMember,
	    	 HttpServletRequest request) throws Exception{
	    	
		 	HttpHeaders responseHeaders = new HttpHeaders();
	        ArrayList<HashMap> hmlist = new ArrayList<HashMap>();
	        
	        
	        // 해당 게시물 댓글
	        System.out.println("원하는 제목 값 " + review.getMt20id());
	        
	        List<ShowReview> commentVO = service.getReviewList(review.getMt20id());
	       
	        if(commentVO.size()>0) {
	        	System.out.println("닉네임~!~!" + commentVO.get(0).getUserNick());
	        	System.out.println("내용~!~!" + commentVO.get(0).getReviewContent());
	        }
	        
	        if(commentVO.size() > 0){
	            for(int i=0; i<commentVO.size(); i++){
	                HashMap hm = new HashMap();
	                hm.put("reviewID", commentVO.get(i).getReviewID());
	                hm.put("reviewContent", commentVO.get(i).getReviewContent());
	                hm.put("reviewDate", commentVO.get(i).getReviewDate());
	                hm.put("reviewRating", commentVO.get(i).getReviewRating());
	                hm.put("userNick", commentVO.get(i).getUserNick());
	                hm.put("userId", commentVO.get(i).getId());
	                hmlist.add(hm);
	            }
	            
	        }
	        
	        JSONArray json = new JSONArray(hmlist);        
	        return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
	    }
	 
	 	@RequestMapping(value = "/delete.do", method = {RequestMethod.GET})
	    public ModelAndView deleteReview(int no, ModelAndView model, @SessionAttribute(name="loginMember", required = false)  Member loginMember,
	    		HttpServletRequest request) {
	    	
	 		String usernick = "";
	      	System.out.println(no);
	        System.out.println("삭제 함수 실행");
	        
	        if(loginMember != null) {
	        System.out.println(loginMember.getUserId());
	        System.out.println("유저의 닉네임 : " +  service.findReviewWriter(no).get(0).getUserNick());
	        usernick  = service.findReviewWriter(no).get(0).getUserNick();
	        }
	        
	        
	        if(loginMember.getUserNick().equals(usernick)) {
	        	System.out.println("정상적으로 삭제되었습니다.");
	        	service.delReview(no);
	        	model.addObject("msg", "정상적으로 삭제되었습니다.");
				model.addObject("location", "/");
	        }else {
	        	model.addObject("msg", "본인만 삭제가 가능합니다.");
				model.addObject("location", "/show/showlist");
	        }
	        model.setViewName("/common/msg");
	       
	        
	       // service.findReviewWriter(no);
	      
	        return model;
	    }
	 	
	 		@RequestMapping(value = "/star.do", method = {RequestMethod.POST})
	 		@ResponseBody
	 		public String star(@RequestParam Map<String,Object> param) {
	 		
	 			String star = (String) param.get("num");
	 			int star1 = Integer.parseInt(star);
	 		System.out.println("평점컨트롤러 실행 " + star1*2);
	 		
	 		return star;
	 	}
	 		
	 		@RequestMapping(value = "/update.do", method = {RequestMethod.POST})
	 		@ResponseBody
		    public ModelAndView updateReview(ShowReview review,
		    		 @SessionAttribute(name="loginMember", required = false)  Member loginMember,
		    		 ModelAndView model,
		    		HttpServletRequest request) {
		    	
		      	//System.out.println(no);
		        System.out.println("수정 함수 실행" + review.getReviewID() + "@@@@");
		        System.out.println("@@@" + review.getReviewContent());
		        System.out.println("###" + review.getReviewRating());
		       // System.out.println(reviewContent);
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
