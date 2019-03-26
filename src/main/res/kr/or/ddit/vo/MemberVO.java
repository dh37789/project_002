package kr.or.ddit.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class MemberVO {
   private String mem_id;
   private String mem_pass;
   private String mem_name;
   private String mem_mail;
   private String mem_hp;
   private String mem_fax;
   private String mem_picture;
   private String mem_date;
   private String mem_bir;
   private String mem_selfinfo;
   private String mem_zipcode;
   private String mem_add1;
   private String mem_add2;
   private String mem_url;
   private String mtype_num;
   private String status_num;
   private String ftype_num;
   private String iden_num;
   private String rnum;
   private List<LanguageVO> techList;
   private MultipartFile memberFile;
   private String mem_login;
   
public String getMem_login() {
	return mem_login;
}
public void setMem_login(String mem_login) {
	this.mem_login = mem_login;
}
public String getRnum() {
	return rnum;
}
public void setRnum(String rnum) {
	this.rnum = rnum;
}
public String getMem_id() {
      return mem_id;
   }
   public void setMem_id(String mem_id) {
      this.mem_id = mem_id;
   }
   public String getMem_pass() {
      return mem_pass;
   }
   public void setMem_pass(String mem_pass) {
      this.mem_pass = mem_pass;
   }
   public String getMem_name() {
      return mem_name;
   }
   public void setMem_name(String mem_name) {
      this.mem_name = mem_name;
   }
   public String getMem_mail() {
      return mem_mail;
   }
   public void setMem_mail(String mem_mail) {
      this.mem_mail = mem_mail;
   }
   public String getMem_hp() {
      return mem_hp;
   }
   public void setMem_hp(String mem_hp) {
      this.mem_hp = mem_hp;
   }
   public String getMem_fax() {
      return mem_fax;
   }
   public void setMem_fax(String mem_fax) {
      this.mem_fax = mem_fax;
   }
   public String getMem_picture() {
      return mem_picture;
   }
   public void setMem_picture(String mem_picture) {
      this.mem_picture = mem_picture;
   }
   public String getMem_date() {
      return mem_date;
   }
   public void setMem_date(String mem_date) {
      this.mem_date = mem_date;
   }
   public String getMem_bir() {
      return mem_bir;
   }
   public void setMem_bir(String mem_bir) {
      this.mem_bir = mem_bir;
   }
   public String getMem_selfinfo() {
      return mem_selfinfo;
   }
   public void setMem_selfinfo(String mem_selfinfo) {
      this.mem_selfinfo = mem_selfinfo;
   }
   public String getMem_zipcode() {
      return mem_zipcode;
   }
   public void setMem_zipcode(String mem_zipcode) {
      this.mem_zipcode = mem_zipcode;
   }
   public String getMem_add1() {
      return mem_add1;
   }
   public void setMem_add1(String mem_add1) {
      this.mem_add1 = mem_add1;
   }
   public String getMem_add2() {
      return mem_add2;
   }
   public void setMem_add2(String mem_add2) {
      this.mem_add2 = mem_add2;
   }
   public String getMem_url() {
      return mem_url;
   }
   public void setMem_url(String mem_url) {
      this.mem_url = mem_url;
   }
   public String getMtype_num() {
      return mtype_num;
   }
   public void setMtype_num(String mtype_num) {
      this.mtype_num = mtype_num;
   }
   public String getStatus_num() {
      return status_num;
   }
   public void setStatus_num(String status_num) {
      this.status_num = status_num;
   }
   public String getFtype_num() {
      return ftype_num;
   }
   public void setFtype_num(String ftype_num) {
      this.ftype_num = ftype_num;
   }
   public String getIden_num() {
      return iden_num;
   }
   public void setIden_num(String iden_num) {
      this.iden_num = iden_num;
   }
public List<LanguageVO> getTechList() {
	return techList;
}
public void setTechList(List<LanguageVO> techList) {
	this.techList = techList;
}
public MultipartFile getMemberFile() {
	return memberFile;
}
public void setMemberFile(MultipartFile memberFile) {
	this.memberFile = memberFile;
}
   
   
}