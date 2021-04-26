package com.kh.cm.member.model.vo;

import java.util.UUID;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class TempKey {

	public String getKey() {
		UUID uuid = UUID.randomUUID();
		log.info(uuid.toString());
		
		String convertUuid = uuid.toString().substring(0, 8);
		
		return convertUuid;

	}
}
