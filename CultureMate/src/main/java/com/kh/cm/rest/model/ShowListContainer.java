package com.kh.cm.rest.model;

import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="dbs")
@XmlAccessorType(XmlAccessType.FIELD)
public class ShowListContainer {
    @XmlElement(name="db")
    private List<ShowList> showList;

	public ShowListContainer() {
		super();
	}

	public ShowListContainer(List<ShowList> showListContainer) {
		super();
		this.showList = showListContainer;
	}

	public List<ShowList> getShowList() {
		return showList;
	}

	public void setShowList(List<ShowList> showList) {
		this.showList = showList;
	}
    
}
