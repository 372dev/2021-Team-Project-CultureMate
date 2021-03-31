package com.kh.cm.rest.model.vo;

import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="dbs")
public class ShowListVO {
	
    private List<ShowVO> showInfo;

    @XmlElement(name="db")
	public List<ShowVO> getShowInfo() {
		return showInfo;
	}

	public void setShowInfo(List<ShowVO> showInfo) {
		this.showInfo = showInfo;
	}

}
