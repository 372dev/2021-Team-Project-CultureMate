package com.kh.cm.member.model.vo;

import java.io.UnsupportedEncodingException;

import javax.activation.DataSource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

public class MailHandler {
	private JavaMailSender mailSender;
	private MimeMessage msg;
	private MimeMessageHelper msgHelper;
	
	public MailHandler(JavaMailSender mailSender) throws MessagingException{
		this.mailSender = mailSender;
		msg = this.mailSender.createMimeMessage();
		msgHelper = new MimeMessageHelper(msg, true, "UTF-8");
	}
	
    // Email Title
    public void setSubject(String subject) throws MessagingException {
        msgHelper.setSubject(subject);
    }
    
    // Email Content(Text)
    public void setText(String htmlContent) throws MessagingException {
        msgHelper.setText(htmlContent, true);
    }
    
    // Sender Info
    public void setFrom(String email, String name) throws UnsupportedEncodingException, MessagingException {
        msgHelper.setFrom(email, name);
    }
    
    // Recipient Info
    public void setTo(String email) throws MessagingException {
        msgHelper.setTo(email);
    }
    
    //	자료형 변경하였음 Datasource -> FileSystemResource
    public void addInline(String cotentId, FileSystemResource file) throws MessagingException {
        msgHelper.addInline(cotentId, file);
    }

    public void send() {
    	try {
    		mailSender.send(msg);
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    }
}
