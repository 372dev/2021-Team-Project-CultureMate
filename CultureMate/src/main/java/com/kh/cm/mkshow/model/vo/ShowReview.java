package com.kh.cm.mkshow.model.vo;

import java.sql.Date;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ShowReview {
	private int reviewID;
	
	private String mt20id;
	
	private String reviewContent;
	
	private String reviewDate;
	
	private int likeCount;
	
	private int reviewRating;
	
	private String status;
	
	private int id;
	
	private String userNick;
	

}
