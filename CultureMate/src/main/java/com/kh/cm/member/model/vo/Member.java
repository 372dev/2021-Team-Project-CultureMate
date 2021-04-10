package com.kh.cm.member.model.vo;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	
	private int id;
	
	private String userId;
	
	private String password;
	
	private String userNick;
	
	private String userName;
	
	private String userRole;
	
	private Date dateBirth;
	
	private String gender;
	
	private String email;
	
	private String phone;
	
	private String postcode;
	
	private String address;
	
	private String detailAddr;
	
	private String extraAddr;
	
	private String rank;
	
	private String status;
	
	private String authkey;
	
}
