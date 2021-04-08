package com.kh.cm.mkshow.model.vo;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="db")
@XmlAccessorType(XmlAccessType.FIELD)
public class PlaceDTO {

	@XmlElement(name = "mt10id")
    private String mt10id;
	
    @XmlElement(name="fcltynm")
    private String fcltynm;
    
    @XmlElement(name="opende")
    private String opende;
    
    @XmlElement(name="fcltychartr")
    private String fcltychartr;
    
    @XmlElement(name="seatscale")
    private String seatscale;
    
    @XmlElement(name="mt13cnt")
    private String mt13cnt;
    
    @XmlElement(name="telno")
    private String telno;
    
    @XmlElement(name="relateurl")
    private String relateurl;
    
    @XmlElement(name="adres")
    private String adres;
    
    @XmlElement(name="la")
    private String la;
    
    @XmlElement(name="lo")
    private String lo;

	public String getMt10id() {
		return mt10id;
	}

	public void setMt10id(String mt10id) {
		this.mt10id = mt10id;
	}

	public String getFcltynm() {
		return fcltynm;
	}

	public void setFcltynm(String fcltynm) {
		this.fcltynm = fcltynm;
	}

	public String getOpende() {
		return opende;
	}

	public void setOpende(String opende) {
		this.opende = opende;
	}

	public String getFcltychartr() {
		return fcltychartr;
	}

	public void setFcltychartr(String fcltychartr) {
		this.fcltychartr = fcltychartr;
	}

	public String getSeatscale() {
		return seatscale;
	}

	public void setSeatscale(String seatscale) {
		this.seatscale = seatscale;
	}

	public String getMt13cnt() {
		return mt13cnt;
	}

	public void setMt13cnt(String mt13cnt) {
		this.mt13cnt = mt13cnt;
	}

	public String getTelno() {
		return telno;
	}

	public void setTelno(String telno) {
		this.telno = telno;
	}

	public String getRelateurl() {
		return relateurl;
	}

	public void setRelateurl(String relateurl) {
		this.relateurl = relateurl;
	}

	public String getAdres() {
		return adres;
	}

	public void setAdres(String adres) {
		this.adres = adres;
	}

	public String getLa() {
		return la;
	}

	public void setLa(String la) {
		this.la = la;
	}

	public String getLo() {
		return lo;
	}

	public void setLo(String lo) {
		this.lo = lo;
	}
    
    
}
