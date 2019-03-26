package kr.or.ddit.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ProjectVO {
	private String rnum;
	private String pr_num;
	private String pr_cate_num;
	private String pr_title;
	private String pr_ex_period;
	private String pr_payment;
	private String pr_type;
	private String pr_content;
	private String pr_date;
	private String pr_tech;
	private String pr_giturl;
	private String pr_deadline;
	private String pr_meeting;
	private String pr_add;
	private String pr_start;
	private String pr_end;
	private String pr_support;
	private String client;
	private String pr_status;
	private String mtype_num;
	private String pr_purpose;
	private String dday;
	private String applicant;
	private List<LanguageVO> techList;
	private List<Project_techVO> techs;
	private String category;
	private String cate_Detail;
	private List<Object> inpr_project;
	private String cnt;
	private List<String> technique;
	private MultipartFile projectFile;
	private String flag;
	private String pr_check;
	private String pr_endcheck;
	
    public String getPr_check() {
		return pr_check;
	}
	public void setPr_check(String pr_check) {
		this.pr_check = pr_check;
	}
	
	
	
    public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public List<String> getTechnique() {
		return technique;
	}
	public void setTechnique(List<String> technique) {
		this.technique = technique;
	}
	public MultipartFile getProjectFile() {
		return projectFile;
	}
	public void setProjectFile(MultipartFile projectFile) {
		this.projectFile = projectFile;
	}
	public String getCnt() {
    	return cnt;
    }
    public void setCnt(String cnt) {
    	this.cnt = cnt;
    }
	private String pr_ref;
	
	public List<Object> getInpr_project() {
		return inpr_project;
	}
	public void setInpr_project(List<Object> inpr_project) {
		this.inpr_project = inpr_project;
	}
	public String getPr_end() {
		return pr_end;
	}
	public void setPr_end(String pr_end) {
		this.pr_end = pr_end;
	}
	public String getApplicant() {
		return applicant;
	}
	public void setApplicant(String applicant) {
		this.applicant = applicant;
	}
	public String getDday() {
		return dday;
	}
	public void setDday(String dday) {
		this.dday = dday;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getCate_Detail() {
		return cate_Detail;
	}
	public void setCate_Detail(String cate_Detail) {
		this.cate_Detail = cate_Detail;
	}
	public List<LanguageVO> getTechList() {
		return techList;
	}
	public void setTechList(List<LanguageVO> techList) {
		this.techList = techList;
	}
	public List<Project_techVO> getTechs() {
		return techs;
	}
	public void setTechs(List<Project_techVO> techs) {
		this.techs = techs;
	}
	public String getRnum() {
		return rnum;
	}
	public void setRnum(String rnum) {
		this.rnum = rnum;
	}
	public String getClient() {
		return client;
	}
	public void setClient(String client) {
		this.client = client;
	}
	public String getPr_num() {
		return pr_num;
	}
	public void setPr_num(String pr_num) {
		this.pr_num = pr_num;
	}
	public String getPr_cate_num() {
		return pr_cate_num;
	}
	public void setPr_cate_num(String pr_cate_num) {
		this.pr_cate_num = pr_cate_num;
	}
	public String getPr_title() {
		return pr_title;
	}
	public void setPr_title(String pr_title) {
		this.pr_title = pr_title;
	}
	public String getPr_ex_period() {
		return pr_ex_period;
	}
	public void setPr_ex_period(String pr_ex_period) {
		this.pr_ex_period = pr_ex_period;
	}
	public String getPr_payment() {
		return pr_payment;
	}
	public void setPr_payment(String pr_payment) {
		this.pr_payment = pr_payment;
	}
	public String getPr_type() {
		return pr_type;
	}
	public void setPr_type(String pr_type) {
		this.pr_type = pr_type;
	}
	public String getPr_content() {
		return pr_content;
	}
	public void setPr_content(String pr_content) {
		this.pr_content = pr_content;
	}
	public String getPr_date() {
		return pr_date;
	}
	public void setPr_date(String pr_date) {
		this.pr_date = pr_date;
	}
	public String getPr_tech() {
		return pr_tech;
	}
	public void setPr_tech(String pr_tech) {
		this.pr_tech = pr_tech;
	}
	public String getPr_giturl() {
		return pr_giturl;
	}
	public void setPr_giturl(String pr_giturl) {
		this.pr_giturl = pr_giturl;
	}
	public String getPr_deadline() {
		return pr_deadline;
	}
	public void setPr_deadline(String pr_deadline) {
		this.pr_deadline = pr_deadline;
	}
	public String getPr_meeting() {
		return pr_meeting;
	}
	public void setPr_meeting(String pr_meeting) {
		this.pr_meeting = pr_meeting;
	}
	public String getPr_add() {
		return pr_add;
	}
	public void setPr_add(String pr_add) {
		this.pr_add = pr_add;
	}
	public String getPr_start() {
		return pr_start;
	}
	public void setPr_start(String pr_start) {
		this.pr_start = pr_start;
	}
	public String getPr_support() {
		return pr_support;
	}
	public void setPr_support(String pr_support) {
		this.pr_support = pr_support;
	}
	public String getPr_status() {
		return pr_status;
	}
	public void setPr_status(String pr_status) {
		this.pr_status = pr_status;
	}
	public String getMtype_num() {
		return mtype_num;
	}
	public void setMtype_num(String mtype_num) {
		this.mtype_num = mtype_num;
	}
	public String getPr_purpose() {
		return pr_purpose;
	}
	public void setPr_purpose(String pr_purpose) {
		this.pr_purpose = pr_purpose;
	}
	public String getPr_ref() {
		return pr_ref;
	}
	public void setPr_ref(String pr_ref) {
		this.pr_ref = pr_ref;
	}
	public String getPr_endcheck() {
		return pr_endcheck;
	}
	public void setPr_endcheck(String pr_endcheck) {
		this.pr_endcheck = pr_endcheck;
	}
	
	
}
