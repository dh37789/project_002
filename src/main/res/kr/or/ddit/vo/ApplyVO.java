package kr.or.ddit.vo;

public class ApplyVO {
	private String ap_num;
	private String ap_free;
	private String ap_project;
	private String ap_payment;
	private String ap_date;
	private String ap_content;
	private String rnum;
	private String ap_status;
	
	public String getAp_status() {
		return ap_status;
	}
	public void setAp_status(String ap_status) {
		this.ap_status = ap_status;
	}
	
	
	public String getRnum() {
		return rnum;
	}
	public void setRnum(String rnum) {
		this.rnum = rnum;
	}
	public String getAp_num() {
		return ap_num;
	}
	public void setAp_num(String ap_num) {
		this.ap_num = ap_num;
	}
	public String getAp_free() {
		return ap_free;
	}
	public void setAp_free(String ap_free) {
		this.ap_free = ap_free;
	}
	public String getAp_project() {
		return ap_project;
	}
	public void setAp_project(String ap_project) {
		this.ap_project = ap_project;
	}
	public String getAp_payment() {
		return ap_payment;
	}
	public void setAp_payment(String ap_payment) {
		this.ap_payment = ap_payment;
	}
	public String getAp_date() {
		return ap_date;
	}
	public void setAp_date(String ap_date) {
		this.ap_date = ap_date;
	}
	public String getAp_content() {
		return ap_content;
	}
	public void setAp_content(String ap_content) {
		this.ap_content = ap_content;
	}
}
