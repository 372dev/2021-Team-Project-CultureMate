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
        urlBuilder.append("&ststype=" + "week");
        urlBuilder.append("&date=" + date);

        String url = urlBuilder.toString();

        String mUrl = url + "&catecode=" + "AAAB";
        String pUrl = url + "&catecode=" + "AAAA";
        String cUrl = url + "&catecode=" + "CCCA";
        
    	RestTemplate restTemplate = new RestTemplate();
    	BoxOfficeListVO musicalBOList = restTemplate.getForObject(mUrl, BoxOfficeListVO.class);
    	BoxOfficeListVO playBOList = restTemplate.getForObject(pUrl, BoxOfficeListVO.class);
    	BoxOfficeListVO classicBOList = restTemplate.getForObject(cUrl, BoxOfficeListVO.class);
    	
    	List<BoxOfficeVO> mResult = musicalBOList.getBoxInfo();
    	List<BoxOfficeVO> pResult = playBOList.getBoxInfo();
    	List<BoxOfficeVO> cResult = classicBOList.getBoxInfo();
    	
    	System.out.println(mResult.size());
    	System.out.println(pResult.size());
    	System.out.println(cResult.size());

		model.addObject("musicalBOList", mResult);
		model.addObject("playBOList", pResult);
		model.addObject("classicBOList", cResult);
		model.setViewName("box/boxOffice");

        return model;
    }
    
}