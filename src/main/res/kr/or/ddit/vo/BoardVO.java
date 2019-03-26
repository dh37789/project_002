package kr.or.ddit.vo;

import org.springframework.web.multipart.MultipartFile;

public class BoardVO {
	private String bo_num;
	private String mem_id;
	private String bo_hit;
	private String bo_title;
	private String bo_content;
	private String bo_date;
	private String bo_status;
	private MultipartFile File;
	private String rnum;

	
	
	public String getRnum() {
		return rnum;
	}
	public void setRnum(String rnum) {
		this.rnum = rnum;
	}
	public MultipartFile getFile() {
		return File;
	}
	public void setFile(MultipartFile file) {
		File = file;
	}
	public String getBo_num() {
		return bo_num;
	}
	public void setBo_num(String bo_num) {
		this.bo_num = bo_num;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getBo_hit() {
		return bo_hit;
	}
	public void setBo_hit(String bo_hit) {
		this.bo_hit = bo_hit;
	}
	public String getBo_title() {
		return bo_title;
	}
	public void setBo_title(String bo_title) {
		this.bo_title = bo_title;
	}
	public String getBo_content() {
		return bo_content;
	}
	public void setBo_content(String bo_content) {
		this.bo_content = bo_content;
	}
	public String getBo_date() {
		return bo_date;
	}
	public void setBo_date(String bo_date) {
		this.bo_date = bo_date;
	}
	public String getBo_status() {
		return bo_status;
	}
	public void setBo_status(String bo_status) {
		this.bo_status = bo_status;
	}
}
