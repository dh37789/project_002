package kr.or.ddit.vo;

import org.springframework.web.multipart.MultipartFile;

public class PortfolioVO {
	private String po_num;
	private String mem_id;
	private String pr_num;
	private String po_cate_num;
	private String po_title;
	private String po_content;
	private String po_start;
	private String po_end;
	private String po_tech;
	private String po_status;
	private String po_repre;
	private String part_num;
	private String po_percent;
	private String po_explainfile;
	
	private MultipartFile portFile;
	
	public String getPo_status() {
		return po_status;
	}
	public void setPo_status(String po_status) {
		this.po_status = po_status;
	}
	public String getPo_num() {
		return po_num;
	}
	public void setPo_num(String po_num) {
		this.po_num = po_num;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getPr_num() {
		return pr_num;
	}
	public void setPr_num(String pr_num) {
		this.pr_num = pr_num;
	}
	public String getPo_cate_num() {
		return po_cate_num;
	}
	public void setPo_cate_num(String po_cate_num) {
		this.po_cate_num = po_cate_num;
	}
	public String getPo_title() {
		return po_title;
	}
	public void setPo_title(String po_title) {
		this.po_title = po_title;
	}
	public String getPo_content() {
		return po_content;
	}
	public void setPo_content(String po_content) {
		this.po_content = po_content;
	}
	public String getPo_start() {
		return po_start;
	}
	public void setPo_start(String po_start) {
		this.po_start = po_start;
	}
	public String getPo_end() {
		return po_end;
	}
	public void setPo_end(String po_end) {
		this.po_end = po_end;
	}
	public String getPo_tech() {
		return po_tech;
	}
	public void setPo_tech(String po_tech) {
		this.po_tech = po_tech;
	}
	public String getPo_repre() {
		return po_repre;
	}
	public void setPo_repre(String po_repre) {
		this.po_repre = po_repre;
	}
	public String getPart_num() {
		return part_num;
	}
	public void setPart_num(String part_num) {
		this.part_num = part_num;
	}
	public MultipartFile getPortFile() {
		return portFile;
	}
	public void setPortFile(MultipartFile portFile) {
		this.portFile = portFile;
	}
	public String getPo_percent() {
		return po_percent;
	}
	public void setPo_percent(String po_percent) {
		this.po_percent = po_percent;
	}
	public String getPo_explainfile() {
		return po_explainfile;
	}
	public void setPo_explainfile(String po_explainfile) {
		this.po_explainfile = po_explainfile;
	}
}
