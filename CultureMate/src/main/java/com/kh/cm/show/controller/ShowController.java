package com.kh.cm.show.controller;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/show")
public class ShowController {
	
	private static String getTagValue(String tag, Element eElement) {
	    NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
	    Node nValue = (Node) nlList.item(0);
	    if(nValue == null) 
	        return null;
	    return nValue.getNodeValue();

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
				//System.out.println("파싱할 리스트 수 : "+ nList.getLength());
				
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
		model.addObject("max",array.length);
		model.setViewName("board/list");
		return model;
	}	// main end
	
	
	@RequestMapping(value = "/view", method = {RequestMethod.GET})
	public ModelAndView showview(ModelAndView model, String name) {
		
		String array  =  null; 
		String array1 =  null; 
		String array2 =  null; 
		String []array3 =  null; 
		
		try{
			// parsing할 url 지정(API 키 포함해서)
			
			String addr = "http://www.kopis.or.kr/openApi/restful/pblprfr/";
		    String serviceKey = "54aff7444a924def99fc5e93ad99952d";
		    String parameter = name + "?service=";
		        
		    String url = addr + parameter + serviceKey;
		        
			DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
			Document doc = dBuilder.parse(url);
			
			// 파싱할 tag
			NodeList nList = doc.getElementsByTagName("db");
			NodeList nList1 = doc.getElementsByTagName("styurl");

			//System.out.println(nList1.getLength());// 설명이미지 태그 수 
			//System.out.println("리스트 수 : "+ nList.getLength());
		
			// 배열 동적 할당
			array3 = new String[nList.getLength()];
			
			
				Node nNode = nList.item(0);
				if(nNode.getNodeType() == Node.ELEMENT_NODE){
					Element eElement = (Element) nNode;
					System.out.println("######################");
					System.out.println("제목  : " + getTagValue("prfnm", eElement));
					array = getTagValue("prfnm", eElement);
					System.out.println("위치  : " + getTagValue("fcltynm", eElement));
					array1 = getTagValue("fcltynm", eElement);
					System.out.println("가격 : " + getTagValue("pcseguidance", eElement));
					array2 = getTagValue("pcseguidance", eElement);
					
					//소개 이미지 
					for(int i = 0; i < nList1.getLength(); i++) {
						NodeList nNode1 = nList1.item(i).getChildNodes();
						Node nValue1 = (Node) nNode1.item(0);
						System.out.println("설명이미지 : " + nValue1.getNodeValue());
						array3[i] = nValue1.getNodeValue();
					}
					
			}	// if end
		
	} catch (Exception e){	
		e.printStackTrace();
	}	// try~catch end
		
		model.addObject("array", array);
		model.addObject("array1", array1);
		model.addObject("array2", array2);
		model.addObject("array3", array3);
		model.setViewName("board/view");
		return model;
	}
}
