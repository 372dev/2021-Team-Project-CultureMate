package com.kh.cm.mkshow.model.vo;

import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "dbs")
public class ShowListDTO {

private List<ShowDTO> showInfo;
private List<ShowStyDTO> showInfo1;
    
    @XmlElement(name="db")
    public List<ShowDTO> getShowInfo() {
        return showInfo;
    }
 
    public void setShowInfo(List<ShowDTO> showInfo) {
        this.showInfo = showInfo;
    }
    
    @XmlElement(name="db.styurls")
    public List<ShowStyDTO> getInfo() {
        return showInfo1;
    }
 
    public void setInfo(List<ShowStyDTO> showInfo1) {
        this.showInfo1 = showInfo1;
    }
}
