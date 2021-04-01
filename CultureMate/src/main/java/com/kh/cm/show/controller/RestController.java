package com.kh.cm.show.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cm.show.model.vo.ShowListVO;
import com.kh.cm.show.model.vo.ShowVO;

//import lombok.extern.slf4j.Slf4j;

//@Slf4j
@Controller
@RequestMapping("/show")
public class RestController {
	
    @RequestMapping(value = "/getShowList", method = RequestMethod.GET)
    public ModelAndView list(
    		ModelAndView model
    		) {
    	String uri = "http://www.kopis.or.kr/openApi/restful/pblprfr?service=fe0b63fcf599492aae0dc065406b676b&stdate=20210329&eddate=20210501&rows=10&cpage=1";
    	
    	/*
    		검색/정렬 조건 설정할 방법 1. urlBuilder
    		
    	String key = "fe0b63fcf599492aae0dc065406b676b";
		String stdate = "20210329";
		String eddate = "20210501";
		String rows = "10";
		String cpage = "1";
		
        StringBuilder urlBuilder = new StringBuilder("http://www.kopis.or.kr/openApi/restful/pblprfr");
        urlBuilder.append("?service=" + key);
        urlBuilder.append("&stdate=" + stdate);
        urlBuilder.append("&eddate=" + eddate);
        urlBuilder.append("&rows=" + rows);
        urlBuilder.append("&cpage=" + cpage);
//        urlBuilder.append("&" + URLEncoder.encode("shprfnmfct","UTF-8") + "=" + URLEncoder.encode("예술의전당", "UTF-8"));
        URL url = new URL(urlBuilder.toString());
        
       		검색/정렬 조건 설정할 방법 2. MultiValueMap
       		
       	MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("stdate", "20210329");
		params.add("eddate", "20210501");

		ResponseEntity<Employee> responseEntity = restTemplate.getForEntity(BASE_URL + "&stdate={stdate}&eddate={eddate}", ShowListVO.class, params);
    	*/
    	
    	RestTemplate restTemplate = new RestTemplate();
    	ShowListVO showList = restTemplate.getForObject(uri, ShowListVO.class);
    
    	
    	List<ShowVO> result = showList.getShowInfo();
    	
		model.addObject("showList", result);
		model.setViewName("show/showList");
        
        return model;
    }
}
