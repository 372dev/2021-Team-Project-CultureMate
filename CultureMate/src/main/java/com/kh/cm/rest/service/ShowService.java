package com.kh.cm.rest.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cm.rest.dao.ShowDAO;
import com.kh.cm.rest.model.ShowList;

@Service
public class ShowService {

	@Autowired
	private ShowDAO showDao;
	
	public static List<ShowList> getShowList() {
		List<ShowList> showList = showDao.getShowList();
		return showList;
	}

}
