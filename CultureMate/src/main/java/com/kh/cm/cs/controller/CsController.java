package com.kh.cm.cs.controller;


import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cm.cs.model.service.CsBoardService;
import com.kh.cm.cs.model.vo.CsBoard;
import com.kh.cm.member.model.vo.Member;


import lombok.extern.slf4j.Slf4j;



@Slf4j
@Controller
@RequestMapping("/help")
public class CsController {
	@Autowired
	private CsBoardService service; 
	
	@RequestMapping(value = "/csmain", method = {RequestMethod.GET})
	public ModelAndView csmain (
			ModelAndView model,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember) {
		
		List<CsBoard> list = null;
		
		int boardCount = service.getCsBoardCount();

		
		  System.out.println(boardCount);
		
		list = service.getCsBoardList();
				
		model.addObject("csmain", list);
		model.setViewName("help/csmain");;
		return model;
	}
		
		@RequestMapping(value = "/notice", method = {RequestMethod.GET})
		public ModelAndView csnotice(ModelAndView model) {
			
			List<CsBoard> list =null;
			
			int boardCount = service.getnoticeBoardCount();
			
			  System.out.println(boardCount);

			
			list = service.getCsBoardList();
			
			model.addObject("notice", list);
			model.setViewName("help/notice");
			
			return model;
	}
		
		@RequestMapping(value = "/cswrite", method = {RequestMethod.GET})
		public void cswriteView() {
		}	
		
		@RequestMapping(value = "/cswrite", method = {RequestMethod.POST})
		public ModelAndView cswrite(
				@SessionAttribute(name = "loginMember", required = false) Member loginMember,
				HttpServletRequest request, CsBoard csboard,
				@RequestParam("upfile")MultipartFile upfile, ModelAndView model ) {
			
			System.out.println(csboard);
			
			int result = 0;
			
			if(loginMember.getUserId().equals(csboard.getUserId())) {
				csboard.setCsboardWriterNo(loginMember.getId());
				
			if(upfile != null && !upfile.isEmpty()) {
				
				String renameFile = saveFile(upfile, request);
				
				System.out.println(renameFile);
				
				if(renameFile != null) {
					csboard.setCsboardOriginalFile(upfile.getOriginalFilename());
					csboard.setCsboardRenamedFile(renameFile);
				}
			}
			
			 result = service.saveCsBoard(csboard);
			 
			 if (result>0) { 
				  model.addObject("msg", "게시글이 정상적으로 등록되었습니다.");
				  model.addObject("loaction", "/help/csmain");
			}else {
				model.addObject("msg", "게시글 등록을 실패하였습니다.");
				model.addObject("loaction", "/help/csmain");
			}
			 
			}else {
				model.addObject("msg", "잘못된 접근입니다.");
				model.addObject("loaction", "/");
			}
			
 		     model.setViewName("common/msg");
 		
 		return model;
 		
		}


		private String saveFile(MultipartFile file, HttpServletRequest request) {
			String originalFile = null;
			String renamePath = null;
			String renameFile = null;
			String rootPath = request.getSession().getServletContext().getRealPath("resources");
			String savePath = rootPath + "/upload/csboard";

			
			log.debug("Root Path : " + rootPath);
			log.debug("Save Path : " + savePath);
			
			// Save Path가 실제로 존재하지 않으면 폴더를 생성하는 목적
			File folder = new File(savePath);
			
			if(!folder.exists()){
	            folder.mkdirs(); // mkdirs 디렉토리 만들기	
			}
			
			originalFile = file.getOriginalFilename();
			renameFile = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMdd_HHmmssSSS")) //파일 중복되는 이름없게 날짜 지정해줌
	                + originalFile.substring(originalFile.lastIndexOf("."));
			
			renamePath = savePath + "/" + renameFile;
			
			try {
				// 업로드 한  파일 데이터를 지정한 파일에 저장한다.
				file.transferTo(new File(renamePath)); // 뒤에 지정된 파일 객체에 저장해주는 거다.
			} catch (IOException e) {
				System.out.println("파일 전송 에러 : " + e.getMessage());
				e.printStackTrace();
			}
			
			return renameFile;
		}
		

		
			
				
}
		


		
	
