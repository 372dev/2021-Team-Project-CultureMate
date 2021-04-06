package com.kh.cm.mkshow.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cm.mkshow.model.vo.PlaceDTO;
import com.kh.cm.mkshow.model.vo.PlaceListDTO;
import com.kh.cm.mkshow.model.vo.ShowDTO;
import com.kh.cm.mkshow.model.vo.ShowListDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/show")
public class ShowController {
	
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
	
	@RequestMapping(value = "/restview", method = RequestMethod.GET)
    public ModelAndView showView(ModelAndView model, String name) {
        // Xml데이터를 response받을 API주소
		String addr = "http://www.kopis.or.kr/openApi/restful/pblprfr/";
	    String serviceKey = "54aff7444a924def99fc5e93ad99952d";
	    String parameter = name + "?service=";
		 List<PlaceDTO> place;
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
       // System.out.println("위도 : " + place[0]);
        //System.out.println("경도 : " + place[1]);
        
       if(result.get(0).getStyurls() != null) { 
    	   int max = result.get(0).getStyurls().getStyurl().length;
    	   model.addObject("max", max);
       }
        
        model.addObject("place", place);
        model.addObject("prfruntimesize", result.get(0).getPrfruntime().length());
        model.addObject("pcseguidancesize", result.get(0).getPcseguidance().length());
        model.setViewName("board/view");
        model.addObject("result", result);
         
        return model;
    }
	
}
