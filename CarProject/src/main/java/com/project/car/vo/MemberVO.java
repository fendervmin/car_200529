package com.project.car.vo;

import java.util.Date;

public class MemberVO {
	
	private int member_Id;
	private String member_UserId;
	private String member_Type;
	private String member_Name;
	private String member_Nicname;
	private String member_Pwd;
	private String member_Email;
	private Date member_In;
	private Date member_Out;
	private String domain;
	
	public MemberVO() {}
	
	public MemberVO(String member_UserId, String member_Pwd) {
		super();
		this.member_UserId = member_UserId;
		this.member_Pwd = member_Pwd;
	}



	public MemberVO(String member_UserId, String member_Name, String member_Email) {
		super();
		this.member_UserId = member_UserId;
		this.member_Name = member_Name;
		this.member_Email = member_Email;
	}
	

	public MemberVO(int member_Id, String member_UserId, String member_Name, String member_Email) {
		super();
		this.member_Id = member_Id;
		this.member_UserId = member_UserId;
		this.member_Name = member_Name;
		this.member_Email = member_Email;
	}

	public int getMember_Id() {
		return member_Id;
	}
	public void setMember_Id(int member_Id) {
		this.member_Id = member_Id;
	}
	public String getMember_UserId() {
		return member_UserId;
	}
	public void setMember_UserId(String member_UserId) {
		this.member_UserId = member_UserId;
	}
	public String getMember_Type() {
		return member_Type;
	}
	public void setMember_Type(String member_Type) {
		this.member_Type = member_Type;
	}
	public String getMember_Name() {
		return member_Name;
	}
	public void setMember_Name(String member_Name) {
		this.member_Name = member_Name;
	}
	public String getMember_Nicname() {
		return member_Nicname;
	}
	public void setMember_Nicname(String member_Nicname) {
		this.member_Nicname = member_Nicname;
	}
	public String getMember_Pwd() {
		return member_Pwd;
	}
	public void setMember_Pwd(String member_Pwd) {
		this.member_Pwd = member_Pwd;
	}
	public String getMember_Email() {
		return member_Email;
	}
	public void setMember_Email(String member_Email) {
		this.member_Email = member_Email;
	}
	public Date getMember_In() {
		return member_In;
	}
	public void setMember_In(Date member_In) {
		this.member_In = member_In;
	}
	public Date getMember_Out() {
		return member_Out;
	}
	public void setMember_Out(Date member_Out) {
		this.member_Out = member_Out;
	}
	public String getDomain() {
		return domain;
	}
	public void setDomain(String domain) {
		this.domain = domain;
	}

	@Override
	public String toString() {
		return "MemberVO [member_Id=" + member_Id + ", member_UserId=" + member_UserId + ", member_Type=" + member_Type
				+ ", member_Name=" + member_Name + ", member_Nicname=" + member_Nicname + ", member_Pwd=" + member_Pwd
				+ ", member_Email=" + member_Email + ", member_In=" + member_In + ", member_Out=" + member_Out
				+ ", domain=" + domain + "]";
	}
	
	
}