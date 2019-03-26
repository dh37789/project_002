package kr.or.ddit.adStats.controller;

import java.util.List;
import java.util.Map;

import kr.or.ddit.adStats.service.IStatsService;
import kr.or.ddit.utils.MoneyComma;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/statsMgn/")
public class statsController {
	@Autowired
	private IStatsService service;
	
	@RequestMapping("projectStats")
	public ModelAndView projectStats(ModelAndView andView, Map<String, String> totalSales, Map<String, String> pureSales, Map<String, String> categoryList, Map<String, String> pjCondition, Map<String, String> pjCategory, Map<String, String> pjRegion) throws Exception {
		
		totalSales = service.totalSales(); 
		pureSales = service.pureSales();
		categoryList = service.categoryList();
		pjCondition = service.pjCondition();
		pjCategory = service.pjCategory();
		pjRegion = service.pjRegion();
		
		int web = Integer.parseInt(String.valueOf(totalSales.get("WEB")));
		int app = Integer.parseInt(String.valueOf(totalSales.get("APP")));
		int game = Integer.parseInt(String.valueOf(totalSales.get("GAME")));
		int publishing = Integer.parseInt(String.valueOf(totalSales.get("PUBLISHING")));
		int etc = Integer.parseInt(String.valueOf(totalSales.get("ETC")));
		
		int total = web + app + game + publishing + etc;
		int pure = (int) (total*0.1);
		String pureMoney = MoneyComma.toNumFormat(pure);
		String totalMoney = MoneyComma.toNumFormat(total);
		
		andView.addObject("totalMoney", totalMoney);
		andView.addObject("pureMoney", pureMoney);
		andView.addObject("totalSales", totalSales);
		andView.addObject("pureSales", pureSales);
		andView.addObject("categoryList", categoryList);
		andView.addObject("pjCondition", pjCondition);
		andView.addObject("pjCategory", pjCategory);
		andView.addObject("pjRegion", pjRegion);
		
		andView.setViewName("admin/stats/projectStats");
		return andView;
	}
	
	@RequestMapping("memberStats")
	public ModelAndView MemberStats(ModelAndView andView) throws Exception {
		List<Map<String, String>> projectCnt  = service.projectCnt();
		List<Map<String, String>> projectPayment  = service.projectPayment();
		List<Map<String, String>> freeJoinProject  = service.freeJoinProject();
		List<Map<String, String>> freeSalary  = service.freeSalary();
	
		andView.addObject("projectCnt", projectCnt);
		andView.addObject("projectPayment", projectPayment);
		andView.addObject("freeJoinProject", freeJoinProject);
		andView.addObject("freeSalary", freeSalary);
		andView.setViewName("admin/stats/memberStats");
		
		return andView;
	}
	
	
}
