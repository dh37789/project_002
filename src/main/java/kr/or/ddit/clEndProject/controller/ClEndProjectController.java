package kr.or.ddit.clEndProject.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.clEndProject.service.ClEndProjectService;
import kr.or.ddit.frMyProject.service.CategoryService;
import kr.or.ddit.member.service.IMemberService;
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
@RequestMapping("/clMyProject/")
public class ClEndProjectController {
	@Autowired
	private ClEndProjectService service;
	@Autowired
	private CategoryService categoryService;
	@Autowired 
	private ProjectTechService techService;
	@Autowired
	private IMemberService memberService;
	
	@RequestMapping("clEndPrList")
	public ModelAndView clEndPrList(ModelAndView andView, Map<String, String> params, 
				String search_keyword, HttpServletRequest request, HttpSession session, String currentPage) throws Exception{
		if(currentPage==null){
			currentPage="1";
		}
		MemberVO client = (MemberVO) request.getSession().getAttribute("USER_LOGININFO");
		params.put("client", client.getMem_id());
		
		params.put("search_keyword", search_keyword);
		int countProject = service.clEndCount(params);
		
		RolePagingUtil pagingUtil = new RolePagingUtil(countProject, Integer.parseInt(currentPage), request);
		params.put("startCount", String.valueOf(pagingUtil.getStartCount()));
		params.put("endCount", String.valueOf(pagingUtil.getEndCount()));
		
		List<ProjectVO> clEndPrList = service.clEndPrList(params);
		
		for (ProjectVO prInfo : clEndPrList) {
			String money = MoneyComma.toNumFormat(Integer.parseInt(prInfo.getPr_payment()));
			prInfo.setPr_payment(money);
		}

		
		if(clEndPrList.size()==0){
			andView.addObject("noProject", "검색 조건의 프로젝트가 없습니다.");
		}else{
			andView.addObject("clEndPrList", clEndPrList);
		}
		
		andView.addObject("pagingUtil", pagingUtil.getPageHtmls());
		andView.addObject("countProject", countProject);
		andView.setViewName("user/clMyProject/clEndProjectList");
		
		return andView;
	}
	
	@RequestMapping("clEndPrView")
	public ModelAndView clEndPrView(ModelAndView andView, String pr_num, Map<String, String> params) throws Exception{
		params.put("pr_num", pr_num);
		
		ProjectVO clEndProject = service.clEndPrView(params);
		MemberVO client = memberService.selectClient(clEndProject.getClient());
		
		List<LanguageVO> lang = techService.techList(pr_num);
		clEndProject.setTechList(lang);
		
		andView.addObject("client", client);
		andView.addObject("clEndProject", clEndProject);
		andView.setViewName("user/clMyProject/clEndProjectView");
	
		return andView;
	}
}
