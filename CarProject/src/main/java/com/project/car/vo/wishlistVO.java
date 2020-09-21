package com.project.car.vo;

public class wishlistVO {
	
	private int car_id;
	private int member_id;
	
	public int getCar_id() {
		return car_id;
	}
	public void setCar_id(int car_id) {
		this.car_id = car_id;
	}
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public wishlistVO(int car_id, int member_id) {
		super();
		this.car_id = car_id;
		this.member_id = member_id;
	}
	public wishlistVO() {}

}
