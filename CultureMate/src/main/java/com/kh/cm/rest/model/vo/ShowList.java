package com.kh.cm.rest.model.vo;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="db")
@XmlAccessorType(XmlAccessType.FIELD)
public class ShowList {
    @XmlElement(name="mt20id")
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
    
	public ShowList() {
		super();
	}
	
	public ShowList(String mt20id, String prfnm, String prfpdfrom, String prfpdto, String fcltynm, String poster,
			String genrenm, String prfstate, String openrun) {
		super();
		this.mt20id = mt20id;
		this.prfnm = prfnm;
		this.prfpdfrom = prfpdfrom;
		this.prfpdto = prfpdto;
		this.fcltynm = fcltynm;
		this.poster = poster;
		this.genrenm = genrenm;
		this.prfstate = prfstate;
		this.openrun = openrun;
	}

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
