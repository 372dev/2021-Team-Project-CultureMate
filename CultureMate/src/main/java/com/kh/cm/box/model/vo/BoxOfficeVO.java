package com.kh.cm.box.model.vo;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="boxof")
@XmlAccessorType(XmlAccessType.FIELD)
public class BoxOfficeVO {
	@XmlElement(name="rnum")
	private String rnum;
	@XmlElement(name="cate")
	private String cate;
	@XmlElement(name="prfnm")
	private String prfnm;
	@XmlElement(name="prfpd")
	private String prfpd;
	@XmlElement(name="prfplcnm")
	private String prfplcnm;
	@XmlElement(name="seatcnt")
	private String seatcnt;
	@XmlElement(name="prfdtcnt")
	private String prfdtcnt;
	@XmlElement(name="area")
	private String area;
	@XmlElement(name="poster")
	private String poster;
	@XmlElement(name="mt20id")
    private String mt20id;

}