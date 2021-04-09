package com.kh.cm.cs.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CsBoard {
	private int csBoardId;
	
	private int csWriteNo;
	
	private String Id;

	private String csTitle;
	
	private String csContent;
	
	private String csboardOriginalFileName;
	
	private String csboardRenamedFileName;
	
	private String csstatus;
	
	private Date csboardCreateDate;
	
	private int csReadCount;
	

}