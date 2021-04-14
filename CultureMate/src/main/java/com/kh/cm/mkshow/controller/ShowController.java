package com.kh.cm.mkshow.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cm.mkshow.model.service.ShowReviewService;
import com.kh.cm.mkshow.model.vo.MemberDTO;
import com.kh.cm.mkshow.model.vo.MemberListDTO;
import com.kh.cm.mkshow.model.vo.PlaceDTO;
import com.kh.cm.mkshow.model.vo.PlaceListDTO;
import com.kh.cm.mkshow.model.vo.ShowDTO;
import com.kh.cm.mkshow.model.vo.ShowListDTO;
import com.kh.cm.mkshow.model.vo.ShowReview;
import com.kh.cm.mkshow.model.vo.ShowStyDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/show")
public class ShowController {
	
	
	 @Autowired
	 private ShowReviewService service; 
	
	//지도 위치 출력 위한 위도 경도 리턴 함수
	private static List<PlaceDTO> getPlace(String mt10id) {
		
		String data[] = new String[2];
	
		String addr = "http://www.kopis.or.kr/openApi/restful/prfplc/";
	    String serviceKey = "54aff7444a924def99fc5e93ad99952d";
	    String parameter = mt10id + "?service=";

	    String uri = addr + parameter + serviceKey;
	   
	    
	    RestTemplate restTemplate = new RestTemplate();
        
        // 오브젝트로 결과값 받아오기
        PlaceListDTO placeList = restTemplate.getForObject(uri, PlaceListDTO.class);
       
        // 장소 정보
        List<PlaceDTO> result = placeList.getPlaceInfo();
        
        data[0] = result.get(0).getLa();
        data[1] = result.get(0).getLo();
       
        System.out.println("위도 : " + data[0]);
        System.out.println("경도 : " + data[1]);
        
		return result;
	}
	
		private static List<MemberDTO> getList(String shcate) {
		
		String data[] = new String[2];
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
	    Calendar currDate = new GregorianCalendar();
    	Calendar nextDate = new GregorianCalendar();
    	nextDate.add(Calendar.MONTH, 1);
    	
    	
		String stdate = dateFormat.format(currDate.getTime());
		String eddate = dateFormat.format(nextDate.getTime());
		
		 String addr = "http://www.kopis.or.kr/openApi/restful/pblprfr?service=";
		 String serviceKey = "54aff7444a924def99fc5e93ad99952d";
		 String parameter = "&stdate=" + stdate + "&eddate=" + eddate + "&rows=10&cpage=1" + "&shcate=" + shcate;
		 
		 String uri = addr + serviceKey + parameter;
			
        // 오브젝트로 결과값 받아오기
	    RestTemplate restTemplate = new RestTemplate();
        
        // 오브젝트로 결과값 받아오기
	    MemberListDTO memberList = restTemplate.getForObject(uri, MemberListDTO.class);
        
        
        // 회원 정보 리스트
        List<MemberDTO> result = memberList.getMemberInfo();
        
		return result;
	}
	
	@RequestMapping(value = "/restview", method = RequestMethod.GET)
    public ModelAndView showView(ModelAndView model, String name) {
        // Xml데이터를 response받을 API주소
		String addr = "http://www.kopis.or.kr/openApi/restful/pblprfr/";
	    String serviceKey = "54aff7444a924def99fc5e93ad99952d";
	    String parameter = name + "?service=";
		
	    List<PlaceDTO> place;
	    int replylength = 0;
	    
		 String uri = addr + parameter + serviceKey;
	    
        // RestTemplate 생성
        RestTemplate restTemplate = new RestTemplate();
         
        // 오브젝트로 결과값 받아오기
        ShowListDTO showList = restTemplate.getForObject(uri, ShowListDTO.class);
       
        // 공연 정보
        List<ShowDTO> result = showList.getShowInfo();
        
        System.out.println("0번쨰 이름 : " + result.get(0).getPrfnm());
        System.out.println("0배열 : " + result.get(0).getMt10id());
        
        place = getPlace(result.get(0).getMt10id());
        
        //리뷰가져오기
	    List<ShowReview> review = null;
	    
	    review  = service.getReviewList(result.get(0).getMt20id());
	    replylength = review.size();
	    System.out.println("리뷰의 사이즈 : " + replylength);
	    
	    if(replylength > 0) {
	    	System.out.println("리뷰 값" + review.get(0).getReviewContent());
	    }else {
	    	System.out.println("등록된 리뷰가 없습니다.");
	    }
	    
       if(result.get(0).getStyurls() != null) { 
    	   int max = result.get(0).getStyurls().getStyurl().length;
    	   model.addObject("max", max);
       }
        
       
       String type = "";
       if(result.get(0).getGenrenm().equals("연극")) {
    	   type = "AAAA";
       }else if(result.get(0).getGenrenm().equals("뮤지컬")) {
    	   type = "AAAB";
       }else {
    	   type = "CCCA";
       }
       List<MemberDTO> slist = getList(type);
       System.out.println("목록1" + slist.get(0).getPrfnm());
       
       model.addObject("slist",slist);
       model.addObject("review", review);
       model.addObject("replylength", replylength-1);
       model.addObject("place", place);
       model.addObject("prfruntimesize", result.get(0).getPrfruntime().length());
       model.addObject("pcseguidancesize", result.get(0).getPcseguidance().length());
       model.setViewName("board/view");
       model.addObject("result", result);
         
       return model;
    }
	
}
