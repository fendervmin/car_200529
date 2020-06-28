package com.project.car.vo;

public class ReserveVO {
	private int resurve_id;
	private String user_id;
	private int brand_id;
	private String store_name;
	private String reserve_time;
	
	public ReserveVO() {}
	
	public ReserveVO(String user_id, int brand_id, String store_name, String reserve_time) {
		super();
		this.user_id = user_id;
		this.brand_id = brand_id;
		this.store_name = store_name;
		this.reserve_time = reserve_time;
	}

	public ReserveVO(int resurve_id, String user_id, int brand_id, String store_name, String reserve_time) {
		super();
		this.resurve_id = resurve_id;
		this.user_id = user_id;
		this.brand_id = brand_id;
		this.store_name = store_name;
		this.reserve_time = reserve_time;
	}

	public int getResurve_id() {
		return resurve_id;
	}
	public void setResurve_id(int resurve_id) {
		this.resurve_id = resurve_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getBrand_id() {
		return brand_id;
	}
	public void setBrand_id(int brand_id) {
		this.brand_id = brand_id;
	}
	public String getStore_name() {
		return store_name;
	}
	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}
	public String getReserve_time() {
		return reserve_time;
	}
	public void setReserve_time(String reserve_time) {
		this.reserve_time = reserve_time;
	}
	
}
