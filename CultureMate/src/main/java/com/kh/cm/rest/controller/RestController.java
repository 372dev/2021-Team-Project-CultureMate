package com.kh.cm.rest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cm.rest.model.ShowList;
import com.kh.cm.rest.model.ShowListContainer;
import com.kh.cm.rest.service.ShowService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/show")
public class RestController {
	
	@Autowired
	private ShowService showService;
	
    @RequestMapping(value = "/getShowList", method = RequestMethod.GET,produces=MediaType.APPLICATION_XML_VALUE)
    public ModelAndView list(
    		ShowListContainer showListResponse,
    		ModelAndView model
    		) {
    	List<ShowList> showList = null;
    	
        showList = showService.getShowList();
        ShowListContainer showListResponse = new ShowListContainer();
        showListResponse.setShowList(showList);
        
        
        return model;
    }
}
