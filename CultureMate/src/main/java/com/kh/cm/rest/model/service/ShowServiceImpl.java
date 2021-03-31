package com.kh.cm.rest.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cm.rest.model.dao.ShowDAO;
import com.kh.cm.rest.model.vo.ShowList;

@Service
public class ShowServiceImpl implements ShowService {

	@Autowired
	private ShowDAO showDao;
	
	@Override
	public List<ShowList> getShowList() {
		List<ShowList> showList = showDao.getShowList();
		return showList;
	}

}
