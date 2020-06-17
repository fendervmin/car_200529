package com.project.car.vo;

import java.util.Date;

public class NewsVO {

	private int news_Id;
	private String news_Title;
	private String news_Content;
	private String news_Url;
	private String news_Img;
	private Date news_Date;
	private int news_Count;
	
	public NewsVO() {}
	
	public NewsVO(int news_Id, String news_Title, String news_Content, String news_Url, String news_Img, Date news_Date, int news_Count) {
		super();
		this.news_Id = news_Id;
		this.news_Title = news_Title;
		this.news_Content = news_Content;
		this.news_Url = news_Url;
		this.news_Img = news_Img;
		this.news_Date = news_Date;
		this.news_Count = news_Count;
	}

	public String getNews_Img() {
		return news_Img;
	}
	public void setNews_Img(String news_Img) {
		this.news_Img = news_Img;
	}
	public int getNews_Id() {
		return news_Id;
	}
	public void setNews_Id(int news_Id) {
		this.news_Id = news_Id;
	}
	public String getNews_Title() {
		return news_Title;
	}
	public void setNews_Title(String news_Title) {
		this.news_Title = news_Title;
	}
	public String getNews_Content() {
		return news_Content;
	}
	public void setNews_Content(String news_Content) {
		this.news_Content = news_Content;
	}
	public String getNews_Url() {
		return news_Url;
	}
	public void setNews_Url(String news_Url) {
		this.news_Url = news_Url;
	}

	public Date getNews_Date() {
		return news_Date;
	}

	public void setNews_Date(Date news_Date) {
		this.news_Date = news_Date;
	}

	public int getNews_Count() {
		return news_Count;
	}

	public void setNews_Count(int news_Count) {
		this.news_Count = news_Count;
	}
	
	
}
