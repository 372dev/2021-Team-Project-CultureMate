package com.kh.cm.cs.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CsBoard {
	private int qnaBoardId;
	
	private int qnaBoardWriteNo;

	private String qnaTitle;
	
	private String qnaContent;
	
	private Date qnaDate;
	
	private String status;
	
	private int qnaReadCount;
	

}