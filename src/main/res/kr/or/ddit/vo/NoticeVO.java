package kr.or.ddit.vo;

import org.springframework.web.multipart.MultipartFile;

public class NoticeVO {
	private String no_num;
	private String no_title;
	private String no_content;
	private String no_date;
	private String no_hit;
	private String no_status;
	private String rnum;
	private MultipartFile File;
	
	
	
	public MultipartFile getFile() {
		return File;
	}

	public void setFile(MultipartFile file) {
		File = file;
	}

	public String getNo_num() {
		return no_num;
	}
	
	public String getRnum() {
		return rnum;
	}

	public void setRnum(String rnum) {
		this.rnum = rnum;
	}

	public void setNo_num(String no_num) {
		this.no_num = no_num;
	}
	public String getNo_title() {
		return no_title;
	}
	public void setNo_title(String no_title) {
		this.no_title = no_title;
	}
	public String getNo_content() {
		return no_content;
	}
	public void setNo_content(String no_content) {
		this.no_content = no_content;
	}
	public String getNo_date() {
		return no_date;
	}
	public void setNo_date(String no_date) {
		this.no_date = no_date;
	}
	public String getNo_hit() {
		return no_hit;
	}
	public void setNo_hit(String no_hit) {
		this.no_hit = no_hit;
	}
	public String getNo_status() {
		return no_status;
	}
	public void setNo_status(String no_status) {
		this.no_status = no_status;
	}
	
}
