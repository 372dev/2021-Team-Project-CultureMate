package com.kh.cm.box.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.client.RestTemplate;

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

    public static List<BoxOfficeVO> readBOList() {
        return null;
    }
    
	@Scheduled(fixedDelay = 60000)
	public void writeBOList() {
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
    	if(musicalBOList != null) {
	    	List<BoxOfficeVO> result = musicalBOList.getBoxInfo().subList(0, 10);
	    	List<BoxOfficeVO> pResult = playBOList.getBoxInfo().subList(0, 10);
	    	List<BoxOfficeVO> cResult = classicBOList.getBoxInfo().subList(0, 10);
	    	System.out.println("musical : " + !result.isEmpty());
	    	System.out.println("play : " + result.addAll(pResult));
	    	System.out.println("classic : " + result.addAll(cResult));
	    	log.info("List<VO> : " + result.toString());
	    	stat = service.saveBO(result);
	    	log.info("saved : " + stat + " List<VO>.length : " + result.size());
	    	log.info("stat : " + stat);
    	}
	}
}