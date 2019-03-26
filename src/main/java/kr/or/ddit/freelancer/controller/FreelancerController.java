package kr.or.ddit.freelancer.controller;

import java.security.Provider.Service;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.academic.service.IAcademicService;
import kr.or.ddit.carrer.service.ICareerService;
import kr.or.ddit.constract.service.ContractService;
import kr.or.ddit.evalation.service.IEvalationService;
import kr.or.ddit.frMyEndProject.service.FrMyEndProjectService;
import kr.or.ddit.frMyProject.service.ProjectService;
import kr.or.ddit.frTech.service.IFrTechService;
import kr.or.ddit.interest.service.InterestService;
import kr.or.ddit.license.service.ILicenseService;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.portfolio.service.IPortfolioFileService;
import kr.or.ddit.portfolio.service.IPortfolioService;
import kr.or.ddit.project.service.ApplyService;
import kr.or.ddit.project.service.ProjectTechService;
import kr.or.ddit.utils.MoneyComma;
import kr.or.ddit.utils.RolePagingUtil;
import kr.or.ddit.vo.AcademicVO;
import kr.or.ddit.vo.CareerVO;
import kr.or.ddit.vo.EvalArrayVO;
import kr.or.ddit.vo.Interest_projectVO;
import kr.or.ddit.vo.Intest_FreelancerVO;
import kr.or.ddit.vo.LanguageVO;
import kr.or.ddit.vo.LicenseVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PortfolioVO;
import kr.or.ddit.vo.Portfolio_fileVO;
import kr.or.ddit.vo.Portfolio_file_joinVO;
import kr.or.ddit.vo.TechniqueVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/freelancer/")
public class FreelancerController {
	@Autowired
	private IMemberService memberService;

	@Autowired
	private IPortfolioService portfolioService;
	
	@Autowired
	private IFrTechService frTechService;
	
	@Autowired
	private ICareerService careerService;
	
	@Autowired
	private IAcademicService academicService;
	
	@Autowired
	private ILicenseService licenseService;
	
	@Autowired
	private IPortfolioFileService portFileService;
	
	@Autowired
	private InterestService interestService;
	
	@Autowired
	private ProjectTechService techservice;
	private RolePagingUtil pagingUtil;
	
	@Autowired
	private IEvalationService evalService;
	
	@Autowired
	private ApplyService applyService;

	@Autowired
	private ContractService service;
	
	@Autowired
	private ContractService conService;
	
	@Autowired
	private FrMyEndProjectService endPrService;
	
	@Autowired
	private ProjectService projectService;

	@RequestMapping("freelancerList")
	public ModelAndView freelancerList(ModelAndView andView, Map<String, String> params,
			String search_keyword, String search_keycode, HttpServletRequest request, String currentPage) throws Exception{
		if(currentPage==null){
			currentPage="1";
		}
		
		params.put("search_keycode", search_keycode);
		params.put("search_keyword", search_keyword);
		
		int countFree = memberService.countFree(params);
		
		RolePagingUtil pagingUtil = new RolePagingUtil(countFree, Integer.parseInt(currentPage), request);
		params.put("startCount", String.valueOf(pagingUtil.getStartCount()));
		params.put("endCount", String.valueOf(pagingUtil.getEndCount()));
		
		List<MemberVO> freeList = memberService.freeList(params);
		
		for(MemberVO member : freeList){
			String mem_id = member.getMem_id();
			params.put("mem_id", mem_id);
			List<LanguageVO> repreList = memberService.repreTech(params);
			if (repreList != null) {
				member.setTechList(repreList);
			}
		}
		
		if(freeList.size()==0){
			andView.addObject("noList", "검색하는 프리랜서가 없습니다.");
			
		}else{
			andView.addObject("freeList", freeList);
		}
		
		MemberVO client = (MemberVO) request.getSession().getAttribute("USER_LOGININFO");
		if(client !=null){
			params.put("mem_id", client.getMem_id());
			List<Intest_FreelancerVO> interestList = interestService.selectFreelancer(params);
			andView.addObject("interestList",interestList);
		}
		
		int totalCount =memberService.totalCountFree();
		andView.addObject("totalCount", totalCount);
		andView.addObject("search_keycode", search_keycode);
		andView.addObject("paging", pagingUtil.getPageHtmls());
		
		andView.setViewName("user/freelancer/freelancerList");
		
		return andView;
	}
	
	@RequestMapping("freelancerView")
	public ModelAndView freelancerView(ModelAndView andView, String mem_id, Map<String, String> param) throws Exception{
		param.put("mem_id", mem_id);
		
		List<TechniqueVO> techList = this.frTechService.techList(param);
		List<CareerVO> careerList = this.careerService.careerList(param);
		List<AcademicVO> academicList = this.academicService.academicList(param);
		List<LicenseVO> licenseList = this.licenseService.licenseList(param);
		List<PortfolioVO> portList = this.portfolioService.portfolioList(param);
		List<Portfolio_fileVO> portFileList = this.portFileService.fileItemList();
		MemberVO memberInfo = this.memberService.memberInfo(param);
		Map<String, String> paramEvto = new HashMap<String, String>();
		paramEvto.put("ev_to", mem_id);
		String [] eval = {"전문성&nbsp&nbsp&nbsp","만족도&nbsp&nbsp&nbsp","의사소통","일정준수","적극성&nbsp&nbsp&nbsp"};
		if(this.evalService.countEval(paramEvto)==0){
			
			
			List<EvalArrayVO> evalList = new ArrayList<EvalArrayVO>();
			for (int i = 0; i < eval.length; i++) {
				EvalArrayVO evalVO = new EvalArrayVO();
				evalVO.setEval(eval[i]);
				evalList.add(evalVO);
			}
		
			andView.addObject("techList", techList);
			andView.addObject("careerList", careerList);
			andView.addObject("academicList", academicList);
			andView.addObject("licenseList", licenseList);
			andView.addObject("memberInfo", memberInfo);
			andView.addObject("portList", portList);
			andView.addObject("portFileList", portFileList);
			andView.addObject("evalList", evalList);

			andView.setViewName("user/freelancer/freelancerView");
		
			return andView;
		}else{
			double ev_professione = this.evalService.evalAvgPro(paramEvto);
			double ev_satisfy = this.evalService.evalAvgSati(paramEvto);
			double ev_communi = this.evalService.evalAvgComm(paramEvto);
			double ev_schedule = this.evalService.evalAvgSche(paramEvto);
			double ev_active = this.evalService.evalAvgActi(paramEvto);
			double [] evalVal = {ev_professione, ev_satisfy, ev_communi, ev_schedule, ev_active};
			
			List<EvalArrayVO> evalList = new ArrayList<EvalArrayVO>();
			for (int i = 0; i < evalVal.length; i++) {
				EvalArrayVO evalVO = new EvalArrayVO();
				evalVO.setEval(eval[i]);
				evalVO.setEvalVal(evalVal[i]);
				evalList.add(evalVO);
			}
			double countEvalDouble = this.evalService.countEval(paramEvto);
			double evalTotalSum = this.evalService.evalTotalSum(paramEvto);
			
			double total = (evalTotalSum/(countEvalDouble*5));
			double totalAvg = Math.round(total*10)/10.0;
			
			List<HashMap<String, Object>> applyList = this.applyService.selectList(param);
			int endProject = this.endPrService.endCount(param);
			int totalP = this.endPrService.frEndPayment(param);
			int projecting = this.projectService.countProjecting(param);
			int countEval = this.evalService.countEval(paramEvto);
			
			int apply = applyList.size();
			
			String totalPayment = MoneyComma.toNumFormat(totalP);
			
			andView.addObject("apply", apply);
			andView.addObject("endProject", endProject);
			andView.addObject("projecting", projecting);
			andView.addObject("totalPayment", totalPayment);
			andView.addObject("techList", techList);
			andView.addObject("careerList", careerList);
			andView.addObject("academicList", academicList);
			andView.addObject("licenseList", licenseList);
			andView.addObject("memberInfo", memberInfo);
			andView.addObject("portList", portList);
			andView.addObject("portFileList", portFileList);
			andView.addObject("evalList", evalList);
			andView.addObject("countEval", countEval);
			andView.addObject("totalAvg", totalAvg);
			andView.setViewName("user/freelancer/freelancerView");
	
			return andView;
		}
	}
	
	@RequestMapping("portfolioView")
	public ModelAndView portfolioView(ModelAndView andView, String mem_id, String po_num) throws Exception{
		
		Map<String, String> param = new HashMap<String, String>();
		param.put("po_num", po_num);
		
		Portfolio_file_joinVO portfolioVO = this.portfolioService.portfolioInfoJoin(param);
		
		andView.addObject("portInfo", portfolioVO);
		andView.addObject("mem_id", mem_id);
		andView.setViewName("user/freelancer/frPortfolioView");
		
		return andView;
		
	}
}
