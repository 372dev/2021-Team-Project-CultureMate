package com.kh.cm.box.model.vo;

import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="boxofs")
public class BoxOfficeListVO {
	
    private List<BoxOfficeVO> boxInfo;

    @XmlElement(name="boxof")
	public List<BoxOfficeVO> getBoxInfo() {
		return boxInfo;
	}

	public void setBoxInfo(List<BoxOfficeVO> boxInfo) {
		this.boxInfo = boxInfo;
	}

}
