package com.kh.cm.ticket.model.service;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.imageio.ImageIO;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageConfig;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import com.kh.cm.common.util.PageInfo;
import com.kh.cm.member.model.vo.MailHandler;
import com.kh.cm.member.model.vo.Member;
import com.kh.cm.ticket.model.dao.TicketDao;
import com.kh.cm.ticket.model.vo.Ticket;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class TicketServiceImpl implements TicketService{
	@Autowired
	private TicketDao ticketdao;
	
	@Autowired
	private JavaMailSender mailSender;
	
	public int saveTicket(Ticket ticket) {
		int result = 0;
		
		result = ticketdao.insertTicket(ticket);
		
		return result;
	}

	@Override
	public int countTicket(int id) {
	
		int result = ticketdao.countTicket(id);
		
		return result;
	}

	@Override
	public int updateRank02(int id) {
		int result = ticketdao.updateRank02(id);
		
		return result;
	}

	@Override
	public int updateRank03(int id) {
		int result = ticketdao.updateRank03(id);
		
		return result;
	}

	@Override
	public Member findMemberByUserId(String userId) {
		
		return ticketdao.selectMember(userId);
	}

	@Override
	public int getTicketCount(int id) {
		
		return ticketdao.countTicket(id);
	}

	@Override
	public List<Ticket> getTicketList(PageInfo pageInfo, int id) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit(); 
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		
		return ticketdao.selectTicketList(rowBounds, id);
	}

	@Override
	public int deleteTicket(int ticket_num) {
		int result = ticketdao.deleteTicket(ticket_num);
		
		return result;
	}

	@Override
	public int updateRankDefault(int id) {
		int result = ticketdao.updateRankDefault(id);
		
		return result;
	}


	@Override
	public int showAllCount() {
		
		return ticketdao.showCount();
	}

	@Override
	public List<Ticket> getTiketAllList(PageInfo pageInfo) {
		
		return ticketdao.showAllList(pageInfo);
	}

	@Override
	public int ticketSearchCount(String search, String keyword) {

		return ticketdao.selectSearchCount(search, keyword);
	}

	@Override
	public List<Ticket> ticketSearchList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		
		return ticketdao.selectSearchList(rowBounds, pageInfo);
	}
	
	@Override
	public void createQR(String ticketId, HttpServletRequest request) {
		boolean saveResult = false;
	    String rootPath = request.getSession().getServletContext().getRealPath("resources");
		String savePath = rootPath + "/qr/"; 

		File folder = new File(savePath);

		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		int codeColor = 0xFF9db81f;
		int bgColor = 0xFFFFFFFF;
		
		QRCodeWriter qrCodeWriter = new QRCodeWriter();  
	    BitMatrix bitMatrix;
		try {
			bitMatrix = qrCodeWriter.encode("CultureMate - We can do it! - Ticket Id : " + ticketId, BarcodeFormat.QR_CODE, 350, 350);
	    
			MatrixToImageConfig matrixToImageConfig = new MatrixToImageConfig(codeColor,bgColor); 
			BufferedImage bufferedImage = MatrixToImageWriter.toBufferedImage(bitMatrix,matrixToImageConfig);

			String fileName = ticketId;
			
			File temp =  new File(savePath + fileName+".png");  
			
			saveResult = ImageIO.write(bufferedImage, "png", temp);
			
		} catch (WriterException e1) {
			e1.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} 
			log.info("QR result : " + saveResult);
	}

	@Override
	public void sendTicket(Ticket ticket, String email, HttpServletRequest request) {
	    String rootPath = request.getSession().getServletContext().getRealPath("resources");
		String savePath = rootPath + "/qr/";
		
		log.info("entered service - sendTicket()");
		log.info("ticketId : " + ticket.getTicket_num());
		log.info("user email : " + email);
		
		MailHandler sendMail;
		try {
			String fileName = ticket.getTicket_num() + ".png";
			FileSystemResource file = new FileSystemResource(new File(savePath + fileName));
			FileSystemResource logo = new FileSystemResource(new File(rootPath + "/images/logo.png"));

			sendMail = new MailHandler(mailSender);
			sendMail.setSubject("[컬쳐메이트] 예매확인서 - " + ticket.getPrfnm() + " (" + ticket.getTicket_date() + ")");
			sendMail.setText(new StringBuffer()
					.append("<img width=\"424\" height=\"55\" alt=\"Culture Mate\" src=\"cid:")
					.append("logo.png")
					.append("\">")
					.append("<h2>컬쳐메이트를 이용해주셔서 감사합니다!</h2>")
					.append("<h3>예매확인서</h3><h5>아래 예매확인서와 함께 신분증을 꼭 지참하셔서 공연장 매표소에서 티켓을 수령해 주세요.<br>문의사항이 있는 경우 컬쳐메이트 온라인 고객센터 혹은 문의전화 1577-1234로 연락 주시면 즉각 도와 드리겠습니다</h5>")
					.append("<table border=\"1\" style=\"border-collapse:collapse;\"><tr><th style=\"width:100px;\">예매번호</th><td style=\"width:250px;\">")
					.append(ticket.getTicket_num())
					.append("</td></tr><tr><th>공연명</th><td>")
					.append(ticket.getPrfnm())
					.append("</td></tr><tr><th>공연날짜</th><td>")
					.append(ticket.getTicket_date())
					.append("</td></tr><tr><th>인원수</th><td>")
					.append(ticket.getTicket_qty())
					.append("</td></tr><tr><th>티켓가격</th><td>")
					.append(ticket.getPcseguidance())
					.append("</td></tr><tr><th>좌석정보</th><td>")
					.append(ticket.getTicket_seat())
					.append("</td></tr><tr><td colspan=\"2\"><img alt=\"QR이 보이지 않는 경우 고객센터에 문의해 주세요\" src=\"cid:")
					.append(fileName)
					.append("\"></td></tr></table>")
					.toString());
			sendMail.addInline(fileName, file);
			sendMail.addInline("logo.png", logo);
			sendMail.setFrom("CultureMate", "컬쳐메이트");
			sendMail.setTo(email);
			sendMail.send();
			log.info("the ticket has been mailed succesfully");
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

}