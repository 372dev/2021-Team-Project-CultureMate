package com.kh.cm.mkshow.model.vo;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="db")
@XmlAccessorType(XmlAccessType.FIELD)
public class ShowDTO {
	
	@XmlElement(name = "mt20id")
    private String mt20id;
	
    @XmlElement(name="mt10id")
    private String mt10id;
    
    @XmlElement(name="prfnm")
    private String prfnm;
  
    @XmlElement(name="prfpdfrom")
    private String prfpdfrom;
    
    @XmlElement(name="prfpdto")
    private String prfpdto;
    
    @XmlElement(name="fcltynm")
    private String fcltynm;
   
    @XmlElement(name="prfcast")
    private String prfcast;
    
    @XmlElement(name="prfcrew")
    private String prfcrew;
    
    @XmlElement(name="prfruntime")
    private String prfruntime;
    
    @XmlElement(name="prfage")
    private String prfage;
    
    @XmlElement(name="entrpsnm")
    private String entrpsnm;
    
    @XmlElement(name="pcseguidance")
    private String pcseguidance;
    
    @XmlElement(name="poster")
    private String poster;
    
    @XmlElement(name="sty")
    private String sty;
    
    @XmlElement(name="genrenm")
    private String genrenm;
    
    @XmlElement(name="prfstate")
    private String prfstate;
    
    @XmlElement(name="openrun")
    private String openrun;

    @XmlElement(name="styurls")
    ShowStyDTO styurls;
    
    @XmlElement(name="dtguidance")
    private String dtguidance;

	
    
    public ShowStyDTO getStyurls() {
		return styurls;
	}

	public void setStyurls(ShowStyDTO styurls) {
		this.styurls = styurls;
	}

	public String getMt20id() {
		return mt20id;
	}
	
	public void setMt20id(String mt20id) {
		this.mt20id = mt20id;
	}

	public String getMt10id() {
		return mt10id;
	}

	public void setMt10id(String mt10id) {
		this.mt10id = mt10id;
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

	public String getPrfcast() {
		return prfcast;
	}

	public void setPrfcast(String prfcast) {
		this.prfcast = prfcast;
	}

	public String getPrfcrew() {
		return prfcrew;
	}

	public void setPrfcrew(String prfcrew) {
		this.prfcrew = prfcrew;
	}

	public String getPrfruntime() {
		return prfruntime;
	}

	public void setPrfruntime(String prfruntime) {
		this.prfruntime = prfruntime;
	}

	public String getPrfage() {
		return prfage;
	}

	public void setPrfage(String prfage) {
		this.prfage = prfage;
	}

	public String getEntrpsnm() {
		return entrpsnm;
	}

	public void setEntrpsnm(String entrpsnm) {
		this.entrpsnm = entrpsnm;
	}

	public String getPcseguidance() {
		return pcseguidance;
	}

	public void setPcseguidance(String pcseguidance) {
		this.pcseguidance = pcseguidance;
	}

	public String getPoster() {
		return poster;
	}

	public void setPoster(String poster) {
		this.poster = poster;
	}

	public String getSty() {
		return sty;
	}

	public void setSty(String sty) {
		this.sty = sty;
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
	

	public String getDtguidance() {
		return dtguidance;
	}

	public void setDtguidance(String dtguidance) {
		this.dtguidance = dtguidance;
	}
    
    
    
}
