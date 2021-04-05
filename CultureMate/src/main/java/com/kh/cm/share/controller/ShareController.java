package com.kh.cm.share.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cm.common.util.PageInfo;
import com.kh.cm.share.model.service.ShareService;
import com.kh.cm.share.model.vo.Share;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/share")
public class ShareController {
	
	@Autowired
	private ShareService service;
	
	@Autowired
	private ResourceLoader resourceLoader;
	
//	@RequestMapping(value="/update", method = {RequestMethod.POST}) 
//	public String shareUpdate( ) {
//		return "board/share/shareUpdate";
//	}

	@RequestMapping(value="/list", method = {RequestMethod.GET}) 
	public ModelAndView shareList(ModelAndView model, 
				@RequestParam(value="page", required=false, defaultValue="1") int page,
				@RequestParam(value="listlimit", required=false, defaultValue="10") int listlimit) {
		
		List<Share> shareList = null;
		int shareCount = service.getShareCount();
		
		PageInfo pageInfo = new PageInfo(page, 10, shareCount, listlimit);
		
		shareList = service.getShareList(pageInfo);
		
		model.addObject("shareList", shareList);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("/board/share/shareList");
		
		return model;
	}
	
	@RequestMapping(value="/write", method = {RequestMethod.GET}) 
	public String shareWriteView( ) {
		return "board/share/shareWrite";
	}
	
	@RequestMapping(value="/write", method = {RequestMethod.POST}) 
	public ModelAndView shareWrite(ModelAndView model,
			@SessionAttribute(name="loginMember", required=false) Member loginMember,
			HttpServletRequest request, Share share,
					@RequestParam("upfile") MultipartFile upfile) {
		
		int result = 0;
		
		if(loginMember.getId().equals(share.getId())) {
				share.setShareWriterId(loginMember.getId());
				
				if(upfile != null && !upfile.isEmpty()) {
			
			String renameFileName = saveFile(upfile,request);
			
			System.out.println(renameFileName);
			
			if(renameFileName != null) {
				share.setShareOriginalFileName(upfile.getOriginalFilename());
				share.setShareRenamedFileName(renameFileName);
			}
		}
		
		result = service.saveShare(share);
		
		if(result > 0) {
			model.addObject("msg", "나눔글 등록에 성공했습니다.");
			model.addObject("location", "/share/list");
		} else {
			model.addObject("msg", "나눔글 등록에 실패했습니다.");
			model.addObject("location", "/share/list");
		}
	} else {
		model.addObject("msg", "잘못된 접근입니다.");
		model.addObject("location", "/");
		
	}	
		model.setViewName("/common/msg");
		
		return model;
}

	@RequestMapping(value="/fileDown", method ={RequestMethod.GET})
	public ResponseEntity<Resource> fileDown(
		@RequestParam("oriname") String oriname, @RequestParam("rename")String rename
		,@RequestHeader(name ="user-agent") String header) {
	
	try {
		Resource resource = resourceLoader.getResource("resources/upload/board/" + rename);
		File file = resource.getFile();
		boolean isMSIE = header.indexOf("MSIE") != -1 || header.indexOf("Trident") != -1;
		String encodeRename = "";
		
	//	if(!file.exists()) {
	//		
	//	}
		
		if(isMSIE) {
			encodeRename = URLEncoder.encode(oriname, "UTF-8");
			encodeRename = encodeRename.replaceAll("\\+", "%20");
		} else { 
			encodeRename = new String(oriname.getBytes("UTF-8"), "ISO-8859-1");			
		}		
		
		return ResponseEntity.ok() 
				.header(HttpHeaders.CONTENT_DISPOSITION, "attachment;filename=\"" + encodeRename + "\"")
				.header(HttpHeaders.CONTENT_LENGTH, String.valueOf(file.length()))
				.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_OCTET_STREAM.toString())
				.body(resource);
	} catch (IOException e) {
		e.printStackTrace();					
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
	} 
		
	}

	private String saveFile(MultipartFile upfile, HttpServletRequest request) {
		
		return null;
	}

	@RequestMapping(value="/update", method = {RequestMethod.GET}) 
	public ModelAndView shareUpdateView(ModelAndView model, @RequestParam("shareId") int shareId) {
		Share share = service.findShareByShareId(shareId);
		
		model.addObject("share", share);
		model.setViewName("/board/share/shareUpdate");
		
		return model;
	}
	

	@RequestMapping(value="/update", method = {RequestMethod.POST}) 
	public ModelAndView shareUpdate(ModelAndView model, @RequestParam("reloadFile")) {
		return "board/share/shareUpdate";
	}
	
	@RequestMapping(value="/view", method = {RequestMethod.GET}) 
	public ModelAndView shareView(@RequestParam("shareId")int shareId, ModelAndView model) {
		Share share = service.findShareByShareId(shareId);
		
		model.addObject("share", share);
		model.setViewName("/board/share/shareView");
		
		return model;
	}
}
