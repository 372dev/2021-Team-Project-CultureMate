package com.kh.cm.mkshow.model.vo;

import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "dbs")
public class MemberListDTO {
	
	private List<MemberDTO> memberInfo;
    
    @XmlElement(name="db")
    public List<MemberDTO> getMemberInfo() {
        return memberInfo;
    }
 
    public void setMemberInfo(List<MemberDTO> memberInfo) {
        this.memberInfo = memberInfo;
    }
    
}
