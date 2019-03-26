package kr.or.ddit.clRegProject.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.clRegProject.service.ClRegProjectService;
import kr.or.ddit.constract.service.ContractService;
import kr.or.ddit.frMyProject.service.ProjectService;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.project.service.ApplyService;
import kr.or.ddit.utils.CLOBtoString;
import kr.or.ddit.utils.MoneyComma;
import kr.or.ddit.vo.ApmeetingVO;
import kr.or.ddit.vo.ApplyVO;
import kr.or.ddit.vo.ConstractVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ProjectVO;
import oracle.sql.CLOB;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/clRegProject/")
public class ClRegProjectController {
	@Autowired
	private ClRegProjectService regService;
	@Autowired
	private IMemberService memberService;
	@Autowired
	private ApplyService appService;
	@Autowired
	private ProjectService prService;
	@Autowired
	private ContractService conService;
	
	
	@RequestMapping("regProjectList")
	public ModelAndView regProjectList(ModelAndView andView, Map<String, String> params, String search_keyword, 
			HttpServletRequest request, String currentPage, HttpSession session) throws Exception{
		if(currentPage==null){
			currentPage="1";
		}
		params.put("search_keyword", search_keyword);
		
		MemberVO member = (MemberVO) session.getAttribute("USER_LOGININFO");
		params.put("client", member.getMem_id());
		
		List<HashMap<String, Object>> regPrList = regService.regProjectList(params);
		if(regPrList.size()==0){
			andView.addObject("noProject", "등록된 프로젝트가 없습니다.");
		}else{
			for(int i=0; i<regPrList.size(); i++){
				CLOB clob = (CLOB) regPrList.get(i).get("PR_CONTENT");
				String result = CLOBtoString.clobToString(clob);
				regPrList.get(i).put("PR_CONTENT", result);
				params.put("client", (String) regPrList.get(i).get("CLIENT"));
				MemberVO client = memberService.memberInfo(params);
				String money = String.valueOf(regPrList.get(i).get("PR_PAYMENT"));
				money = MoneyComma.toNumFormat(Integer.parseInt(money));
				regPrList.get(i).put("PR_PAYMENT", money);
				regPrList.get(i).put("client", client);
			}
			andView.addObject("regPrList", regPrList);
		}
		andView.setViewName("user/clMyProject/regProjectList");
		return andView;
	}
	
	@RequestMapping("regProjectView")
	public ModelAndView regProjectView(ModelAndView andView, String pr_num, 
			Map<String, String> params) throws Exception{
		params.put("pr_num", pr_num);
		ProjectVO projectInfo = prService.myProjectInfo(params);
		List<HashMap<String, Object>> appList = appService.appList(params);
		for (HashMap<String, Object> appInfo : appList) {
			String ap_content = CLOBtoString.clobToString((CLOB)appInfo.get("AP_CONTENT")) ;
			appInfo.put("AP_CONTENT", ap_content);
			String money = MoneyComma.toNumFormat(Integer.parseInt(String.valueOf(appInfo.get("AP_PAYMENT"))));
			appInfo.put("AP_PAYMENT", money);
		}
		
		andView.addObject("pr_num", pr_num);
		andView.addObject("projectInfo", projectInfo);
		andView.addObject("appList", appList);
		andView.setViewName("user/clMyProject/regProjectView");
		return andView;
	}
	
	@RequestMapping("regContent")
	@ResponseBody
	public ModelAndView regContent(ModelAndView andView, String ap_num, 
			Map<String, String> params) throws Exception{
		params.put("ap_num", ap_num);
		ApplyVO appInfo = appService.appInfo(params);
		andView.addObject("appInfo", appInfo);
		andView.setViewName("jsonConvertView");
		return andView;
	}
	@RequestMapping("regMeet")
	@ResponseBody
	public ModelAndView regMeet(ModelAndView andView, String ap_num, 
			Map<String, String> params, String pr_num) throws Exception{
		params.put("ap_num", ap_num);
		params.put("pr_num", pr_num);
		ProjectVO projectInfo = prService.myProjectInfo(params);
		ApplyVO appInfo = appService.appInfo(params);
		andView.addObject("appInfo", appInfo);
		andView.addObject("projectInfo", projectInfo);
		andView.setViewName("jsonConvertView");
		return andView;
	}
	@RequestMapping("regMeetingAdd")
	public String regMeetingAdd(ApmeetingVO apMtInfo, String pr_num, Map<String, String> params) throws Exception{
		appService.insertAppMeeting(apMtInfo);
		params.put("ap_num", apMtInfo.getApmt_num());
		appService.updateStatus(params);
		return "forward:/clRegProject/regProjectView.do";
	}
	
	@RequestMapping("sorryApply")
	public String sorryApply(String ap_num,String pr_num, 
			Map<String, String> params) throws Exception{
		params.put("ap_num", ap_num);
		params.put("pr_num", pr_num);
		appService.sorryApply(params);
		return "forward:/clRegProject/regProjectView.do";
	}
	@RequestMapping("okayApply")
	public String okayApply(String ap_num,String pr_num, 
			Map<String, String> params, HttpSession session) throws Exception{
		params.put("ap_num", ap_num);
		params.put("pr_num", pr_num);
		appService.okayApply(params);
		ApplyVO appInfo = appService.appInfo(params);
		ConstractVO consInfo = new ConstractVO();
		consInfo.setCons_free_id(appInfo.getAp_free());
		consInfo.setCons_proj_num(pr_num);
		conService.insertContract(consInfo);
		return "forward:/clRegProject/regProjectView.do";
	}
	@RequestMapping("endAdverProject")
	public String adverEndProject(Map<String, String> params, String pr_num) throws Exception{
		params.put("pr_num", pr_num);
		prService.adverEndProject(params);
		return "forward:/clRegProject/regProjectList.do";
	};
}
