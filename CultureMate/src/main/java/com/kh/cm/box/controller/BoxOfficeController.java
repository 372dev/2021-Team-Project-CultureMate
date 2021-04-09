package com.kh.cm.box.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cm.box.model.service.BoxOfficeService;
import com.kh.cm.box.model.vo.BoxOfficeListVO;
import com.kh.cm.box.model.vo.BoxOfficeVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@EnableScheduling
public class BoxOfficeController {
	@Autowired
	private BoxOfficeService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(Locale locale, ModelAndView model/*, @AuthenticationPrincipal Member member */) {
		log.info("home started");
		List<BoxOfficeVO> mbo = readBOList("뮤지컬");
		List<BoxOfficeVO> pbo = readBOList("연극");
		List<BoxOfficeVO> cbo = readBOList("클래식");
		
		model.addObject("mbo", mbo);
		model.addObject("pbo", pbo);
		model.addObject("cbo", cbo);
		model.setViewName("home");
		
		return model;
	}

    @RequestMapping(value = "/show/boList", method = RequestMethod.GET)
    public ModelAndView showBOList(
    		ModelAndView model,
    		@RequestParam(value = "genre", required = false) String genre
    		) {
    	log.info("showBOList started. set genre : " + genre);
		
    	String cate = null;
		if(genre != null) {
			if(genre.toString().equals("musical")) {
				cate = "뮤지컬";
			} else if(genre.toString().equals("play")) {
				cate = "연극";
			} else if(genre.toString().equals("classic")) {
				cate = "클래식";
			}
		}
    	
    	List<BoxOfficeVO> result = readBOList(cate);

    	model.addObject("cate", cate);
		model.addObject("boList", result);
		model.setViewName("show/boList");

        return model;
    }
    
    public List<BoxOfficeVO> readBOList(String cate) {
    	log.info("readBOList started. set genre : " + cate);

    	List<BoxOfficeVO> result = null;
    	
    	result = service.getBOList(cate);
    	
    	return result;
    }

	@Scheduled(fixedDelay = 3600000)
	public void writeBOList() {
		log.info("writeBOList started. set delay : 3600000");
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
    	log.info("RestTemplate DONE!!");
    	int stat = -1;
    	int trunc = -1;
    	if(musicalBOList != null) {
	    	List<BoxOfficeVO> result = musicalBOList.getBoxInfo().subList(0, 10);
	    	List<BoxOfficeVO> pResult = playBOList.getBoxInfo().subList(0, 10);
	    	List<BoxOfficeVO> cResult = classicBOList.getBoxInfo().subList(0, 10);
	    	
	    	System.out.println("musical is not empty : " + !result.isEmpty());
	    	System.out.println("play appended : " + result.addAll(pResult));
	    	System.out.println("classic appended : " + result.addAll(cResult));
	    	
	    	log.info("List<VO> : " + result.toString());
	    	log.info("result.size() : " + result.size() + " -> 30? proceed");
	    	if(result.size() == 30) {
		    	trunc = service.truncateBO();
		    	stat = service.saveBO(result);
	    	} else {
	    		log.info("result.size() is less than 30");
	    	}
	    	log.info("truncateBO status : " + trunc);
	    	log.info("saveBO status : " + stat);
    	}
	}
}