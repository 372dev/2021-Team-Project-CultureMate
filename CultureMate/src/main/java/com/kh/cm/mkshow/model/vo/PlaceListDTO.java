package com.kh.cm.mkshow.model.vo;

import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "dbs")
public class PlaceListDTO {

private List<PlaceDTO> placeInfo;
    
    @XmlElement(name="db")
    public List<PlaceDTO> getPlaceInfo() {
        return placeInfo;
    }
 
    public void setPlaceInfo(List<PlaceDTO> placeInfo) {
        this.placeInfo = placeInfo;
    }
    
}
