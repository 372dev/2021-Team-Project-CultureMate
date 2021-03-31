package com.kh.cm.mate.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MateReply {
	private int mateReplyId;
	
	private int mateId;
	
	private int mateReplyeplyWriterId;
	
	private String Id;
	
	private String mateReplyContent;
	
    private Date mateReplyCreateDate;
	
    private Date mateReplyModifyDate;
}
