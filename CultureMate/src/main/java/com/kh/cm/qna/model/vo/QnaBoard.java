package com.kh.cm.qna.model.vo;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class QnaBoard {
	private int qnaId;
	
	private int qnaWriterNo;
	
	private String userId;
	
	private String qnaType;
	
	private String qnaTitle;
	
	private String qnaContent;
	
	private Date qnaCreateDate;
	
	private String status;
	
	private List<QnaReply> replies;
	
	
		



}
