package com.project.car.vo;

import org.springframework.web.multipart.MultipartFile;

public class GoodsVO {
	    private int car_ID;
	    private String car_Type;
	    private String fuel_Type;
	    private String car_Fuel;
	    private String car_Name;
	    private int car_Price;
        private String car_Img;
        private int brand_Id;
        private String brand_Name;
        private String brand_Img;
		private String brand_Explain;
		
        
        public String getBrand_Img() {
			return brand_Img;
		}
		public void setBrand_Img(String brand_Img) {
			this.brand_Img = brand_Img;
		}
        
		public String getBrand_Explain() {
			return brand_Explain;
		}
		public void setBrand_Explain(String brand_Explain) {
			this.brand_Explain = brand_Explain;
		}
		public String getBrand_Name() {
			return brand_Name;
		}
		public void setBrand_Name(String brand_Name) {
			this.brand_Name = brand_Name;
		}
		public int getCar_ID() {
			return car_ID;
		}
		public void setCar_ID(int car_ID) {
			this.car_ID = car_ID;
		}
		public String getCar_Type() {
			return car_Type;
		}
		public void setCar_Type(String car_Type) {
			this.car_Type = car_Type;
		}
		public String getFuel_Type() {
			return fuel_Type;
		}
		public void setFuel_Type(String fuel_Type) {
			this.fuel_Type = fuel_Type;
		}
		public String getCar_Fuel() {
			return car_Fuel;
		}
		public void setCar_Fuel(String car_Fuel) {
			this.car_Fuel = car_Fuel;
		}
		public String getCar_Name() {
			return car_Name;
		}
		public void setCar_Name(String car_Name) {
			this.car_Name = car_Name;
		}
		public int getCar_Price() {
			return car_Price;
		}
		public void setCar_Price(int car_Price) {
			this.car_Price = car_Price;
		}
		public int getBrand_Id() {
			return brand_Id;
		}
		public void setBrand_Id(int brand_Id) {
			this.brand_Id = brand_Id;
		}
		public String getCar_Img() {
			return car_Img;
		}
		public void setCar_Img(String car_Img) {
			this.car_Img = car_Img;
		}
		
        
}
