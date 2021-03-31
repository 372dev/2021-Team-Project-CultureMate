package com.kh.cm.rest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
    @RequestMapping(value = "/getShowList", method = RequestMethod.GET,produces=MediaType.APPLICATION_XML_VALUE)
    public ModelAndView list(
    		ShowListContainer showListContainer,
    		ModelAndView model
    		) {
    	List<ShowList> showList = null;
    	
        showList = showService.getShowList();
        showListContainer.setShowList(showList);
        
		model.addObject("showListContainer", showListContainer);
		model.setViewName("show/showList");
        
        return model;
    }
}
