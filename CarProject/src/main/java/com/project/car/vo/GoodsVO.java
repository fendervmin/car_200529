package com.project.car.vo;

import org.springframework.web.multipart.MultipartFile;

public class GoodsVO {
	    private int CAR_ID;
	    private String CART_YPE;
	    private String FUEL_TYPE;
	    private String CAR_FUEL;
	    private String CAR_NAME;
	    private int CAR_PRICE;
        private int BRAND_ID;
        private String pic_url;
        private MultipartFile file1;
        
		public String getPic_url() {
			return pic_url;
		}
		public void setPic_url(String pic_url) {
			this.pic_url = pic_url;
		}
		public MultipartFile getFile1() {
			return file1;
		}
		public void setFile1(MultipartFile file1) {
			this.file1 = file1;
		}
		public int getCAR_ID() {
			return CAR_ID;
		}
		public void setCAR_ID(int cAR_ID) {
			CAR_ID = cAR_ID;
		}
		public String getCART_YPE() {
			return CART_YPE;
		}
		public void setCART_YPE(String cART_YPE) {
			CART_YPE = cART_YPE;
		}
		public String getFUEL_TYPE() {
			return FUEL_TYPE;
		}
		public void setFUEL_TYPE(String fUEL_TYPE) {
			FUEL_TYPE = fUEL_TYPE;
		}
		public String getCAR_FUEL() {
			return CAR_FUEL;
		}
		public void setCAR_FUEL(String cAR_FUEL) {
			CAR_FUEL = cAR_FUEL;
		}
		public String getCAR_NAME() {
			return CAR_NAME;
		}
		public void setCAR_NAME(String cAR_NAME) {
			CAR_NAME = cAR_NAME;
		}
		public int getCAR_PRICE() {
			return CAR_PRICE;
		}
		public void setCAR_PRICE(int cAR_PRICE) {
			CAR_PRICE = cAR_PRICE;
		}
		public int getBRAND_ID() {
			return BRAND_ID;
		}
		public void setBRAND_ID(int bRAND_ID) {
			BRAND_ID = bRAND_ID;
		}
        
       
        
}
