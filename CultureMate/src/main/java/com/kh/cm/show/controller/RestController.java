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

//import lombok.extern.slf4j.Slf4j;

//@Slf4j
@Controller
@RequestMapping("/show")
public class RestController {

    @RequestMapping(value = "/getShowList", method = RequestMethod.GET)
    public ModelAndView list(
    		ModelAndView model
//    		@RequestParam("genre") String genre
    		) {
    	String key = "fe0b63fcf599492aae0dc065406b676b";
    	
    	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
    	Calendar currDate = new GregorianCalendar();
    	Calendar nextDate = new GregorianCalendar();
    	nextDate.add(Calendar.MONTH, 1);

		String stdate = dateFormat.format(currDate.getTime());
		String eddate = dateFormat.format(nextDate.getTime());
		//	검색 함수에서도 이 방식으로 이용해서, radio 버튼으로 1주, 2주, 1달 선택하게 할 수 있을듯
		
//		String shcate = null;
//		if(genre.toString().equals("musical")) {
//			shcate = "AAAB";
//		} else if(genre.toString().equals("play")) {
//			shcate = "AAAA";
//		} else if(genre.toString().equals("classic")) {
//			shcate = "CCCA";
//		};

        StringBuilder urlBuilder = new StringBuilder("http://www.kopis.or.kr/openApi/restful/pblprfr");
        urlBuilder.append("?service=" + key);
        urlBuilder.append("&stdate=" + stdate);
        urlBuilder.append("&eddate=" + eddate);
        urlBuilder.append("&rows=10&cpage=1");
//        urlBuilder.append("&shcate=" + shcate);

        String url = urlBuilder.toString();

    	RestTemplate restTemplate = new RestTemplate();
    	ShowListVO showList = restTemplate.getForObject(url, ShowListVO.class);

    	List<ShowVO> result = showList.getShowInfo();

		model.addObject("showList", result);
		model.setViewName("show/showList");

        return model;
    }

    @ResponseBody
    @RequestMapping(value = "/ajaxShowList", method = RequestMethod.GET)
    public List<ShowVO> ajaxShowList(
    		@RequestParam("prfstate") String prfstate,
    		@RequestParam("shcate") String shcate
    		) {
		System.out.println("prfstate : " + prfstate + " / shcate : " + shcate);

		String key = "fe0b63fcf599492aae0dc065406b676b";
		String stdate = "20210401";
		String eddate = "20210501";

        StringBuilder urlBuilder = new StringBuilder("http://www.kopis.or.kr/openApi/restful/pblprfr");
        urlBuilder.append("?service=" + key);
        urlBuilder.append("&stdate=" + stdate);
        urlBuilder.append("&eddate=" + eddate);
        urlBuilder.append("&rows=99&cpage=1");
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
