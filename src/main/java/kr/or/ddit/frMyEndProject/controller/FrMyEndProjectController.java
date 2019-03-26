package kr.or.ddit.frMyEndProject.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.frMyEndProject.service.FrMyEndProjectService;
import kr.or.ddit.frMyProject.service.ContractService;
import kr.or.ddit.project.service.ProjectTechService;
import kr.or.ddit.utils.MoneyComma;
import kr.or.ddit.utils.RolePagingUtil;
import kr.or.ddit.vo.LanguageVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ProjectVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/frmyendproject/")
public class FrMyEndProjectController {
	@Autowired
	private FrMyEndProjectService service;
	@Autowired
	private ProjectTechService techservice;
	@Autowired
	private ContractService conService;
	
	@RequestMapping("frMyEndProjectList")
	public ModelAndView endProjectList(ModelAndView andView, Map<String, String> params, 
			String search_keyword,HttpServletRequest request, HttpSession session, String currentPage) throws Exception{
		if(currentPage==null){
			currentPage="1";
		}
		MemberVO member = (MemberVO) request.getSession().getAttribute("USER_LOGININFO");
		params.put("mem_id", member.getMem_id());

		params.put("search_keyword", search_keyword);
		int endCount = service.endCount(params);

		RolePagingUtil pagingUtil = new RolePagingUtil(endCount, Integer.parseInt(currentPage), request);
		params.put("startCount", String.valueOf(pagingUtil.getStartCount()));
		params.put("endCount", String.valueOf(pagingUtil.getEndCount()));

		List<HashMap<String, Object>> endProjectList = service.endProjectList(params);
		for (HashMap<String, Object> prInfo : endProjectList) {
			String money = MoneyComma.toNumFormat(Integer.parseInt(String.valueOf(prInfo.get("PR_PAYMENT"))));
			prInfo.put("PR_PAYMENT", money);
				}
		
		if(endProjectList.size()==0){
			andView.addObject("noProject", "검색 조건의 프로젝트가 없습니다.");
		}else{
			andView.addObject("endProjectList", endProjectList);
		}
		andView.addObject("pagingUtil", pagingUtil.getPageHtmls());
		andView.addObject("endCount", endCount);
		andView.setViewName("user/frmyendproject/frMyEndProjectList");
		return andView;
	}
	
	@RequestMapping("frEndProjectView")
	public ModelAndView endProjectView(ModelAndView andView, String pr_num, Map<String, String> params) throws Exception{
		params.put("pr_num", pr_num);
		
		ProjectVO endProject = service.endProjectView(params);
		
		String money = MoneyComma.toNumFormat(Integer.parseInt(endProject.getPr_payment()));
		endProject.setPr_payment(money);
		
		params.put("cons_proj_num", pr_num);
		List<HashMap<String, Object>> memList = conService.memList(params);
		
		List<LanguageVO> lang = techservice.techList(pr_num);
		endProject.setTechList(lang);
		
		andView.addObject("memList", memList);
		andView.addObject("endProject", endProject);
		andView.setViewName("user/frmyendproject/frMyEndProjectView");
		
		return andView;
	}
}
