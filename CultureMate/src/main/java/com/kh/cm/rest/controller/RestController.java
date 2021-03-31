package com.kh.cm.rest.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cm.rest.model.vo.ShowListVO;
import com.kh.cm.rest.model.vo.ShowVO;

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
    	
    	RestTemplate restTemplate = new RestTemplate();
    	ShowListVO showList = restTemplate.getForObject(uri, ShowListVO.class);
    	
    	List<ShowVO> result = showList.getShowInfo();
    	
		model.addObject("showList", result);
		model.setViewName("show/showList");
        
        return model;
    }
}
