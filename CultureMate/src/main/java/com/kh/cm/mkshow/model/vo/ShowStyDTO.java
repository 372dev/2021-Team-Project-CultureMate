package com.kh.cm.mkshow.model.vo;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="styurls")
@XmlAccessorType(XmlAccessType.FIELD)
public class ShowStyDTO {
	 	
		@XmlElement(name = "styurl")
	    String[] styurl;

		public String[] getStyurl() {
			return styurl;
		}

		public void setStyurl(String[] styurl) {
			this.styurl = styurl;
		}

		
	     
	    
}
