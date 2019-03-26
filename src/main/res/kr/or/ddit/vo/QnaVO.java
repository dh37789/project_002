package kr.or.ddit.vo;

import org.springframework.web.multipart.MultipartFile;

public class QnaVO {
	private String qa_num;
	private String mem_id;
	private String qa_hit;
	private String qa_title;
	private String qa_content;
	private String qa_date;
	private String qa_status;
	private String qa_depth;
	private String qa_group;
	private String qa_pass;
	private MultipartFile File;
	private String rnum;

	
	public String getRnum() {
		return rnum;
	}
	public void setRnum(String rnum) {
		this.rnum = rnum;
	}
	public void setFile(MultipartFile file) {
		File = file;
	}
	public String getQa_num() {
		return qa_num;
	}
	public void setQa_num(String qa_num) {
		this.qa_num = qa_num;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getQa_hit() {
		return qa_hit;
	}
	public void setQa_hit(String qa_hit) {
		this.qa_hit = qa_hit;
	}
	public String getQa_title() {
		return qa_title;
	}
	public void setQa_title(String qa_title) {
		this.qa_title = qa_title;
	}
	public String getQa_content() {
		return qa_content;
	}
	public void setQa_content(String qa_content) {
		this.qa_content = qa_content;
	}
	public String getQa_date() {
		return qa_date;
	}
	public void setQa_date(String qa_date) {
		this.qa_date = qa_date;
	}
	public String getQa_status() {
		return qa_status;
	}
	public void setQa_status(String qa_status) {
		this.qa_status = qa_status;
	}
	public String getQa_depth() {
		return qa_depth;
	}
	public void setQa_depth(String qa_depth) {
		this.qa_depth = qa_depth;
	}
	public String getQa_group() {
		return qa_group;
	}
	public void setQa_group(String qa_group) {
		this.qa_group = qa_group;
	}
	public String getQa_pass() {
		return qa_pass;
	}
	public void setQa_pass(String qa_pass) {
		this.qa_pass = qa_pass;
	}
	public MultipartFile getFile() {
		return File;
	}
	
}
