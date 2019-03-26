package kr.or.ddit.frMyProject.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.frMyProject.service.ContractService;
import kr.or.ddit.frMyProject.service.CategoryService;
import kr.or.ddit.frMyProject.service.ContractService;
import kr.or.ddit.frMyProject.service.Free_typeService;
import kr.or.ddit.frMyProject.service.ProjectService;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.utils.MoneyComma;
import kr.or.ddit.utils.RolePagingUtil;
import kr.or.ddit.vo.CategoryVO;
import kr.or.ddit.vo.Cons_ClientJoinVO;
import kr.or.ddit.vo.Cons_MemJoinVO;
import kr.or.ddit.vo.Free_TypeVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ProjectVO;

import org.apache.catalina.tribes.tipis.AbstractReplicatedMap.MapOwner;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/frmyproject/")
public class FrMyProjectController {
	@Autowired
	private ContractService conService;
	@Autowired
	private ProjectService prService;
	@Autowired
	private CategoryService cateService;
	@Autowired
	private Free_typeService fTypeService;
	@Autowired
	private IMemberService memberService;
	@Autowired
	private kr.or.ddit.project.service.ProjectService projectService;
	
	
	@RequestMapping("tool")
	public ModelAndView tool(ModelAndView andView, Map<String, String> params,
			HttpSession session)
	throws Exception{
		andView.setViewName("window/frmyproject/tool");
		return andView;
	} 
	
	@RequestMapping("projectList")
	public ModelAndView myProjectList(ModelAndView andView, Map<String, String> params, String mem_id,
			HttpServletRequest request, String currentPage, String search_code, String search_data, HttpSession session) throws Exception {
		params.put("cons_free_id", mem_id);
		
		int totalCount = conService.myProjectCount(params);
		if (currentPage == null) {
			currentPage = "1";
		}
		RolePagingUtil paging = new RolePagingUtil(totalCount, Integer.parseInt(currentPage), request);
		String startCount = String.valueOf(paging.getStartCount());
		String endCount = String.valueOf(paging.getEndCount());
		
		params.put("search_code", search_code);
		params.put("search_data", search_data);

		params.put("startCount", startCount);
		params.put("endCount", endCount);
		
		String htmlCode = paging.getPageHtmls();
		
		List<HashMap<String, Object>> projectList = conService.projectingList(params);
		for (HashMap<String, Object> projectInfo : projectList) {
			int num = Integer.parseInt(String.valueOf(projectInfo.get("CONS_PAYMENT")+""));
			projectInfo.put("CONS_PAYMENT", MoneyComma.toNumFormat(num));
		}
		
		andView.addObject("htmlCode", htmlCode);
		andView.addObject("projectList", projectList);
		andView.setViewName("user/frmyproject/frMyProjectList");
		return andView;
	}
	@RequestMapping("projectView")
	public ModelAndView myProjectView(ModelAndView andView, String pnum, String part,
			Map<String, String> params, HttpSession session, Map<String, String> paramPrnum, String mem_id) throws Exception{
		MemberVO adminInfo = (MemberVO) session.getAttribute("ADMIN_LOGININFO");
		if (adminInfo == null) {
			if (mem_id == null) {
				MemberVO memberInfo = (MemberVO) session.getAttribute("USER_LOGININFO");
				mem_id = memberInfo.getMem_id();
			}
		}
		if (pnum == "") {
			pnum = (String) session.getAttribute("pnum");
		}
		params.put("pr_num", pnum);
		ProjectVO projectInfo = prService.myProjectInfo(params);
		if (projectInfo.getPr_payment() != null) {
			String money = MoneyComma.toNumFormat(Integer.parseInt(projectInfo.getPr_payment()));
			projectInfo.setPr_payment(money);
		}
		
		params.put("cate_num", projectInfo.getPr_cate_num());
		CategoryVO cateInfo = cateService.categoryStatus(params);
		
		params.put("ftype_num", cateInfo.getCate_category());
		Free_TypeVO fTypeInfo = fTypeService.typeStatus(params);
		
		params.put("cons_proj_num", pnum);
		List<HashMap<String, Object>> memList = conService.memList(params);
		if (part != null) {
			session.setAttribute("part", part);
		}

		paramPrnum.put("pr_num", pnum);
		List<Cons_MemJoinVO> consMemInfo = this.conService.evalFree(paramPrnum);
		Cons_ClientJoinVO consClInfo = this.conService.evalClient(params);
		if (adminInfo == null) {
			Map<String, String> paramMemId = new HashMap<String, String>();
			paramMemId.put("mem_id", mem_id);
			int checkIden = this.memberService.checkIden(paramMemId);
			if(checkIden==2){
				Map<String, String> paramCheck = new HashMap<String, String>();
				paramCheck.put("cons_free_id", mem_id);
				paramCheck.put("cons_proj_num", pnum);
				int checkEndChk = this.conService.checkEndChk(paramCheck);
				andView.addObject("checkEndChk", checkEndChk);
			}
			String [] eval = {"전문성","만족도","의사소통","일정준수","적극성"};
			andView.addObject("eval", eval);
		}
		
		session.setAttribute("pnum", projectInfo.getPr_num());
		andView.addObject("memList", memList);
		andView.addObject("part", part);
		andView.addObject("fTypeInfo", fTypeInfo);
		andView.addObject("projectInfo", projectInfo);
		andView.addObject("consMemInfo", consMemInfo);
		andView.addObject("consClInfo", consClInfo);
		andView.addObject("cateInfo", cateInfo);
		andView.addObject("pnum", pnum);
		
		if (session.getAttribute("ADMIN_LOGININFO") != null) {
			andView.setViewName("adm/frmyproject/frMyProjectView");
		}else{
			andView.setViewName("user/frmyproject/frMyProjectView");
		}
		return andView;
	}
	
	@RequestMapping("updateEndCheck")
	@ResponseBody
	public ModelAndView updateEndCheck(String pr_num, ModelAndView andView) throws Exception{
		Map<String, String> params = new HashMap<String, String>();
		params.put("pr_num", pr_num);
		
		Map<String, String> jsonMap = new HashMap<String, String>();
		int cnt = this.prService.updateEndCheck(params);
		
		if (cnt == 1) {
			jsonMap.put("flag", "true");
		}else{
			jsonMap.put("flag", "false");
		}
		
		andView.addObject("result", jsonMap);
		andView.setViewName("jsonConvertView");
		return andView;
		
	}

	@RequestMapping("updatePrStatus")
	public ModelAndView updatePrStatus(String pr_num, ModelAndView andView, Map<String, String> params, 
			String mem_id, HttpSession session) throws Exception{
		
		params.put("pr_num", pr_num);
		this.prService.updatePrStatus(params);
		
		params.put("cons_free_id", mem_id);
		int frendPro = projectService.frEndCount(params);
		int frproing = projectService.frProing(params);
		int tempMoney = projectService.frProMoney(params);
		String frproMoney = MoneyComma.toNumFormat(tempMoney);
		session.setAttribute("frendPro", frendPro);
		session.setAttribute("frproing", frproing);
		session.setAttribute("frproMoney", frproMoney);
		
		andView.addObject("mem_id", mem_id);
		andView.setViewName("redirect:/frmyproject/projectList.do");

		return andView;
	}
	
	@RequestMapping("endProjectList")
	public String myEndProjectList() {
		return "user/frmyendproject/frMyEndProjectList";
	}
	@RequestMapping("endProjectView")
	public String myEndProjectView() {
		return "user/frmyendproject/frMyEndProjectView";
	}

	
}
