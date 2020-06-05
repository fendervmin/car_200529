package com.project.car.vo;

public class GoodsVO {
	public class ProductVO {
	    private int carId;
	    private String carType;
	    private String fuelType;
	    private String carFuel;
	    private String carName;
	    private int carPrice;
        private int brandId;
        
       
		public int getCarId() {
			return carId;
		}
		public void setCarId(int carId) {
			this.carId = carId;
		}
		public String getCarType() {
			return carType;
		}
		public void setCarType(String carType) {
			this.carType = carType;
		}
		public String getFuelType() {
			return fuelType;
		}
		public void setFuelType(String fuelType) {
			this.fuelType = fuelType;
		}
		public String getCarFuel() {
			return carFuel;
		}
		public void setCarFuel(String carFuel) {
			this.carFuel = carFuel;
		}
		public String getCarName() {
			return carName;
		}
		public void setCarName(String carName) {
			this.carName = carName;
		}
		public int getCarPrice() {
			return carPrice;
		}
		public void setCarPrice(int carPrice) {
			this.carPrice = carPrice;
		}
		public int getBrandId() {
			return brandId;
		}
		public void setBrandId(int brandId) {
			this.brandId = brandId;
		}
        
        
	}
}
