package com.project.car.vo;



public class BoardVO {
	
	private int post_id;
	private String post_title;
	private String post_content;
	private String post_time;
	private int member_id;

	
	public int getPost_id() {
		return post_id;
	}
	
	public String getPost_time() {
		return post_time;
	}
	public int getMember_id() {
		return member_id;
	}
	public String getPost_title() {
		return post_title;
	}
	public void setPost_title(String post_title) {
		this.post_title = post_title;
	}
	public String getPost_content() {
		return post_content;
	}
	public void setPost_content(String post_content) {
		this.post_content = post_content;
	}
	
	
	
	

}
