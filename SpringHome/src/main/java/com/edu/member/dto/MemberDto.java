package com.edu.member.dto;

import java.util.Date;

//Bean Spec
public class MemberDto {

	private int no;
	private String name;
	private String email;
	private String password;
	private Date createDate;
	private Date modifyDate;
	
	public MemberDto() {
		super();
	}

	public MemberDto(int no, String name, String email
			, String password, Date createDate, Date modifyDate) {
		super();
		this.no = no;
		this.name = name;
		this.email = email;
		this.password = password;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getModifiedDate() {
		return modifyDate;
	}

	public void setModifiedDate(Date modifiedDate) {
		this.modifyDate = modifiedDate;
	}

	@Override
	public String toString() {
		return "MemberDto [no=" + no + ", name=" + name
				+ ", email=" + email + ", password=" + password
				+ ", createDate=" + createDate + ", modifyDate=" + modifyDate + "]";
	}
	
	
}