package com.kh.cm.member.model.vo;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member implements UserDetails{

	private static final long serialVersionUID = 1L;

	private int id;
	
	private String userId;
	
	private String password;
	
	private String userNick;
	
	private String userName;
	
	private String userRole;
	
	private Date dateBirth;
	
	private String gender;
	
	private String email;
	
	private String phone;
	
	private String cardInfo;
	
	private String postcode;
	
	private String address;
	
	private String detailAddr;
	
	private String extraAddr;
	
	private String rank;
	
	private String status;
	
	
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		ArrayList<GrantedAuthority> authorities = new ArrayList<>();
		
		authorities.add(new SimpleGrantedAuthority(userRole));
		
		return authorities;
	}
	
	
	@Override
	public String getPassword() {
		return this.password;
	}
	
	
	@Override
	public String getUsername() {
		return this.userId;
	}
	
	
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}
	
	
	@Override
	public boolean isAccountNonLocked() {
		return true;
	}
	
	
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}
	
	
	@Override
	public boolean isEnabled() {
		return this.status.equals("Y");
	}

}
