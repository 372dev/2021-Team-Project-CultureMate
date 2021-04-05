package com.kh.cm.mkshow.controller;

import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.kh.cm.mkshow.model.vo.PlaceDTO;
import com.kh.cm.mkshow.model.vo.PlaceListDTO;
import com.kh.cm.mkshow.model.vo.ShowDTO;
import com.kh.cm.mkshow.model.vo.ShowListDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/show")
public class ShowController {
	
	// xml 태그의 값을 반환하는 함수
	private static String getTagValue(String tag, Element eElement) {
	    NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
	    Node nValue = (Node) nlList.item(0);
	    if(nValue == null) 
	        return null;
	    return nValue.getNodeValue();

	}
	
	//지도 위치 출력 위한 위도 경도 리턴 함수
	private static String[] getPlace(String mt10id) {
		
		String data[] = new String[2];
	
		String addr = "http://www.kopis.or.kr/openApi/restful/prfplc/";
	    String serviceKey = "54aff7444a924def99fc5e93ad99952d";
	    String parameter = mt10id + "?service=";

	    String uri = addr + parameter + serviceKey;
	   
	    
	    RestTemplate restTemplate = new RestTemplate();
        
        // 오브젝트로 결과값 받아오기
        PlaceListDTO placeList = restTemplate.getForObject(uri, PlaceListDTO.class);
       
        // 장소 정보
        List<PlaceDTO> result = placeList.getPlaceInfo();
        
        data[0] = result.get(0).getLa();
        data[1] = result.get(0).getLo();
       
        System.out.println("위도 : " + data[0]);
        System.out.println("경도 : " + data[1]);
        
		return data;
	}


	@RequestMapping(value = "/list", method = {RequestMethod.GET})
	public ModelAndView showlist(ModelAndView model) {
		String []array  = null; 
		String []array1 = null; 
		String []array2 = null; 
		String []array3 = null; 
		String []array4 = null; 
		
		try{
				// parsing할 url 지정(API 키 포함해서)
				String addr = "http://www.kopis.or.kr/openApi/restful/pblprfr?service=";
			    String serviceKey = "54aff7444a924def99fc5e93ad99952d";
			    String parameter = "";
			    
			    	parameter = parameter + "&" + "stdate=20210101";
				    parameter = parameter + "&" + "eddate=20210401";
				    parameter = parameter + "&" + "rows=10";
				    parameter = parameter + "&" + "cpage=1";
			        
			        String url = addr + serviceKey + parameter;
			        
				DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
				DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
				Document doc = dBuilder.parse(url);
				
				// root tag 
				doc.getDocumentElement().normalize();
				System.out.println("Root element :" + doc.getDocumentElement().getNodeName());
				
				// 파싱할 tag
				NodeList nList = doc.getElementsByTagName("db");
				System.out.println("파싱할 리스트 수 : "+ nList.getLength());
				
				//배열동적할당
				array  = new String[nList.getLength()];
				array1 = new String[nList.getLength()];
				array2 = new String[nList.getLength()];
				array3 = new String[nList.getLength()];
				array4 = new String[nList.getLength()];
				
				for(int temp = 0; temp < nList.getLength(); temp++){
					Node nNode = nList.item(temp);
				
					if(nNode.getNodeType() == Node.ELEMENT_NODE){
						Element eElement = (Element) nNode;
						array[temp] = getTagValue("prfnm", eElement);
						array1[temp] = getTagValue("prfpdfrom", eElement);
						array2[temp] = getTagValue("poster", eElement);
						array3[temp] = getTagValue("genrenm", eElement);
						array4[temp] = getTagValue("mt20id", eElement);
					}	// for end
				}	// if end
			
		} catch (Exception e){	
			e.printStackTrace();
		}	// try~catch end
		
		model.addObject("array", array);
		model.addObject("array1", array1);
		model.addObject("array2", array2);
		model.addObject("array3", array3);
		model.addObject("array4", array4);
		model.addObject("max",array.length-1);
		model.setViewName("board/list");
		return model;
	}	// main end
	

	
	@RequestMapping(value = "/restview", method = RequestMethod.GET)
    public ModelAndView showView(ModelAndView model, String name) {
        // Xml데이터를 response받을 API주소
		String addr = "http://www.kopis.or.kr/openApi/restful/pblprfr/";
	    String serviceKey = "54aff7444a924def99fc5e93ad99952d";
	    String parameter = name + "?service=";
		String[] place = new String[2];
		
	    String uri = addr + parameter + serviceKey;
         
        // RestTemplate 생성
        RestTemplate restTemplate = new RestTemplate();
         
        // 오브젝트로 결과값 받아오기
        ShowListDTO showList = restTemplate.getForObject(uri, ShowListDTO.class);
       
        // 공연 정보
        List<ShowDTO> result = showList.getShowInfo();
        
        System.out.println("0번쨰 이름 : " + result.get(0).getPrfnm());
        System.out.println("0배열 : " + result.get(0).getMt10id());
        
        place = getPlace(result.get(0).getMt10id());
        System.out.println("위도 : " + place[0]);
        System.out.println("경도 : " + place[1]);
        
       if(result.get(0).getStyurls() != null) { 
    	   int max = result.get(0).getStyurls().getStyurl().length;
    	   model.addObject("max", max);
       }
        
        model.addObject("place", place);
        model.addObject("prfruntimesize", result.get(0).getPrfruntime().length());
        model.addObject("pcseguidancesize", result.get(0).getPcseguidance().length());
        model.setViewName("board/view");
        model.addObject("result", result);
         
        return model;
    }
	
}
