package kr.or.ddit.vo;

import org.springframework.web.multipart.MultipartFile;

public class Project_noticeVO {
	private String rnum;
	private String prno_num;
	private String pr_num;
	private String prno_writer;
	private String prno_date;
	private String prno_hit;
	private String prno_title;
	private String prno_content;
	private String prno_status;
	private MultipartFile ntcFile;

	public String getPrno_status() {
		return prno_status;
	}
	public void setPrno_status(String prno_status) {
		this.prno_status = prno_status;
	}
	public MultipartFile getNtcFile() {
		return ntcFile;
	}
	public void setNtcFile(MultipartFile ntcFile) {
		this.ntcFile = ntcFile;
	}
	public String getRnum() {
		return rnum;
	}
	public void setRnum(String rnum) {
		this.rnum = rnum;
	}
	public String getPrno_num() {
		return prno_num;
	}
	public void setPrno_num(String prno_num) {
		this.prno_num = prno_num;
	}
	public String getPr_num() {
		return pr_num;
	}
	public void setPr_num(String pr_num) {
		this.pr_num = pr_num;
	}
	public String getPrno_writer() {
		return prno_writer;
	}
	public void setPrno_writer(String prno_writer) {
		this.prno_writer = prno_writer;
	}
	public String getPrno_date() {
		return prno_date;
	}
	public void setPrno_date(String prno_date) {
		this.prno_date = prno_date;
	}
	public String getPrno_hit() {
		return prno_hit;
	}
	public void setPrno_hit(String prno_hit) {
		this.prno_hit = prno_hit;
	}
	public String getPrno_title() {
		return prno_title;
	}
	public void setPrno_title(String prno_title) {
		this.prno_title = prno_title;
	}
	public String getPrno_content() {
		return prno_content;
	}
	public void setPrno_content(String prno_content) {
		this.prno_content = prno_content;
	}
}
