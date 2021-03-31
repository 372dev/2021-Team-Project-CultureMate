package com.kh.cm.rest.model.service;

import java.util.List;

import com.kh.cm.rest.model.dao.ShowDAO;
import com.kh.cm.rest.model.vo.ShowList;

public interface ShowService {
	
	public List<ShowList> getShowList();
	
}
