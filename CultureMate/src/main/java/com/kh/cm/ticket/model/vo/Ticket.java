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
	
	private int mt20id;
	
	private int id;
	
	private String user_id;
	
	private int pi_num;
	
	private int ticket_qty;
	
	private Date ticket_time;
	
	private Date change_time;
	
	private String pspcseguidance;
	
	private String ticket_seat;
	
	private String ticket_status;
}


































