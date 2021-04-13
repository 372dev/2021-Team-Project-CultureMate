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
	
	public String getRnum() {
		return rnum;
	}
	public void setRnum(String rnum) {
		this.rnum = rnum;
	}
	public String getCate() {
		return cate;
	}
	public void setCate(String cate) {
		this.cate = cate;
	}
	public String getPrfnm() {
		return prfnm;
	}
	public void setPrfnm(String prfnm) {
		this.prfnm = prfnm;
	}
	public String getPrfpd() {
		return prfpd;
	}
	public void setPrfpd(String prfpd) {
		this.prfpd = prfpd;
	}
	public String getPrfplcnm() {
		return prfplcnm;
	}
	public void setPrfplcnm(String prfplcnm) {
		this.prfplcnm = prfplcnm;
	}
	public String getSeatcnt() {
		return seatcnt;
	}
	public void setSeatcnt(String seatcnt) {
		this.seatcnt = seatcnt;
	}
	public String getPrfdtcnt() {
		return prfdtcnt;
	}
	public void setPrfdtcnt(String prfdtcnt) {
		this.prfdtcnt = prfdtcnt;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public String getMt20id() {
		return mt20id;
	}
	public void setMt20id(String mt20id) {
		this.mt20id = mt20id;
	}

	@Override
	public String toString() {
		return "BoxOfficeVO [rnum=" + rnum + ", cate=" + cate + ", prfnm=" + prfnm + ", prfpd=" + prfpd + ", prfplcnm="
				+ prfplcnm + ", seatcnt=" + seatcnt + ", prfdtcnt=" + prfdtcnt + ", area=" + area + ", poster=" + poster
				+ ", mt20id=" + mt20id + "]";
	}

}