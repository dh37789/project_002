package kr.or.ddit.project.controller;

import java.io.PrintWriter;
import java.sql.Clob;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.constract.service.SignService;
import kr.or.ddit.evalation.service.IEvalationService;
import kr.or.ddit.frMyProject.service.CategoryService;
import kr.or.ddit.interest.service.InterestService;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.project.service.ApplyService;
import kr.or.ddit.project.service.ProjectService;
import kr.or.ddit.project.service.ProjectTechService;
import kr.or.ddit.prre.service.IPrreService;
import kr.or.ddit.utils.CLOBtoString;
import kr.or.ddit.utils.MoneyComma;
import kr.or.ddit.utils.RolePagingUtil;
import kr.or.ddit.vo.CategoryVO;
import kr.or.ddit.vo.EvalArrayVO;
import kr.or.ddit.vo.Free_TypeVO;
import kr.or.ddit.vo.Interest_projectVO;
import kr.or.ddit.vo.LanguageVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.Project_reply;
import kr.or.ddit.vo.Project_techVO;
import oracle.sql.CLOB;

import org.apache.taglibs.standard.lang.jstl.AndOperator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/project/")
public class ProjectController {
	@Autowired
	private ProjectService service;
	@Autowired
	private ProjectTechService techservice;
	@Autowired
	private CategoryService cateService;
	@Autowired
	private ApplyService applyService;
	@Autowired
	private IMemberService memberService;
	@Autowired
	private InterestService interestService;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private kr.or.ddit.frMyProject.service.ProjectService ProjectService;
	@Autowired
	private IEvalationService evalService;
	@Autowired
	private IPrreService prreService;
	@Autowired
	private SignService signService;
	
	private RolePagingUtil pagingUtil;
	
	@RequestMapping("projectList")
	public ModelAndView projectList(ModelAndView andView, Map<String, String> params,String search_keyword,HttpServletRequest request,String currentPage) throws Exception {
		if(currentPage==null){
			currentPage ="1";
		}
		
		params.put("search_keyword", search_keyword);
		int countProject = service.countProject(params);
		
		pagingUtil = new RolePagingUtil(countProject, Integer.parseInt(currentPage), request);
		params.put("startCount",String.valueOf(pagingUtil.getStartCount()));
		params.put("endCount",String.valueOf(pagingUtil.getEndCount()));
		
		
		List<ProjectVO> projectList = service.projectList(params);
		
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
		
		MemberVO free = (MemberVO) request.getSession().getAttribute("USER_LOGININFO");
		if(free !=null){
			params.put("mem_id", free.getMem_id());
			List<Interest_projectVO> interestList = interestService.selectProject(params);
			andView.addObject("interestList",interestList);
		}
		
		int totalCount = service.totalCount();
		
		if(projectList.size()==0){
		andView.addObject("noProject", "검색 조건의 프로젝트가 없습니다.");
			
		}else{
		andView.addObject("projectList", projectList);
		}

		
		andView.addObject("pagingUtil",pagingUtil);
		andView.addObject("totalCount", totalCount);
		andView.setViewName("user/common/ProjectList");
		return andView;
	}
	
	
//	@RequestMapping("projectView")
//	public ModelAndView projectView(ModelAndView andView, String pr_num, Map<String, String> params) throws Exception{
//		params.put("pr_num", pr_num);
//		
//		ProjectVO project =service.projectView(params);
//		List<LanguageVO> lang= techservice.techList(pr_num);
//		project.setTechList(lang);
//		params.put("cate_num", project.getPr_cate_num());
//		CategoryVO cateInfo=cateService.selectCategory(params);
//		project.setCategory(cateInfo.getCategory());
//		project.setCate_Detail(cateInfo.getCate_detail());
//		project.setPr_payment(MoneyComma.toNumFormat(Integer.parseInt(project.getPr_payment())));
//		project.setApplicant(applyService.countApply(params)+"");
//		
//		MemberVO client = memberService.selectClient(project.getClient());
//		int countProject = service.cntClientProject(client.getMem_id());
//		int countApply = service.cntApplyProejct(client.getMem_id());
//		
//		andView.addObject("client",client);
//		andView.addObject("project",project);
//		andView.addObject("countProject",countProject);
//		andView.addObject("countApply",countApply);
//		
//		andView.setViewName("user/common/ProjectView");
//		return andView;
//	}
	
	
	@RequestMapping("projectView")
	public ModelAndView projectView(ModelAndView andView, String pr_num, Map<String, String> params,
			HttpSession session) throws Exception{
		params.put("pr_num", pr_num);
		
		ProjectVO project =service.projectView(params);
		List<LanguageVO> lang= techservice.techList(pr_num);
		project.setTechList(lang);
		params.put("cate_num", project.getPr_cate_num());
		CategoryVO cateInfo=cateService.selectCategory(params);
		project.setCategory(cateInfo.getCategory());
		project.setCate_Detail(cateInfo.getCate_detail());
		project.setPr_payment(MoneyComma.toNumFormat(Integer.parseInt(project.getPr_payment())));
		project.setApplicant(applyService.countApply(params)+"");

		List<Project_reply> prreList = prreService.prreList(params);
		List<MemberVO> reMember = memberService.reMember();
		
		System.out.println(project.getClient());
		
		MemberVO client = memberService.selectClient(project.getClient());
		params.put("mem_id", client.getMem_id());
		int countRegis = this.ProjectService.clCountRegisPr(params);
		int countContract = this.ProjectService.clCountContract(params);
		int countProjecting = this.ProjectService.clCountProjecting(params);
		int countEnd = this.ProjectService.clCountEndPr(params);
		String [] eval = {"전문성&nbsp&nbsp&nbsp","만족도&nbsp&nbsp&nbsp","의사소통","일정준수","적극성&nbsp&nbsp&nbsp"};
		
		MemberVO memberInfo = (MemberVO) session.getAttribute("USER_LOGININFO");
		Map<String, String> param = new HashMap<String, String>();
		param.put("mem_id", memberInfo.getMem_id());
		int signCnt = signService.countSign(param);
		

		andView.addObject("prreList", prreList);
		andView.addObject("client",client); 
		andView.addObject("reMember",reMember); 

		andView.addObject("signCnt",signCnt);
		andView.addObject("client",client);
		andView.addObject("project",project);
		andView.addObject("countRegis",countRegis);
		andView.addObject("countContract",countContract);
		andView.addObject("countProjecting",countProjecting);
		andView.addObject("countEnd",countEnd);
		
		params.put("ev_to", client.getMem_id());
		if(this.evalService.countEval(params)==0){
			List<EvalArrayVO> evalList = new ArrayList<EvalArrayVO>();
			for (int i = 0; i < eval.length; i++) {
				EvalArrayVO evalVO = new EvalArrayVO();
				evalVO.setEval(eval[i]);
				evalList.add(evalVO);
			}
			andView.addObject("evalList", evalList);
			andView.setViewName("user/common/ProjectView");
			return andView;
			
		}else{
			
			double ev_professione = this.evalService.evalAvgPro(params);
			double ev_satisfy = this.evalService.evalAvgSati(params);
			double ev_communi = this.evalService.evalAvgComm(params);
			double ev_schedule = this.evalService.evalAvgSche(params);
			double ev_active = this.evalService.evalAvgActi(params);
			double [] evalVal = {ev_professione, ev_satisfy, ev_communi, ev_schedule, ev_active};
			List<EvalArrayVO> evalList = new ArrayList<EvalArrayVO>();
			for (int i = 0; i < evalVal.length; i++) {
				EvalArrayVO evalVO = new EvalArrayVO();
				evalVO.setEval(eval[i]);
				evalVO.setEvalVal(evalVal[i]);
				evalList.add(evalVO);
			}
			double countEval = this.evalService.countEval(params);
			double evalTotalSum = this.evalService.evalTotalSum(params);
			
			double total = (evalTotalSum/(countEval*5));
			double totalAvg = Math.round(total*10)/10.0;
			
			andView.addObject("client",client);
			andView.addObject("project",project);
			andView.addObject("countRegis",countRegis);
			andView.addObject("countContract",countContract);
			andView.addObject("countProjecting",countProjecting);
			andView.addObject("countEnd",countEnd);
			andView.addObject("evalList", evalList);
			andView.addObject("countEval", countEval);
			andView.addObject("totalAvg", totalAvg);
			
			andView.setViewName("user/common/ProjectView");
			return andView;
		}
	}
	
	@RequestMapping("projectForm")
	public ModelAndView projectForm(ModelAndView andView, HttpSession session) throws Exception{
		List<Free_TypeVO> cateList = categoryService.category();
		List<LanguageVO> lanList = techservice.lanList();
		
		MemberVO memberInfo = (MemberVO) session.getAttribute("USER_LOGININFO");
		Map<String, String> param = new HashMap<String, String>();
		param.put("mem_id", memberInfo.getMem_id());
		int signCnt = signService.countSign(param);

		
		andView.addObject("signCnt",signCnt);
		andView.addObject("cateList",cateList);
		andView.addObject("lanList",lanList);
		andView.setViewName("user/clproject/projectForm");
		return andView;
	}
	
	@RequestMapping("detailList")
	public String detailList(String ftype_num,HttpServletResponse response) throws Exception{
		List<Map<String,String>> detailList = categoryService.detail(ftype_num);
		int size = detailList.size();
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		jsonMap.put("detailList", detailList);
		jsonMap.put("size", size);


		ObjectMapper mapper = new ObjectMapper();
		String jsonData;
		jsonData = mapper.writeValueAsString(jsonMap);
		PrintWriter out =  response.getWriter();
		out.println(jsonData);
		return null;
	}
	
	@RequestMapping("insertProject")
	public String insertProject( ProjectVO project ,HttpSession session) throws Exception{
		MemberVO member= (MemberVO) session.getAttribute("USER_LOGININFO");
		project.setClient(member.getMem_id());
		if(project.getFlag().intern()=="false".intern()){
			System.out.println("임시저장");
			service.saveProject(project); 
			return "forward:/project/temporaryList.do";
		}else{
			System.out.println("insert");
			service.insertProject(project);
			return "forward:/project/inspectionList.do";
		}
	}
	
	@RequestMapping("inspectionList")
	public ModelAndView inspectionList(ModelAndView andView,HttpSession session,Map<String,String> params) throws Exception{
		MemberVO member= (MemberVO) session.getAttribute("USER_LOGININFO");
		params.put("client",member.getMem_id());
		List<ProjectVO> projectList = service.inspectionProject(params);
		if(projectList.size()==0){
			andView.addObject("noProject","검수중인 프로젝트가 없습니다.");
			
		}else{
		for (ProjectVO project : projectList) {
			String prnum = project.getPr_num();
			List<LanguageVO> lang= techservice.techList(prnum);
			project.setTechList(lang);
			params.put("cate_num", project.getPr_cate_num());
			CategoryVO cateInfo=cateService.selectCategory(params);
			project.setCategory(cateInfo.getCategory());
			project.setCate_Detail(cateInfo.getCate_detail());
			project.setPr_payment(MoneyComma.toNumFormat(Integer.parseInt(project.getPr_payment())));
		}
		
		andView.addObject("projectList",projectList);
		}
		andView.setViewName("user/clproject/inspectionList");
		return andView;
	}
	
	@RequestMapping("temporaryList")
	public ModelAndView temporaryList(ModelAndView andView,HttpSession session,Map<String,String> params) throws Exception{
		MemberVO member= (MemberVO) session.getAttribute("USER_LOGININFO");
		params.put("client",member.getMem_id());
		List<Map<String, Object>> projectList = service.temporaryList(params);
		if(projectList.size()==0){
			andView.addObject("noProject","저장한 프로젝트가 없습니다.");
			
		}else{
			for(Map<String, Object> project:projectList){
				if(project.get("PR_CONTENT")!=null){
				CLOB clob = (CLOB) project.get("PR_CONTENT");
				
				project.put("PR_CONTENT", CLOBtoString.clobToString(clob));
				}
			}
			andView.addObject("projectList",projectList);
		}
		andView.setViewName("user/clproject/temporaryList");
		return andView;
	}
	
	@RequestMapping("refuseList")
	public ModelAndView refuseList(ModelAndView andView,HttpSession session,Map<String,String> params) throws Exception{
		MemberVO member= (MemberVO) session.getAttribute("USER_LOGININFO");
		params.put("client",member.getMem_id());
		params.put("status","refuse");
		List<Map<String, Object>> projectList = service.temporaryList(params);
		if(projectList.size()==0){
			andView.addObject("noProject","프로젝트가 없습니다.");
			
		}else{
			for(Map<String, Object>project : projectList){
				int pr_payment =Integer.valueOf(String.valueOf(project.get("PR_PAYMENT")));
				project.put("PR_PAYMENT", MoneyComma.toNumFormat(pr_payment));
				CLOB clob =(CLOB) project.get("PR_CONTENT");
				project.put("PR_CONTENT",CLOBtoString.clobToString(clob));
			}
			andView.addObject("projectList",projectList);
		}
		andView.setViewName("user/clproject/refuseList");
		return andView;
	}
	
	@RequestMapping("deleteProject")
	public String deleteProject(String pr_num) throws Exception{
		service.deleteProject(pr_num);
		
		return "forward:/project/temporaryList.do";
	}
	
	@RequestMapping("updateProject")
	public String updateProject(ProjectVO project) throws Exception{
		if(project.getFlag().intern()=="true"){
			project.setPr_status("1");
		}else{
			project.setPr_status("0");
		}
		service.updateProject(project);
		return "forward:/project/temporaryList.do";
	}
	
	@RequestMapping("projectForm2")
	public ModelAndView projectForm2(ModelAndView andView,String pr_num,Map<String,String> params,
			HttpSession session) throws Exception{
		params.put("pr_num", pr_num);
		ProjectVO project = service.projectInfo(params);
		String pr_cate_num = project.getPr_cate_num();
		params.put("cate_num",pr_cate_num);
		CategoryVO category =categoryService.categoryStatus(params);
		List<Free_TypeVO> cateList = categoryService.category();
		List<LanguageVO> lanList = techservice.lanList();
		List<Map<String,String>> techlist = techservice.project_techList(params);
		
		MemberVO memberInfo = (MemberVO) session.getAttribute("USER_LOGININFO");
		Map<String, String> param = new HashMap<String, String>();
		param.put("mem_id", memberInfo.getMem_id());
		int signCnt = signService.countSign(param);
		
		andView.addObject("signCnt",signCnt);
		andView.addObject("category",category);
		andView.addObject("cateList",cateList);
		andView.addObject("lanList",lanList);
		andView.addObject("techlist",techlist);
		
		andView.addObject("project",project);
		andView.setViewName("user/clproject/projectForm2");
		return andView;
	}
	
	@RequestMapping("ajaxContent")
	public ModelAndView meetChk(ModelAndView andView, String pr_num,
	         Map<String, String> params) throws Exception{
	      params.put("pr_num", pr_num);
	      ProjectVO project = service.projectInfo(params);
	      
	      andView.addObject("project", project);
	      andView.setViewName("jsonConvertView");
	      return andView;
	   }

}