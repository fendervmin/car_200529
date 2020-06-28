package com.project.car.vo;

public class AnswerVO {
	private int a_id;
	private int member_id;
	private int p_id;
	private String a_content;
	private String detect;
	
	public String getDetect() {
		return detect;
	}

	public void setDetect(String detect) {
		this.detect = detect;
	}

	@Override
	public String toString() {
		return "AnswerVO [a_id=" + a_id + ", member_id=" + member_id + ", p_id=" + p_id + ", a_content=" + a_content+",detect="+detect
				+ "]";
	}

	public int getA_id() {
		return a_id;
	}

	public void setA_id(int a_id) {
		this.a_id = a_id;
	}

	public int getMember_id() {
		return member_id;
	}

	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}

	public int getP_id() {
		return p_id;
	}

	public void setP_id(int p_id) {
		this.p_id = p_id;
	}

	public String getA_content() {
		return a_content;
	}

	public void setA_content(String a_content) {
		this.a_content = a_content;
	}

}
