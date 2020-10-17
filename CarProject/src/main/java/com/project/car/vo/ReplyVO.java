package com.project.car.vo;

import org.springframework.web.multipart.MultipartFile;

public class ReplyVO {
	
	    private int car_ID;
	    private int reply_id;
	    private int member_id;
	    private String reply_content;
	    
	    
	    
		@Override
		public String toString() {
			return "ReplyVO [reply_id=" + reply_id + ", member_id=" + member_id
					+ ", reply_content=" + reply_content + "]";
		}
		public int getCar_ID() {
			return car_ID;
		}
		public void setCar_ID(int car_ID) {
			this.car_ID = car_ID;
		}
		public int getReply_id() {
			return reply_id;
		}
		public void setReply_id(int reply_id) {
			this.reply_id = reply_id;
		}
		public int getMember_id() {
			return member_id;
		}
		public void setMember_id(int member_id) {
			this.member_id = member_id;
		}
		public String getReply_content() {
			return reply_content;
		}
		public void setReply_content(String reply_content) {
			this.reply_content = reply_content;
		}	
        
}
