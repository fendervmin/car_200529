package com.project.car.vo;

import java.util.Date;

public class NewsKeywordVO {
	public int key_id;
	public String keyword;
	public Date key_date;
	public int getKey_id() {
		return key_id;
	}
	public void setKey_id(int key_id) {
		this.key_id = key_id;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public Date getKey_date() {
		return key_date;
	}
	public void setKey_date(Date key_date) {
		this.key_date = key_date;
	}
	
	@Override
	public String toString() {
		return "NewsKeywordVO [key_id=" + key_id + ", keyword=" + keyword + ", key_date=" + key_date + "]";
	}
	
	

}
