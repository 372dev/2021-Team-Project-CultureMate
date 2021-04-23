package com.kh.cm.cs.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CsBoard {
	private int csboardId;
	
	private String csboardKind;
	
	private String csboardType;
	
	private int csboardWriterNo;
	
	private String userId;

	private String csboardTitle;
	
	private String csboardContent;
	
	private String csboardOriginalFile;
	
	private String csboardRenamedFile;
	
	private String status;
	
	private Date csboardCreateDate;
	
	private Date csboardModifyDate;
	
	

}