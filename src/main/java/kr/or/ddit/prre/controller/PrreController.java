package kr.or.ddit.prre.controller;

import kr.or.ddit.prre.service.IPrreService;
import kr.or.ddit.vo.Project_reply;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/prre/")
public class PrreController {
	@Autowired
	private IPrreService service;
	
	
	@RequestMapping("insertPrre")
	public String insertPrre(Project_reply prre, String pr_num) throws Exception {
		service.insertPrre(prre);
		return "redirect:/project/projectView.do?pr_num="+pr_num;
	}
	
	@RequestMapping("prreDelete")
	public String prreDelete(String prre_num, String pr_num) throws Exception {
		service.deletePrre(prre_num);
		return "redirect:/project/projectView.do?pr_num="+pr_num;
	}
	@RequestMapping("aPrreDelete")
	public String aprreDelete(String prre_num, String pr_num) throws Exception {
		service.deletePrre(prre_num);
		return "redirect:/project/projectView.do?pr_num="+pr_num;
	}
	
	@RequestMapping("prreUpdate")
	public String prreUpdate(Project_reply Prre, String pr_num) throws Exception {
		service.updatePrre(Prre);
		return "redirect:/project/projectView.do?pr_num="+pr_num;
	}
	
	@RequestMapping("insertPrreReply")
	public String insertPrreReply(Project_reply Prre, String pr_num)throws Exception {
		service.insertPrreReply(Prre);
		
		return "redirect:/project/projectView.do?pr_num="+pr_num;
	}
}
