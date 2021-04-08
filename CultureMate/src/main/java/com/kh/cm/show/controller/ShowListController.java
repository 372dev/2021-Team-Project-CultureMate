package com.kh.cm.show.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cm.show.model.vo.ShowListVO;
import com.kh.cm.show.model.vo.ShowVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ShowListController {

    @RequestMapping(value = "/show/showList", method = RequestMethod.GET)
    public ModelAndView list(
    		ModelAndView model,
    		@RequestParam(value = "title", required = false) String title,
    		@RequestParam(value = "genre", required = false) String genre
    		) {
    	log.info("Controller started. searching title : " + title + " genre : " + genre);
    	String key = "fe0b63fcf599492aae0dc065406b676b";

    	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
    	Calendar currDate = new GregorianCalendar();
    	Calendar nextDate = new GregorianCalendar();
    	nextDate.add(Calendar.MONTH, 1);

		String stdate = dateFormat.format(currDate.getTime());
		String eddate = dateFormat.format(nextDate.getTime());

		String shcate = null;
		if(genre != null) {
			if(genre.toString().equals("musical")) {
				shcate = "AAAB";
			} else if(genre.toString().equals("play")) {
				shcate = "AAAA";
			} else if(genre.toString().equals("classic")) {
				shcate = "CCCA";
			}
		}
		
		String shprfnm = null;
		if(title != null) {
			shprfnm = title;
		}

        StringBuilder urlBuilder = new StringBuilder("http://www.kopis.or.kr/openApi/restful/pblprfr");
        urlBuilder.append("?service=" + key);
        urlBuilder.append("&stdate=" + stdate);
        urlBuilder.append("&eddate=" + eddate);
        urlBuilder.append("&prfstate=" + "02|03");
        urlBuilder.append("&rows=199&cpage=1");
        if(shcate != null) {
        	urlBuilder.append("&shcate=" + shcate);
        	log.info("showList - genre selected");
        }
        if(shprfnm != null) {
        	urlBuilder.append("&shprfnm=" + shprfnm);
        	log.info("showList - title selected");
        }
        
        String url = urlBuilder.toString();

    	RestTemplate restTemplate = new RestTemplate();
    	ShowListVO showList = restTemplate.getForObject(url, ShowListVO.class);

    	List<ShowVO> result = showList.getShowInfo();

		model.addObject("showList", result);
		model.setViewName("show/showList");

        return model;
    }

    @ResponseBody
    @RequestMapping(value = "/show/ajaxShowList", method = RequestMethod.GET)
    public List<ShowVO> ajaxShowList(
    		@RequestParam("prfstate") String prfstate,
    		@RequestParam("shcate") String shcate,
    		@RequestParam("shprfnm") String shprfnm
    		) {
    	log.info("Controller started. searching title : " + shprfnm + " genre : " + shcate + " status : " + prfstate);

		String key = "fe0b63fcf599492aae0dc065406b676b";
		
    	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
    	Calendar currDate = new GregorianCalendar();
    	Calendar nextDate = new GregorianCalendar();
    	nextDate.add(Calendar.MONTH, 1);
		
		String stdate = "20210401";
		String eddate = "20210501";

        StringBuilder urlBuilder = new StringBuilder("http://www.kopis.or.kr/openApi/restful/pblprfr");
        urlBuilder.append("?service=" + key);
        urlBuilder.append("&stdate=" + stdate);
        urlBuilder.append("&eddate=" + eddate);
        urlBuilder.append("&rows=199&cpage=1");
        urlBuilder.append("&shcate=" + shcate);
        urlBuilder.append("&prfstate=" + prfstate);

        String url = urlBuilder.toString();

        System.out.println(url);

		RestTemplate restTemplate = new RestTemplate();
		ShowListVO ajaxShowList = restTemplate.getForObject(url, ShowListVO.class);

    	List<ShowVO> result = ajaxShowList.getShowInfo();

		return result;

    }
}
