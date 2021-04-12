package com.kh.cm.mate.model.vo;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;


@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Mate {
	private int mateId;
	
	private int mateWriteId;
	
	private int Id;
	
//	private String mt20id;
	
	private String userNick;
	
	private String mateShow;
	
	private String mateLoc;
	
	private String mateTitle;
	
	private String mateContent;	
	
	private Date mateCreateDate;
	
	private Date mateModifyDate;
	
	private String mateGender;
	
	private String mateAge;
	
	private String mateNum;
	
	private String mateOpen;
	
	private String mateStatus;
	
	private int mateCount;
	
	private List<MateReply> mateReplies;
	
}
