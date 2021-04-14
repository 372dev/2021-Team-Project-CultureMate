package com.kh.cm.member.model.vo;

import java.util.UUID;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class TempKey {
//	private boolean lowerCheck;
//	private int size;

	public String getKey() {
		UUID uuid = UUID.randomUUID();
		log.info(uuid.toString());
		
		String convertUuid = uuid.toString().substring(0, 7);
		
		return convertUuid;
		
//		this.size = size;
//		this.lowerCheck = lowerCheck;
//		return init();
	}
	
//	public String init() {
//		Random  ran = new Random();
//		StringBuffer sb = new StringBuffer();
//		int num = 0;
//		do {
//			num = ran.nextInt(75)+48;
//			if((num>=48 && num<=57) || (num>=65 && num<=90) || (num>=97 && num<=122)) {
//				sb.append((char)num);
//			}else {
//				continue;
//			}
//		} while (sb.length() < size);
//		if(lowerCheck) {
//			return sb.toString().toLowerCase();
//		}
//		return sb.toString();
//	}
}
