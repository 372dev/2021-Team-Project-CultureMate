package com.kh.cm.box.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cm.box.model.vo.BoxOfficeListVO;
import com.kh.cm.box.model.vo.BoxOfficeVO;

//import lombok.extern.slf4j.Slf4j;

//@Slf4j
@Controller
@RequestMapping("/box")
public class BoxOfficeController {

    @RequestMapping(value = "/boxOffice", method = RequestMethod.GET)
    public ModelAndView list(
    		ModelAndView model
    		) {
    	String key = "fe0b63fcf599492aae0dc065406b676b";
    	
    	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
    	Calendar currDate = new GregorianCalendar();
		String date = dateFormat.format(currDate.getTime());

        StringBuilder urlBuilder = new StringBuilder("http://www.kopis.or.kr/openApi/restful/boxoffice");
        urlBuilder.append("?service=" + key);
        urlBuilder.append("&ststype=" + "month");
        urlBuilder.append("&stdate=" + date);
        urlBuilder.append("&catecode" + "AAAB");

        String url = urlBuilder.toString();

    	RestTemplate restTemplate = new RestTemplate();
    	BoxOfficeListVO boxOfficeList = restTemplate.getForObject(url, BoxOfficeListVO.class);
    	System.out.println(boxOfficeList);

    	List<BoxOfficeVO> result = boxOfficeList.getBoxInfo();
    	System.out.println(result);

		model.addObject("boxOfficeList", result);
		model.setViewName("box/boxOffice");

        return model;
    }

}
