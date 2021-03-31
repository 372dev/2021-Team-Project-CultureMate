package com.kh.cm.rest.model.vo;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="db")
@XmlAccessorType(XmlAccessType.FIELD)
public class ShowVO {
	@XmlAttribute(name="mt20id")
    private String mt20id;
    @XmlElement(name="prfnm")
    private String prfnm;
    @XmlElement(name="prfpdfrom")
    private String prfpdfrom;
    @XmlElement(name="prfpdto")
    private String prfpdto;
    @XmlElement(name="fcltynm")
    private String fcltynm;
    @XmlElement(name="poster")
    private String poster;
    @XmlElement(name="genrenm")
    private String genrenm;
    @XmlElement(name="prfstate")
    private String prfstate;
    @XmlElement(name="openrun")
    private String openrun;

	public String getMt20id() {
		return mt20id;
	}
	public void setMt20id(String mt20id) {
		this.mt20id = mt20id;
	}
	public String getPrfnm() {
		return prfnm;
	}
	public void setPrfnm(String prfnm) {
		this.prfnm = prfnm;
	}
	public String getPrfpdfrom() {
		return prfpdfrom;
	}
	public void setPrfpdfrom(String prfpdfrom) {
		this.prfpdfrom = prfpdfrom;
	}
	public String getPrfpdto() {
		return prfpdto;
	}
	public void setPrfpdto(String prfpdto) {
		this.prfpdto = prfpdto;
	}
	public String getFcltynm() {
		return fcltynm;
	}
	public void setFcltynm(String fcltynm) {
		this.fcltynm = fcltynm;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public String getGenrenm() {
		return genrenm;
	}
	public void setGenrenm(String genrenm) {
		this.genrenm = genrenm;
	}
	public String getPrfstate() {
		return prfstate;
	}
	public void setPrfstate(String prfstate) {
		this.prfstate = prfstate;
	}
	public String getOpenrun() {
		return openrun;
	}
	public void setOpenrun(String openrun) {
		this.openrun = openrun;
	}
    
}
