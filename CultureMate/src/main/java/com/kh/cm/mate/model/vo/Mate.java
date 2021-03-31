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
	
	private int mateWriterId;
	
	private int Id;
	
	private String mateTitle;
	
	private String mateContent;	
	
	private Date mateCreateDate;
	
	private Date mateModifyDate;
	
	private String mateGender;
	
	private String mateNum;
	
	private String mateOpen;
	
	private String mateStatus;
	
	private String mateCount;
	
	private List<MateReply> mateReplies;
	
}
