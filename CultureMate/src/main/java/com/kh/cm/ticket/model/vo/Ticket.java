package com.kh.cm.ticket.model.vo;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Ticket {
	private int ticket_num;
	
	private String mt20id;
	
	private String prfnm;
	
	private String ticket_date;
	
	private int id;
	
	private String user_id;
	
	private int ticket_qty;
	
	private Date ticket_time;
	
	private Date change_time;
	
	private String pcseguidance;
	
	private String ticket_seat;
	
	private String ticket_status;
}


































