package com.kh.cm.rest.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cm.rest.model.vo.ShowList;
import com.kh.cm.rest.model.vo.ShowListContainer;
import com.kh.cm.rest.model.service.ShowServiceImpl;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/show")
public class RestController {
	
	@Autowired
	private ShowServiceImpl showService;
	
    @RequestMapping(value = "/getShowList", method = RequestMethod.GET)
    public ModelAndView list(
    		ShowListContainer showListContainer,
    		RestTemplate restTemplate,
    		ModelAndView model
    		) {
    	Map<String, String> params = new HashMap<String, int>();
    	params.put("page", 1);

    	ShowList showList = new ShowList();
    	showListContainer = restTemplate.getForObject("http://www.kopis.or.kr/openApi/restful/pblprfr?service=fe0b63fcf599492aae0dc065406b676b&stdate=20210329&eddate=20210501&rows=10&cpage={page}", showList);

    	Employee result = restTemplate.getForObject(uri, Employee.class, params);
    	
		model.addObject("showListContainer", showListContainer);
		model.setViewName("show/showList");
        
        return model;
    }
}
