package kr.or.ddit.adProjectMgn.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.adProjectMgn.service.IAdProjectService;
import kr.or.ddit.alarm.service.AlarmService;
import kr.or.ddit.clReadyProject.service.ContractFileService;
import kr.or.ddit.evalation.service.IEvalationService;
import kr.or.ddit.global.GlobalConstant;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.project.service.ApplyService;
import kr.or.ddit.project.service.ProjectFileService;
import kr.or.ddit.project.service.ProjectService;
import kr.or.ddit.project.service.ProjectTechService;
import kr.or.ddit.utils.CLOBtoString;
import kr.or.ddit.utils.MoneyComma;
import kr.or.ddit.utils.RolePagingUtil;
import kr.or.ddit.vo.Constract_fileVO;
import kr.or.ddit.vo.EvalArrayVO;
import kr.or.ddit.vo.LanguageVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.Project_fileVO;
import oracle.sql.CLOB;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/projectMgn/")
public class projectMgnController {
	@Autowired 
	private IAdProjectService projectService;
	@Autowired
	private ProjectTechService techservice;
	@Autowired
	private ProjectService service;
	@Autowired
	private ApplyService appService;
	@Autowired
	private ContractFileService conFileService;
	@Autowired
	private AlarmService alarmService;
	@Autowired
	private IMemberService memService;
	@Autowired
	private ProjectFileService prFileService;
	@Autowired
	private kr.or.ddit.frMyProject.service.ProjectService ProjectService;
	@Autowired
	private IEvalationService evalService;
	@Autowired
	private IMemberService memberService;
	
	@RequestMapping("standbyPjList")
	public ModelAndView standbyPjList(ModelAndView andView, Map<String, String> params,
			String search_keyword, HttpServletRequest request, String currentPage) throws Exception{
		if(currentPage==null){
			currentPage="1";
		}
		
		params.put("search_keyword", search_keyword);
		int countFree = projectService.countPro(params);
		
		RolePagingUtil pagingUtil = new RolePagingUtil(countFree, Integer.parseInt(currentPage), request);
		params.put("startCount", String.valueOf(pagingUtil.getStartCount()));
		params.put("endCount", String.valueOf(pagingUtil.getEndCount()));
		
		List<ProjectVO> adProjectList = projectService.stProjectList(params);
		
		for (ProjectVO prInfo : adProjectList) {
			String money = MoneyComma.toNumFormat(Integer.parseInt(prInfo.getPr_payment()));
			prInfo.setPr_payment(money);
		}
		
		andView.addObject("adProjectList", adProjectList);
		andView.addObject("pagingUtil", pagingUtil.getPageHtmls());
		andView.addObject("search_keyword", search_keyword);
		
		andView.setViewName("admin/projectMgn/standbyPjList");
		
		return andView;
	}
	
	@RequestMapping("accProject")
	public String accProject(Map<String, String> params, String pr_num) throws Exception{
		params.put("pr_num", pr_num);
		projectService.accProject(params);
		
		ProjectVO project = service.projectInfo(params);
		params.put("client", project.getClient());
		params.put("content", project.getPr_title()+" 검수완료 되었습니다.");
		alarmService.insertAlarmMessage(params);
		
		
		
		return "forward:/projectMgn/standbyPjList.do";
	}
	
	@RequestMapping("refuProject")
	public String refuProject(Map<String, String> params, String pr_num, String pr_ref) throws Exception{
		params.put("pr_num", pr_num);
		params.put("pr_ref", pr_ref);
		projectService.refuProject(params);
		projectService.insertRefuse(params);
		
		ProjectVO project = service.projectInfo(params);
		params.put("client", project.getClient());
		params.put("content", project.getPr_title()+" 검수결과 거절되었습니다. 사유를 확인하세요.");
		alarmService.insertAlarmMessage(params);
		
		return "forward:/projectMgn/standbyPjList.do";
	}

	@RequestMapping("standbyPjView")
	public ModelAndView standbyPjView(ModelAndView andView, String pr_num, Map<String, String> params) throws Exception {
		params.put("pr_num", pr_num);
		ProjectVO project = projectService.stProjectView(params);
		
		params.put("prFile_num", pr_num);
		Project_fileVO proFile = prFileService.fileInfo(params);
		
		String money = MoneyComma.toNumFormat(Integer.parseInt(project.getPr_payment()));
		project.setPr_payment(money);
		
		List<LanguageVO> lang = techservice.techList(pr_num);
		project.setTechList(lang);
		MemberVO client = memberService.selectClient(project.getClient());
		params.put("mem_id", client.getMem_id());
		int countRegis = this.ProjectService.clCountRegisPr(params);
		int countContract = this.ProjectService.clCountContract(params);
		int countProjecting = this.ProjectService.clCountProjecting(params);
		int countEnd = this.ProjectService.clCountEndPr(params);
		String [] eval = {"전문성&nbsp&nbsp&nbsp","만족도&nbsp&nbsp&nbsp","의사소통","일정준수","적극성&nbsp&nbsp&nbsp"};
		
		andView.addObject("proFile", proFile);
		andView.addObject("project", project);
		andView.addObject("countRegis",countRegis);
		andView.addObject("countContract",countContract);
		andView.addObject("countProjecting",countProjecting);
		andView.addObject("countEnd",countEnd);
		andView.addObject("client",client); 
		
		params.put("ev_to", project.getClient());
		if(this.evalService.countEval(params)==0){
			List<EvalArrayVO> evalList = new ArrayList<EvalArrayVO>();
			for (int i = 0; i < eval.length; i++) {
				EvalArrayVO evalVO = new EvalArrayVO();
				evalVO.setEval(eval[i]);
				evalList.add(evalVO);
			}
			andView.addObject("evalList", evalList);
			andView.setViewName("admin/projectMgn/standbyPjView");
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
			
			andView.setViewName("admin/projectMgn/standbyPjView");
			return andView;
		}
	
	}
	
	@RequestMapping("contractPjList")
	public ModelAndView contractPjList(Map<String, String> params, String search_data, String search_code, 
			ModelAndView andView, String currentPage, HttpServletRequest request) throws Exception {
		params.put("search_data", search_data);
		params.put("search_code", search_code);
		params.put("currentPage", currentPage);
		if (currentPage == null) {
			currentPage = "1";
		}
		int totalCount = projectService.conProjectCount(params);
		
		RolePagingUtil paging = new RolePagingUtil(totalCount, Integer.parseInt(currentPage), request);
		
		String startCount = String.valueOf(paging.getStartCount());
		String endCount = String.valueOf(paging.getEndCount());
		String htmlCode = paging.getPageHtmls();
		params.put("startCount", startCount);
		params.put("endCount", endCount);
		List<HashMap<String, Object>> projectList = projectService.conProjectList(params);
		for (HashMap<String, Object> prInfo : projectList) {
			String money = MoneyComma.toNumFormat(Integer.parseInt(String.valueOf(prInfo.get("CONS_PAYMENT"))));
			prInfo.put("CONS_PAYMENT", money);
		}
		
		andView.addObject("htmlCode", htmlCode);
		andView.addObject("projectList", projectList);
		andView.setViewName("admin/projectMgn/contractPjList");
		return andView;
	}
	@RequestMapping("projectingList")
	public ModelAndView projectingList(Map<String, String> params, String search_data, String search_code, 
			ModelAndView andView, String currentPage, HttpServletRequest request) throws Exception {
		params.put("search_data", search_data);
		params.put("search_code", search_code);
		params.put("currentPage", currentPage);
		if (currentPage == null) {
			currentPage = "1";
		}
		int totalCount = projectService.projectingCount(params);
		
		RolePagingUtil paging = new RolePagingUtil(totalCount, Integer.parseInt(currentPage), request);
		
		String startCount = String.valueOf(paging.getStartCount());
		String endCount = String.valueOf(paging.getEndCount());
		String htmlCode = paging.getPageHtmls();
		params.put("startCount", startCount);
		params.put("endCount", endCount);
		List<HashMap<String, Object>> projectList = projectService.projectingList(params);
		for (HashMap<String, Object> prInfo : projectList) {
			String money = MoneyComma.toNumFormat(Integer.parseInt(String.valueOf(prInfo.get("CONS_PAYMENT"))));
			prInfo.put("CONS_PAYMENT", money);
		}
		
		andView.addObject("htmlCode", htmlCode);
		andView.addObject("projectList", projectList);
		andView.setViewName("admin/projectMgn/projectingList");
		return andView;
	}
	
	@RequestMapping("contractPjView")
	public ModelAndView contractPjView(ModelAndView andView, String pr_num, 
			Map<String, String> params) throws Exception{
		params.put("pr_num", pr_num);
		ProjectVO projectInfo = service.projectView(params);
		if (projectInfo.getPr_payment() != null) {
			String money = MoneyComma.toNumFormat(Integer.parseInt(projectInfo.getPr_payment()));
			projectInfo.setPr_payment(money);
		}
		params.put("mem_id", projectInfo.getClient());
		MemberVO memberInfo = memService.memberInfo(params);
		List<HashMap<String, Object>> conList = appService.conList(params);
		for (HashMap<String, Object> conInfo : conList) {
			String content = CLOBtoString.clobToString((CLOB)conInfo.get("AP_CONTENT"));
			conInfo.put("AP_CONTENT", content);
			if (conInfo.get("CONS_PAYMENT") != null) {
				String money = MoneyComma.toNumFormat(Integer.parseInt(String.valueOf(conInfo.get("CONS_PAYMENT"))));
				conInfo.put("CONS_PAYMENT", money);
			}
		}
		andView.addObject("memberInfo", memberInfo);
		andView.addObject("projectInfo", projectInfo);
		andView.addObject("conList", conList);
		andView.setViewName("admin/projectMgn/contractPjView");
		return andView;
	}
	
	@RequestMapping("progressPjList")
	public String progressPjList() {
		return "admin/projectMgn/progressPjList";
	}
	
	@RequestMapping("pjCondition")
	public String pjCondition() {
		return "admin/projectMgn/pjCondition";
	}
	
	@RequestMapping("ganttChart")
	public String ganttChart() {
		return "admin/projectMgn/ganttChart";
	}
	
	@RequestMapping("cloud")
	public String cloud() {
		return "admin/projectMgn/cloud";
	}
	
	@RequestMapping("adEndPrList")
	public ModelAndView adEndPrList(ModelAndView andView, Map<String, String> params, 
			String search_keyword, String currentPage, HttpServletRequest request) throws Exception{
		if(currentPage==null){
			currentPage="1";
		}
		
		params.put("search_keyword", search_keyword);
		int endCount = projectService.countEnd(params);
		
		RolePagingUtil pagingUtil = new RolePagingUtil(endCount, Integer.parseInt(currentPage), request);
		params.put("startCount", String.valueOf(pagingUtil.getStartCount()));
		params.put("endCount", String.valueOf(pagingUtil.getEndCount()));
		
		List<ProjectVO> adEndPrList = projectService.adEndPrList(params);
		
		for (ProjectVO prInfo : adEndPrList) {
			String money = MoneyComma.toNumFormat(Integer.parseInt(prInfo.getPr_payment()));
			prInfo.setPr_payment(money);
		}
		
		if(adEndPrList.size()==0){
			andView.addObject("noProject", "검색 조건의 프로젝트가 없습니다.");
		}else{
			andView.addObject("adEndPrList", adEndPrList);
		}
		
		andView.addObject("pagingUtil", pagingUtil.getPageHtmls());
		andView.addObject("endCount", endCount);
		andView.setViewName("admin/projectMgn/adEndPrList");
		
		return andView;
	}
	
	@RequestMapping("adEndPrView")
	public ModelAndView adEndPrView(ModelAndView andView, String pr_num, Map<String, String> params) throws Exception{
		params.put("pr_num", pr_num);
		
		ProjectVO adEndProject = projectService.adEndPrView(params);
		
		String money = MoneyComma.toNumFormat(Integer.parseInt(adEndProject.getPr_payment()));
		adEndProject.setPr_payment(money);
		
		List<LanguageVO> lang = techservice.techList(pr_num);
		adEndProject.setTechList(lang);
		
		andView.addObject("adEndProject", adEndProject);
		andView.setViewName("admin/projectMgn/adEndPrView");
		
		return andView;
	}
	
	@RequestMapping("projectDelete")
	public String projectDelete(String pr_num, Map<String, String> params) throws Exception{
		params.put("pr_num", pr_num);
		projectService.projectDelete(params);
		return "forward:/projectMgn/contractPjList.do";
	}
	@RequestMapping("advprojectDelete")
	public String advprojectDelete(String pr_num, Map<String, String> params) throws Exception{
		params.put("pr_num", pr_num);
		projectService.projectDelete(params);
		return "forward:/projectMgn/adverProjectList.do";
	}
	@RequestMapping("contractProject")
	public String contractProject(String pr_num, Map<String, String> params) throws Exception{
		params.put("pr_num", pr_num);
		projectService.contractProject(params);
		return "forward:/projectMgn/contractPjList.do";
	}
	@RequestMapping("contractDownload")
	public ModelAndView contractDownload(ModelAndView andView, String cons_num,
			Map<String, String> params) throws Exception{
		params.put("cons_num", cons_num);
		Constract_fileVO fileInfo = conFileService.fileInfo(params);
		File downloadFile = new File(GlobalConstant.FILE_PATH, fileInfo.getConsfile_save_name());
		
		andView.setViewName("downloadView");
		andView.addObject("downloadFile", downloadFile);
		andView.addObject("fileName", fileInfo.getConsfile_name());
		return andView;
	}
	@RequestMapping("adverProjectList")
	public ModelAndView adverProjectList(ModelAndView andView, Map<String, String> params, 
			String search_code,String search_data, String currentPage, HttpServletRequest request) throws Exception{
		
		if (currentPage == null || currentPage.equals("")) {
			currentPage = "1";
		}
		
		params.put("search_data", search_data);
		params.put("search_code", search_code);
		int totalCount =  projectService.adverPrCount(params);

		RolePagingUtil paging = new RolePagingUtil(totalCount, Integer.parseInt(currentPage), request);
		String startCount = String.valueOf(paging.getStartCount());
		String endCount = String.valueOf(paging.getEndCount());
		params.put("startCount", startCount);
		params.put("endCount", endCount);
		
		List<HashMap<String, Object>> projectList = projectService.adverProjectList(params);
		String htmlCode = paging.getPageHtmls(); 

		andView.addObject("htmlCode", htmlCode);
		andView.addObject("projectList", projectList);
		andView.setViewName("admin/projectMgn/adverProjectList");
		return andView;
	}
	
	@RequestMapping("adverProjectView")
	public ModelAndView adverProjectView(ModelAndView andView, String pr_num, 
			Map<String, String> params) throws Exception{
		params.put("pr_num", pr_num);
		ProjectVO projectInfo = service.projectView(params);
		if (projectInfo.getPr_payment() != null) {
			String money = MoneyComma.toNumFormat(Integer.parseInt(projectInfo.getPr_payment()));
			projectInfo.setPr_payment(money);
		}
		params.put("mem_id", projectInfo.getClient());
		MemberVO memberInfo = memService.memberInfo(params);
		
		List<HashMap<String, Object>> appList = appService.appList(params);
		for (HashMap<String, Object> appInfo : appList) {
			String content = CLOBtoString.clobToString((CLOB)appInfo.get("AP_CONTENT"));
			appInfo.put("AP_CONTENT", content);
			if (appInfo.get("AP_PAYMENT") != null) {
				String money = MoneyComma.toNumFormat(Integer.parseInt(String.valueOf(appInfo.get("AP_PAYMENT"))));
				appInfo.put("AP_PAYMENT", money);
			}
		}
		andView.addObject("memberInfo", memberInfo);
		andView.addObject("projectInfo", projectInfo);
		andView.addObject("appList", appList);
		andView.setViewName("admin/projectMgn/adverProjectView");
		return andView;
	}
	@RequestMapping("adverEndProject")
	public String adverEndProject(Map<String, String> params, String pr_num) throws Exception{
		params.put("pr_num", pr_num);
		projectService.adverEndProject(params);
		return "forward:/projectMgn/adverProjectList.do";
	};
	
}
