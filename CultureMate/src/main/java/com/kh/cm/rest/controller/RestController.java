package com.kh.cm.rest.controller;

import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;


import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/show")
public class RestController {
	
	@RequestMapping(value = "/getShowList", method = RequestMethod.GET)
    public ModelAndView list(
    		ModelAndView model
    		) {
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
    	
		model.addObject("", );
		model.setViewName("show/showList");
        
        return model;
    }
}
