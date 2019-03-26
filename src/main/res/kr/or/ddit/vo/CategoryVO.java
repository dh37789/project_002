package kr.or.ddit.vo;

public class CategoryVO {
	private String cate_num;
	private String cate_category;
	private String category;
	private String cate_detail;
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getCate_num() {
		return cate_num;
	}
	public void setCate_num(String cate_num) {
		this.cate_num = cate_num;
	}
	public String getCate_category() {
		return cate_category;
	}
	public void setCate_category(String cate_category) {
		this.cate_category = cate_category;
	}
	public String getCate_detail() {
		return cate_detail;
	}
	public void setCate_detail(String cate_detail) {
		this.cate_detail = cate_detail;
	}
}
