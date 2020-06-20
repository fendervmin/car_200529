package com.project.car.vo;

public class BoardVO {
	
	private int p_id;
	private String p_title;
	private String p_content;
	private String p_time;
	private int member_id;
	private int p_view;
	public int getP_view() {
		return p_view;
	}
	public int getP_id() {
		return p_id;
	}
	public void setP_id(int p_id) {
		this.p_id = p_id;
	}
	public String getP_title() {
		return p_title;
	}
	public void setP_title(String p_title) {
		this.p_title = p_title;
	}
	public String getP_content() {
		return p_content;
	}
	public void setP_content(String p_content) {
		this.p_content = p_content;
	}
	@Override
	public String toString() {
		return "BoardVO [p_id=" + p_id + ", p_title=" + p_title + ", p_content=" + p_content + ", p_time=" + p_time
				+ ", member_id=" + member_id + ", p_view=" + p_view + "]";
	}
	public String getP_time() {
		return p_time;
	}
	public void setP_time(String p_time) {
		this.p_time = p_time;
	}
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	
	

	

}
