package com.kh.cm.qna.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class QnaReply {
	private int qnaReId;
	
	private int qnaId;
	
	private String userId;
	
	private int replyWriterNo;
	
	private String qnaReContent;
	
	private String status;
	
	private String replyCreateDate;
	
	private Date replyModifyDate;
	
	

}
