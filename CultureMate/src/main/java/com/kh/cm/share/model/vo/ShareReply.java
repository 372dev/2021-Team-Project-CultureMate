package com.kh.cm.share.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ShareReply {
	private int shareReplyId;
	
	private int shareId;
	
	private int shareReplyWriteId;
	
	private int shareReplyGroup;
	
	private int id;
	
	private String userNick;
	
	private String shareReplyContent;
	
    private Date shareReplyCreateDate;
	
    private Date shareReplyModifyDate;
    
    private String shareReplyStatus;
}
