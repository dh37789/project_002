package kr.or.ddit.interest.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.frMyProject.service.CategoryService;
import kr.or.ddit.interest.service.InterestService;
import kr.or.ddit.project.service.ApplyService;
import kr.or.ddit.project.service.ProjectService;
import kr.or.ddit.project.service.ProjectTechService;
import kr.or.ddit.utils.CLOBtoString;
import kr.or.ddit.utils.MoneyComma;
import kr.or.ddit.utils.RolePagingUtil;
import kr.or.ddit.vo.CategoryVO;
import kr.or.ddit.vo.Interest_projectVO;
import kr.or.ddit.vo.LanguageVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ProjectVO;
import oracle.sql.CLOB;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
@Controller
@RequestMapping("/interest/")
public class InterestController {
	@Autowired
	private InterestService service;
	@Autowired
	private ProjectService projectService;
	@Autowired
	private ProjectTechService techservice;
	@Autowired
	private CategoryService cateService;
	@Autowired
	private ApplyService applyService;
	
	
	private RolePagingUtil pagingUtil;
	
	@RequestMapping("insertProject")
	public String insertProject(Model model,HttpSession session,Map<String,String> params,String pr_num,ServletResponse response) throws Exception{
 		MemberVO member= (MemberVO) session.getAttribute("USER_LOGININFO");
		params.put("mem_id", member.getMem_id());
		params.put("pr_num", pr_num);
		
		String result = service.insertProject(params);
		Map<String, String> jsonMap = new HashMap<String, String>();
		if (result == null) {
			jsonMap.put("flag", "false");

		} else {
			jsonMap.put("flag", "true");
			jsonMap.put("inpr_num", result);
		}

		ObjectMapper mapper = new ObjectMapper();
		String jsonData;
		jsonData = mapper.writeValueAsString(jsonMap);
		PrintWriter out = response.getWriter();
		out.println(jsonData);
		return null;
	}
	@RequestMapping("insertProject2")
	public ModelAndView insertProject2(ModelAndView andView,Map<String,String> params,String pr_num,HttpSession session) throws Exception{
		MemberVO member= (MemberVO) session.getAttribute("USER_LOGININFO");
		params.put("mem_id", member.getMem_id());
		params.put("pr_num", pr_num);
		
		service.insertProject(params);
		
		andView.addObject("pr_num",pr_num);
		andView.setViewName("redirect:/project/projectView.do");
		return andView;
	}
	@RequestMapping("deleteProject")
	public String deleteProject(HttpSession session,Map<String,String> params,String inpr_num,ServletResponse response) throws Exception{
		params.put("inpr_num", inpr_num);
		int result = service.deleteProject(params);
		Map<String, String> jsonMap = new HashMap<String, String>();
		if (result == 0) {
			jsonMap.put("flag", "false");

		} else {
			jsonMap.put("flag", "true");
		}

		ObjectMapper mapper = new ObjectMapper();
		String jsonData;
		jsonData = mapper.writeValueAsString(jsonMap);
		PrintWriter out = response.getWriter();
		out.println(jsonData);
		return null;
		
	}
	
	@RequestMapping("deleteProject2")
	public String deleteProject2( HttpSession session, String pr_num,Map<String,String> params) throws Exception{
		MemberVO member = (MemberVO) session.getAttribute("USER_LOGININFO");
		params.put("mem_id",member.getMem_id() );
		params.put("pr_num",pr_num);
		
		String inpr_num = service.selectInpr_num(params);
		
		params.put("inpr_num", inpr_num);
		service.deleteProject(params);
		
		
		return "forward:/interest/projectList.do";
		
	}
	
	@RequestMapping("checkProject")
	public String checkProject(Map<String, String> params,String pr_num,HttpSession session,HttpServletResponse response) throws Exception{
		MemberVO member = (MemberVO) session.getAttribute("USER_LOGININFO");
		String mem_id = member.getMem_id();
		params.put("mem_id", mem_id);
		params.put("pr_num", pr_num);
		int result = service.checkProject(params);
		
		Map<String, String> jsonMap = new HashMap<String, String>();
		
		if (result == 0) {
			jsonMap.put("flag", "true");

		} else {
			jsonMap.put("flag", "false");
		}

		ObjectMapper mapper = new ObjectMapper();
		String jsonData;
		jsonData = mapper.writeValueAsString(jsonMap);
		PrintWriter out = response.getWriter();
		out.println(jsonData);
		
		
		return null;
		
	}
	
	@RequestMapping("projectList")
	public ModelAndView projectList(ModelAndView andView,String currentPage,Map<String,String> params,HttpServletRequest request,String search_keyword,HttpSession session ) throws Exception{
		MemberVO member = (MemberVO) session.getAttribute("USER_LOGININFO");
		if(member!=null){
		params.put("interest_member",member.getMem_id());
		}
		if(currentPage==null){
			currentPage ="1";
		}
		
		params.put("search_keyword", search_keyword);
		
		int countProject = projectService.countProject(params);
		
		pagingUtil = new RolePagingUtil(countProject, Integer.parseInt(currentPage), request);
		params.put("startCount",String.valueOf(pagingUtil.getStartCount()));
		params.put("endCount",String.valueOf(pagingUtil.getEndCount()));
		
		
		List<ProjectVO> projectList = projectService.projectList(params);
		
		for (ProjectVO project : projectList) {
			String prnum = project.getPr_num();
			List<LanguageVO> lang= techservice.techList(prnum);
			project.setTechList(lang);
			params.put("cate_num", project.getPr_cate_num());
			CategoryVO cateInfo=cateService.selectCategory(params);
			project.setCategory(cateInfo.getCategory());
			project.setCate_Detail(cateInfo.getCate_detail());
			project.setPr_payment(MoneyComma.toNumFormat(Integer.parseInt(project.getPr_payment())));
			params.put("pr_num", prnum);
			project.setApplicant(applyService.countApply(params)+"");
			
			
			
		}
		if(member !=null){
			params.put("mem_id", member.getMem_id());
			List<Interest_projectVO> interestList = service.selectProject(params);
			andView.addObject("interestList",interestList);
		}
		
		int totalCount = projectService.totalCount();
		
		if(projectList.size()==0){
		andView.addObject("noProject", "관심 등록한 프로젝트가 없습니다.");
			
		}else{
		andView.addObject("projectList", projectList);
		}

		
		andView.addObject("pagingUtil",pagingUtil);
		andView.addObject("totalCount", totalCount);
		andView.setViewName("user/interest/interestProjectList");
		return andView;
		
	}
	
	@RequestMapping("freeList")
	public ModelAndView freeList(ModelAndView andView,String currentPage,Map<String,String> params,HttpServletRequest request,HttpSession session) throws Exception{
		
		MemberVO member = (MemberVO) session.getAttribute("USER_LOGININFO");
		
		if(member!=null){
		params.put("client",member.getMem_id());
		}
		
		if(currentPage==null){
			currentPage ="1";
		}
		int countFree = service.countFree(params);
		
		pagingUtil = new RolePagingUtil(countFree, Integer.parseInt(currentPage), request);
		params.put("startCount",String.valueOf(pagingUtil.getStartCount()));
		params.put("endCount",String.valueOf(pagingUtil.getEndCount()));
		
		List<Map<String, Object>> freeList = service.freeList(params);
		
		if(freeList.size()==0){
			andView.addObject("noFree", "관심 등록한 프리랜서가 없습니다.");
			
		}else{
			for(Map<String, Object> free:freeList){
				CLOB clob =(CLOB) free.get("MEM_SELFINFO");
				if(clob!=null){
					free.put("MEM_SELFINFO",CLOBtoString.clobToString(clob));
				}
			}
			
			andView.addObject("freeList", freeList);
		}
		andView.addObject("pagingUtil",pagingUtil.getPageHtmls());
		
		andView.setViewName("user/interest/interestFreeList");
		return andView;
	}
		
	
	@RequestMapping("deleteFree2")
	public String deleteFree2( HttpSession session, String mem_id,Map<String,String> params) throws Exception{
		MemberVO member = (MemberVO) session.getAttribute("USER_LOGININFO");
		params.put("client",member.getMem_id() );
		params.put("free",mem_id);
		
		service.deleteFreelancer(params);
		
		
		return "forward:/interest/freeList.do";
		
	}
	@RequestMapping("insertfree")
	public String insertfree(HttpSession session,Map<String,String> params,String free,HttpServletResponse response) throws Exception{
		MemberVO member= (MemberVO) session.getAttribute("USER_LOGININFO");
		params.put("client", member.getMem_id());
		params.put("freelancer", free);
		
		String result = service.insertFreelancer(params);
		Map<String, String> jsonMap = new HashMap<String, String>();
		if (result == null) {
			jsonMap.put("flag", "false");
			
		} else {
			jsonMap.put("flag", "true");
			jsonMap.put("infr_num", result);
		}
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonData;
		jsonData = mapper.writeValueAsString(jsonMap);
		PrintWriter out = response.getWriter();
		out.println(jsonData);
		return null;
	}

	@RequestMapping("deletefree")
	public String deletefree(HttpSession session,Map<String,String> params,String free,HttpServletResponse response) throws Exception{
		MemberVO member= (MemberVO) session.getAttribute("USER_LOGININFO");
		params.put("client", member.getMem_id());
		params.put("free", free);
		int result = service.deleteFreelancer(params);
		Map<String, String> jsonMap = new HashMap<String, String>();
		if (result == 0) {
			jsonMap.put("flag", "false");
			
		} else {
			jsonMap.put("flag", "true");
		}
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonData;
		jsonData = mapper.writeValueAsString(jsonMap);
		PrintWriter out = response.getWriter();
		out.println(jsonData);
		return null;
		
	}
}
