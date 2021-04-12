package com.kh.cm.share.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cm.common.util.PageInfo;
import com.kh.cm.member.model.vo.Member;
import com.kh.cm.share.model.service.ShareService;
import com.kh.cm.share.model.vo.Share;
import com.kh.cm.share.model.vo.ShareReply;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/share")
public class ShareController {
	
	@Autowired
	private ShareService service;
	
	@Autowired
	private ResourceLoader resourceLoader;
	
	@RequestMapping(value="/write", method = {RequestMethod.GET}) 
	public String shareWriteView( ) {
		return "board/share/shareWrite";
	}	

	@RequestMapping(value="/list", method = {RequestMethod.GET}) 
	public ModelAndView shareList(ModelAndView model,
				@RequestParam(value="page", required=false, defaultValue="1") int page,
				@RequestParam(value="listlimit", required=false, defaultValue="10") int listLimit) {
		
		
		
		List<Share> shareList = null;
		
		int shareCount = service.getShareCount();
		
		PageInfo pageInfo = new PageInfo(page, 10, shareCount, listLimit);
		
		shareList = service.getShareList(pageInfo);
		
		model.addObject("shareList", shareList);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("/board/share/shareList");
		
		return model;
	}
	
//	@RequestMapping(value="/list.do", method = {RequestMethod.POST}) 
//	public ModelAndView shareFindList(ModelAndView model, Share share,
//				@RequestParam(value="page", required=false, defaultValue="1") int page,
//				@RequestParam(defaultValue="userNick") String searchShare,@RequestParam(defaultValue="") String keyword,
//				@RequestParam(value="listlimit", required=false, defaultValue="10") int listLimit)  throws Exception{
//		//@RequestParam("userNick") String userNick, @RequestParam("shareTitle") String shareTitle, @RequestParam("shareContent") String shareContent,
//
//		List<Share> shareList = null;
//		
//		int shareCount = service.getShareCount();
//		
//		PageInfo pageInfo = new PageInfo(page, 10, shareCount, listLimit);
//		int start = pageInfo.getStartList();
//        int end =  pageInfo.getEndList();
//        
//        shareList = service.getFindShare(searchShare, keyword, start, end);
//        
//        Map<String,Object> map = new HashMap<>();    //넘길 데이터가 많기 때문에 해쉬맵에 저장한 후에 modelandview로 값을 넣고 페이지를 지정
//        
//        map.put("shareList", shareList);                         //map에 list(게시글 목록)을 list라는 이름의 변수로 자료를 저장함.
//        map.put("pageInfo", pageInfo);
//        map.put("shareCount", shareCount);
//        map.put("searchShare", searchShare);
//        map.put("keyword", keyword);
//        
//        model.addObject("map", map);         
//					
//		model.setViewName("board/share/shareList");
//		return model;
//	}
	
	@RequestMapping(value="/view", method = {RequestMethod.GET}) 
	public ModelAndView shareView(@RequestParam("shareId")int shareId, ModelAndView model,
			@RequestParam(value="page", required=false, defaultValue="1") int page,
			@RequestParam(value="listlimit", required=false, defaultValue="3") int listLimit) {
		Share share = service.findShareByShareId(shareId);
		
//		List<ShareReply> shareReplies = service.findShareReplyByShareId(shareId);
		boolean updateShareCount = service.updateShareCount(shareId);
		int shareReplyCount = service.getShareReplyCount(shareId);
		
		PageInfo pageInfo = new PageInfo(page, 5, shareReplyCount, 3);
		List<ShareReply> shareReplies = service.findShareReplyByShareId(shareId, pageInfo);
		
//		shareReplies = service.findShareReplyByShareId(pageInfo);
			
		model.addObject("share", share);
		model.addObject("shareReplies", shareReplies);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("/board/share/shareView");
		
		System.out.println(shareReplies);
		
		return model;
	}

	
	
	@RequestMapping(value="/write", method = {RequestMethod.POST}) 
	public ModelAndView shareWrite(ModelAndView model,
			@SessionAttribute(name="loginMember", required=false) Member loginMember,
			HttpServletRequest request, Share share,
					@RequestParam("upfile") MultipartFile upfile) {
		
		int result = 0;
				
		if(loginMember.getUserNick().equals(share.getUserNick())) {
			share.setShareWriteId(loginMember.getId());
				
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

	private String saveFile(MultipartFile file, HttpServletRequest request) {
		String rootPath = request.getSession().getServletContext().getRealPath("resources");
		String savePath = rootPath + "/upload/board"; 
		String originalFileName = file.getOriginalFilename();
		String renameFileName = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yy-MM-dd_HHmmss")) + 
				originalFileName.substring(originalFileName.lastIndexOf("."));
		String renamePath = savePath + "/" + renameFileName;
		

		log.debug("Root Path : " + rootPath);
		log.debug("Save Path : " + savePath);

		File folder = new File(savePath);

		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		try {
			file.transferTo(new File(renamePath));
		} catch (IOException e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
			e.printStackTrace();
		}


		return renameFileName;
	}

	@RequestMapping(value="/update", method = {RequestMethod.GET}) 
	public ModelAndView shareUpdateView(ModelAndView model, @RequestParam("shareId") int shareId) {
		Share share = service.findShareByShareId(shareId);
		
		model.addObject("share", share);
		model.setViewName("/board/share/shareUpdate");
		
		return model;
	}
	

	@RequestMapping(value="/update", method = {RequestMethod.POST}) 
	public ModelAndView shareUpdate(@SessionAttribute(name = "loginMember", required=false) Member loginMember, Share share, ModelAndView model,@RequestParam("reloadFile") MultipartFile reloadFile, HttpServletRequest request) {
		
		int result = 0;
		
		if(loginMember.getUserNick().equals(loginMember.getUserNick())) {
			if(reloadFile != null && !reloadFile.isEmpty()) {
				if(share.getShareRenamedFileName() != null) {
					deleteFile(share.getShareRenamedFileName(), request);
				} 
				String renameFileName = saveFile(reloadFile, request); // 기존에 파일이 없었으면 그냥 save
				
				if(renameFileName != null) {
					share.setShareOriginalFileName(reloadFile.getOriginalFilename());
					share.setShareRenamedFileName(renameFileName);
				}
			}
			
			result = service.saveShare(share);
			
			if(result > 0) {
				model.addObject("msg", "게시글이 정상적으로 수정되었습니다.");
				model.addObject("location", "/share/view?shareId=" + share.getShareId());
			} else {
				model.addObject("msg", "게시글 수정에 실패하였습니다.");
				model.addObject("location", "/share/list");
			}
		} else {
			model.addObject("msg", "잘못된 접근입니다.");
			model.addObject("location", "/");
		}
		
		model.setViewName("common/msg");
				
		return model;
	}
	
	private void deleteFile(String fileName, HttpServletRequest request) {
		String rootPath = request.getSession().getServletContext().getRealPath("resources");
		String savePath = rootPath + "/upload/board"; 
		
		log.debug("Root Path : " + rootPath);
		log.debug("Save Path : " + savePath);
		
		File file = new File(savePath + "/" + fileName);
		
		if(file.exists()) {
			file.delete();
		}
		
	}
	
	@RequestMapping(value ="/delete", method ={RequestMethod.GET})
	private ModelAndView delete(ModelAndView model, @RequestParam("shareId") int shareId ) {
		int result = 0;
		
		result = service.deleteShare(shareId);
		
		if(result > 0) {
			model.addObject("msg", "게시글이 삭제되었습니다.");
			model.addObject("location", "/share/list");
		} else {
			model.addObject("msg", "게시글 삭제에 실패했습니다.");
			model.addObject("location", "/");
		}
		model.setViewName("common/msg");
		
		return model;
	}
	
	@RequestMapping(value = "/reply/write", method={RequestMethod.POST})
	public ModelAndView writeReply(@SessionAttribute(name = "loginMember", required=false) Member loginMember,
				@RequestParam(name ="shareId") int shareId,@RequestParam(name ="writer") String writer,
				@RequestParam(name ="content") String content, ShareReply shareReply,
				ModelAndView model) {
		int result = 0;
		
		if(loginMember.getUserNick().equals(writer)) {
			shareReply.setShareId(shareId);
			shareReply.setShareReplyContent(content);
			shareReply.setShareReplyWriteId(loginMember.getId());
			
			result = service.saveShareReply(shareReply);
			
			if(result > 0) {
				model.addObject("msg", "댓글 등록에 성공했습니다.");
				model.addObject("location", "/share/view?shareId=" + shareReply.getShareId());
			} else {
				model.addObject("msg", "댓글 등록에 실패했습니다.");
				model.addObject("location", "/share/list");
				
			}
		} else {
			model.addObject("msg", "잘못된 접근입니다.");
			model.addObject("location", "/share/list");
		}
		
		model.setViewName("common/msg");
		return model;
	}
	
	@RequestMapping(value ="/reply/delete", method ={RequestMethod.GET})
	public ModelAndView deleteReply(ModelAndView model, ShareReply shareReply , @RequestParam(name="shareReplyId") int shareReplyId
			, @RequestParam(name="shareId") int shareId) {
		// @RequestParam(name ="boardNO") ,defaultValue="207"
		int result = 0;
		
		result = service.deleteShareReply(shareReplyId);
		
		if(result > 0) {
			
			model.addObject("msg", "댓글이 삭제되었습니다.");
			model.addObject("location", "/share/view?shareId=" + shareId);
		} else {
			model.addObject("msg", "댓글 삭제에 실패했습니다.");
			model.addObject("location", "/share/list");
		}
		model.setViewName("common/msg");
		
		return model;
	}
	

}
