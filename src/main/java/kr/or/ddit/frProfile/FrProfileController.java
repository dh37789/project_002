package kr.or.ddit.frProfile;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.or.ddit.academic.service.IAcademicService;
import kr.or.ddit.adManagement.service.MemberMgnService;
import kr.or.ddit.alarm.service.AlarmService;
import kr.or.ddit.bank.service.IBankAccountService;
import kr.or.ddit.carrer.service.ICareerService;
import kr.or.ddit.constract.service.ContractService;
import kr.or.ddit.constract.service.SignService;
import kr.or.ddit.evalation.service.IEvalationService;
import kr.or.ddit.frMyEndProject.service.FrMyEndProjectService;
import kr.or.ddit.frMyProject.service.CategoryService;
import kr.or.ddit.frMyProject.service.ProjectService;
import kr.or.ddit.frTech.service.IFrTechService;
import kr.or.ddit.license.service.ILicenseService;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.portfolio.service.IPortfolioFileService;
import kr.or.ddit.portfolio.service.IPortfolioService;
import kr.or.ddit.project.service.ApplyService;
import kr.or.ddit.utils.MoneyComma;
import kr.or.ddit.vo.AcademicVO;
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.Bank_accountVO;
import kr.or.ddit.vo.Bank_joinVO;
import kr.or.ddit.vo.CareerVO;
import kr.or.ddit.vo.CategoryVO;
import kr.or.ddit.vo.CrawlingVO;
import kr.or.ddit.vo.EvalArrayVO;
import kr.or.ddit.vo.LanguageVO;
import kr.or.ddit.vo.LicenseVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PortfolioVO;
import kr.or.ddit.vo.Portfolio_fileVO;
import kr.or.ddit.vo.Portfolio_file_joinVO;
import kr.or.ddit.vo.Project_noticeVO;
import kr.or.ddit.vo.Project_notice_fileVO;
import kr.or.ddit.vo.SignVO;
import kr.or.ddit.vo.TechniqueVO;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/freProfile/")
public class FrProfileController {
	
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
	private CategoryService cateService;
	
	@Autowired
	private IBankAccountService bankService;
	
	@Autowired
	private MemberMgnService memberMgnSerivce;
	
	@Autowired
	private SignService signService;
	
	@Autowired
	private AlarmService alarmService;
	
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
	
	@RequestMapping("frmyProfileList")
	public ModelAndView freProfileList(ModelAndView andView, String mem_id) throws Exception{
		
		Map<String, String> param = new HashMap<String, String>();
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
			
			andView.setViewName("user/frmyprofile/frMyProfileList");

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
		
		andView.setViewName("user/frmyprofile/frMyProfileList");

		return andView;
		}
	}
	
	@RequestMapping("infoView")
	public ModelAndView infoView(ModelAndView andView, String mem_id) throws Exception{
		
		Map<String, String> param = new HashMap<String, String>();
		param.put("mem_id", mem_id);
		MemberVO memberInfo = this.memberService.memberInfo(param);
		Map<String, String> params = new HashMap<String, String>();
		params.put("ac_mem", mem_id);
		Bank_joinVO bankInfo = this.bankService.bankAccountInfo(params);
		List<SignVO> signList = this.signService.signList(param);
		
		AlarmVO alarm = (AlarmVO) alarmService.selectAlarm(param);
				
		
		andView.addObject("alarm", alarm);
		andView.addObject("signList", signList);
		andView.addObject("memberInfo", memberInfo);
		andView.addObject("bankInfo", bankInfo);
		andView.setViewName("user/frmyprofile/frInfoView");
		
		return andView;
	}
	
	@RequestMapping("infoEditForm")
	public ModelAndView infoEditForm(ModelAndView andView, String mem_id) throws Exception{
		
		Map<String, String> param = new HashMap<String, String>();
		param.put("mem_id", mem_id);
		MemberVO memberInfo = this.memberService.memberInfo(param);
		
		andView.addObject("memberInfo", memberInfo);
		andView.setViewName("user/frmyprofile/frInfoEditForm");
		
		return andView;
	}
	
	
	@RequestMapping("updateInfo")
	public ModelAndView updateFreelancer(ModelAndView andview, MemberVO memberInfo, String mem_id,
			Map<String, String> params, HttpSession session) throws Exception {
		params.put("mem_id", mem_id);
		this.memberMgnSerivce.updateMember(memberInfo);
		MemberVO member = this.memberMgnSerivce.memberInfo(params);
		session.setAttribute("USER_LOGININFO", member);
		andview.addObject("mem_id", mem_id);
		andview.setViewName("redirect:/freProfile/infoView.do");
		
		return andview;
	}
	
	@RequestMapping("deleteMemPic")
	public ModelAndView deleteMemPic(String mem_id, Map<String, String> params,
			ModelAndView andView) throws Exception{
		params.put("mem_id", mem_id);
		
		int cnt = this.memberService.deleteMemPic(params);
		Map<String, String> jsonMap = new HashMap<String, String>();
		if (cnt == 1) {
			jsonMap.put("flag", "true");
		}else{
			jsonMap.put("flag", "false");
		}
		
		andView.addObject("result", jsonMap);
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	@RequestMapping("insertbankAccount")
	public ModelAndView insertbankAccount(ModelAndView andView, Bank_accountVO bank_acVO, String ac_mem, Map<String, String> param) throws Exception{
		
		this.bankService.insertbankAccount(bank_acVO);
		
		andView.addObject("mem_id", ac_mem);
		andView.setViewName("redirect:/freProfile/infoView.do");
		
		return andView;
		
	}
	
	@RequestMapping("updateBank")
	public ModelAndView updateBank(ModelAndView andview, Bank_accountVO bank_acVO, String ac_mem, Map<String, String> param) throws Exception {
		
		this.bankService.updatebankAccount(bank_acVO);
		
		andview.addObject("mem_id", ac_mem);
		andview.setViewName("redirect:/freProfile/infoView.do");
		
		return andview;
	}
	
	@RequestMapping("selfInfoBeforeForm")
	public String selfInfoBeforeForm() throws Exception{
		
		return "user/frmyprofile/frSelfInfoBeforeForm";
	}
//	@RequestMapping("selfInfoBeforeForm")
//	public ModelAndView selfInfoBeforeForm(ModelAndView andView, String mem_id) throws Exception{
//		Map<String, String> param = new HashMap<String, String>();
//		param.put("mem_id", mem_id);
//		
//		MemberVO memberInfo = this.memberService.memberInfo(param);
//		andView.addObject("memberInfo", memberInfo);
//		andView.setViewName("user/frmyprofile/frSelfInfoBeforeForm");
//		
//		return andView;
//	}
	
	@RequestMapping("selfInfoForm")
	public String selfInfoForm() throws Exception{
		
		return "user/frmyprofile/frSelfInfoForm";
	}
//	@RequestMapping("selfInfoForm")
//	public ModelAndView selfInfoForm(ModelAndView andView, String mem_id) throws Exception{
//		
//		Map<String, String> param = new HashMap<String, String>();
//		param.put("mem_id", mem_id);
//		
//		MemberVO memberInfo = this.memberService.memberInfo(param);
//		andView.addObject("memberInfo", memberInfo);
//		andView.setViewName("user/frmyprofile/frSelfInfoForm");
//		
//		return andView;
//	}
	
	@RequestMapping("updateSelfInfo")
	public ModelAndView updateSelfInfo(ModelAndView andView, MemberVO membervo, String mem_id) throws Exception{
		
		this.memberService.updateSelfInfo(membervo);
		Map<String, String> param = new HashMap<String, String>();
		param.put("mem_id", mem_id);
		if(this.memberService.selfInfoCheck(param)==null){
			andView.addObject("mem_id", mem_id);
			andView.setViewName("redirect:/freProfile/selfInfoBeforeForm.do");
			
			return andView;
		}
		andView.addObject("mem_id", mem_id);
		andView.setViewName("redirect:/freProfile/selfInfoBeforeView.do");
		
		return andView;
	}
	
	@RequestMapping("selfInfoBeforeView")
	public ModelAndView selfInfoBeforeView(ModelAndView andView, String mem_id) throws Exception{
		
		Map<String, String> param = new HashMap<String, String>();
		param.put("mem_id", mem_id);
		
		MemberVO memberInfo = this.memberService.memberInfo(param);
		andView.addObject("memberInfo", memberInfo);
		andView.setViewName("user/frmyprofile/frSelfInfoBeforeView");
		
		return andView;
	}
	
	@RequestMapping("selfInfoView")
	public ModelAndView selfInfoView(ModelAndView andView, String mem_id) throws Exception{
		
		Map<String, String> param = new HashMap<String, String>();
		param.put("mem_id", mem_id);
		
		MemberVO memberInfo = this.memberService.memberInfo(param);
		andView.addObject("memberInfo", memberInfo);
		andView.setViewName("user/frmyprofile/frSelfInfoView");

		return andView;
	}
	
	///////포트폴리오////////////////////////////////////////////////////////////////////
	
	@RequestMapping("portfolioBeforeForm")
	public ModelAndView portfolioBeforeForm(ModelAndView andView, String mem_id) throws Exception{
		
		Map<String, String> param = new HashMap<String, String>();
		param.put("mem_id", mem_id);
		
		List<PortfolioVO> portList = this.portfolioService.portfolioList(param);
		List<PortfolioVO> checkRepre = this.portfolioService.checkRepre(param);
		
		andView.addObject("checkRepre", checkRepre);
		andView.addObject("portList", portList);
		andView.setViewName("user/frmyprofile/frPortfolioBeforeForm");
		
		return andView;
	}
	
	@RequestMapping("portfolioForm")
	public String portfolioForm() throws Exception{
		
		return "user/frmyprofile/frPortfolioForm";
	}
	
//	@RequestMapping("portfolioForm")
//	public String portfolioForm() throws Exception{
//		
//		return "user/frmyprofile/frPortfolioForm";
//	}
	
	@RequestMapping("portfolioBeforeView")
	public ModelAndView portfolioBeforeView(ModelAndView andView, String mem_id, String po_num) throws Exception{
		
		Map<String, String> param = new HashMap<String, String>();
		param.put("po_num", po_num);
		
		Portfolio_file_joinVO portfolioVO = this.portfolioService.portfolioInfoJoin(param);
		
		andView.addObject("portInfo", portfolioVO);
		andView.setViewName("user/frmyprofile/frPortfolioBeforeView");
		
		return andView;
		
	}
	
	@RequestMapping("portfolioView")
	public ModelAndView portfolioView(ModelAndView andView, String mem_id, String po_num) throws Exception{
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("mem_id", mem_id);
		params.put("po_num", po_num);
		
		PortfolioVO portfolioVO = this.portfolioService.portfolioInfo(params);
		
		Map<String, String> param = new HashMap<String, String>();
		param.put("po_num", po_num);
		Portfolio_fileVO portFileInfo = this.portFileService.boardFileInfo(param);
		params.put("cate_num", portfolioVO.getPo_cate_num());
		Map<String, String> paramPonum = new HashMap<String, String>();
		paramPonum.put("lan_num", portfolioVO.getPo_tech());
		String po_tech = this.portfolioService.poTechName(paramPonum);
		portfolioVO.setPo_tech(po_tech);
		
		CategoryVO cateInfo = cateService.cateInfo(params);
		andView.addObject("cateInfo", cateInfo);
		andView.addObject("portInfo", portfolioVO);
		andView.addObject("portFileInfo", portFileInfo);
		andView.setViewName("user/frmyprofile/frPortfolioView");
		
		return andView;
		
	}
	
	@RequestMapping("insertPortfolio")
	public ModelAndView insertPortfolio(ModelAndView andView, PortfolioVO portfolioVO, String mem_id, String lang_tech) throws Exception{
		
		Map<String, String> param = new HashMap<String, String>();
		param.put("lan_name", lang_tech);
		String po_tech = this.portfolioService.poTech(param);
		portfolioVO.setPo_tech(po_tech);
		this.portfolioService.insertPortfolio(portfolioVO);
		
		andView.addObject("mem_id", mem_id);
		andView.setViewName("redirect:/freProfile/portfolioBeforeForm.do");
		
		return andView;

	}
	
	@RequestMapping("updatePortfolio")
	public ModelAndView updatePortfolio(ModelAndView andView, PortfolioVO portfolioVO, String mem_id, String po_num, String lang_tech) throws Exception{
		
		Map<String, String> param = new HashMap<String, String>();
		param.put("lan_name", lang_tech);
		String po_tech = this.portfolioService.poTech(param);
		portfolioVO.setPo_tech(po_tech);
		this.portfolioService.updatePortfolio(portfolioVO);
		
		andView.addObject("mem_id", mem_id);
		andView.addObject("po_num", po_num);
		andView.setViewName("redirect:/freProfile/portfolioBeforeView.do");
		
		return andView;
		
	}
	
	@RequestMapping("updatePortTotalRepre")
	public ModelAndView updatePortTotalRepre(ModelAndView andView, String mem_id) throws Exception{
		
		Map<String, String> param = new HashMap<String, String>();
		param.put("mem_id", mem_id);
		
		int cnt = this.portfolioService.updateTotalRepre(param);
		
		Map<String, String> jsonMap = new HashMap<String, String>();
		if (cnt != 0) {
			jsonMap.put("flag", "true");
		}else{
			jsonMap.put("flag", "false");
		}
		
		andView.addObject("result", jsonMap);
		andView.setViewName("jsonConvertView");
		return andView;
		
	}
	
	@RequestMapping("updatePortRepre")
	public ModelAndView updatePortRepre(ModelAndView andView, String mem_id, String po_num) throws Exception{
		
		Map<String, String> param = new HashMap<String, String>();
//		param.put("mem_id", mem_id);
		param.put("po_num", po_num);
		int cnt = this.portfolioService.updateRepre(param);
		Map<String, String> jsonMap = new HashMap<String, String>();
		if (cnt == 1) {
			jsonMap.put("flag", "true");
		}else{
			jsonMap.put("flag", "false");
		}
		
		andView.addObject("result", jsonMap);
		andView.setViewName("jsonConvertView");
		return andView;
		
	}
	
	@RequestMapping("deletePortfolio")
	public ModelAndView deletePortfolio(ModelAndView andView, String po_num, String mem_id) throws Exception{
		
		Map<String, String> param = new HashMap<String, String>();
		param.put("mem_id", mem_id);
		param.put("po_num", po_num);
		
		int cnt = this.portfolioService.deletePortfolio(param);
		
		Map<String, String> jsonMap = new HashMap<String, String>();
		if (cnt == 1) {
			jsonMap.put("flag", "true");
		}else{
			jsonMap.put("flag", "false");
		}
		
		andView.addObject("result", jsonMap);
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	@RequestMapping("portFileDelete")
	@ResponseBody
	public ModelAndView portFileDelete(String pofile_num,
			Map<String, String> params,
			ModelAndView andView) throws Exception{
		params.put("pofile_num", pofile_num);
		
		int cnt = this.portFileService.deleteFile(params);
		Map<String, String> jsonMap = new HashMap<String, String>();
		if (cnt == 1) {
			jsonMap.put("flag", "true");
		}else{
			jsonMap.put("flag", "false");
		}
		
		andView.addObject("result", jsonMap);
		andView.setViewName("jsonConvertView");
		return andView;
	}
//	@RequestMapping("frprojectntcView")
//	public ModelAndView noticeView(ModelAndView andView, String pnum,String part,String prno_num,
//			Map<String, String> params) throws Exception{
//		params.put("prno_num", prno_num);
//		Project_noticeVO boardInfo = service.boardInfo(params);
//		Project_notice_fileVO boardInfoFile = fileService.boardFileInfo(params);
//		
//		andView.addObject("pnum", pnum);
//		andView.addObject("part", part);
//		andView.addObject("boardInfo", boardInfo);
//		andView.addObject("boardInfoFile", boardInfoFile);
//		andView.setViewName("user/frmyprojectnotice/frMyProjectNtcView");
//		return andView;
//	}
//	
//	@RequestMapping("frprojectntcUpdateForm")
//	public ModelAndView noticeUpdateForm(ModelAndView andView, String pnum,String part,String prno_num,
//			Map<String, String> params) throws Exception{
//		params.put("prno_num", prno_num);
//		Project_noticeVO boardInfo = service.boardInfo(params);
//		Project_notice_fileVO boardInfoFile = fileService.boardFileInfo(params);
//		
//		andView.addObject("pnum", pnum);
//		andView.addObject("part", part);
//		andView.addObject("boardInfo", boardInfo);
//		andView.addObject("boardInfoFile", boardInfoFile);
//		andView.setViewName("user/frmyprojectnotice/frMyProjectNtcUpdateForm");
//		return andView;
//	}
//	
//	@RequestMapping("ntcFileDelete")
//	@ResponseBody
//	public ModelAndView ntcFileDelete(String prnofile_num,String prnofile_save_name, 
//			Map<String, String> params,
//			ModelAndView andView) throws Exception{
//		params.put("prnofile_num", prnofile_num);
//		
//		int cnt = this.fileService.deleteFile(params);
//		Map<String, String> jsonMap = new HashMap<String, String>();
//		if (cnt == 1) {
//			jsonMap.put("flag", "true");
//		}else{
//			jsonMap.put("flag", "false");
//		}
//		
//		andView.addObject("result", jsonMap);
//		andView.setViewName("jsonConvertView");
//		return andView;
//	}
	
	///////보유기술//////////////////////////////////////////////////////////////////////
	@RequestMapping("techBeforeForm")
	public String techBeforeForm() throws Exception{
		
		return "user/frmyprofile/frTechBeforeForm";
	}
	
	@RequestMapping("techForm")
	public ModelAndView techForm(ModelAndView andView, String mem_id) throws Exception{
		
		Map<String, String> param = new HashMap<String, String>();
		param.put("mem_id", mem_id);
		
		List<TechniqueVO> techList = this.frTechService.techList(param);
//		for (TechniqueVO tech : techList){
//			String technum = tech.getTech_type();
//			List<LanguageVO> lang = 
//		}
		
		andView.addObject("techList", techList);
		andView.setViewName("user/frmyprofile/frTechForm");
		
		return andView;
	}
	
	
	@RequestMapping("insertTech")
	@ResponseBody
	public ModelAndView insertTech(ModelAndView andView, String mem_id, String tech_type, String tech_fluent, String tech_period, String tech_num) throws Exception{
		
		Map<String, String> param = new HashMap<String, String>();
		param.put("mem_id", mem_id);
		this.frTechService.deleteTech(param);
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("mem_id", mem_id);
		params.put("tech_num", tech_num);

		
		if(this.frTechService.countTech(params)==1){
			TechniqueVO techVO = new TechniqueVO();
			techVO.setTech_num(tech_num);
			techVO.setTech_type(tech_type);
			techVO.setTech_fluent(tech_fluent);
			techVO.setTech_period(tech_period);
			techVO.setMem_id(mem_id);
			int cnt = this.frTechService.updateTech(techVO);
			Map<String, String> jsonMap = new HashMap<String, String>();
			if (cnt == 1) {
				jsonMap.put("flag", "true");
			}else{
				jsonMap.put("flag", "false");
			}
			
			andView.addObject("result", jsonMap);
			andView.setViewName("jsonConvertView");
			return andView;
//			andView.addObject("mem_id", mem_id);
//			andView.addObject("tech_type", tech_type);
//			andView.addObject("tech_fluent", tech_fluent);
//			andView.addObject("tech_period", tech_period);
//			andView.addObject("tech_num", tech_num);
//			andView.setViewName("redirect:/freProfile/updateTech.do");
		}else{
			TechniqueVO techVO = new TechniqueVO();
			techVO.setMem_id(mem_id);
			techVO.setTech_type(tech_type);
			techVO.setTech_fluent(tech_fluent);
			techVO.setTech_period(tech_period);
			int cnt = this.frTechService.insertTech(techVO);
			Map<String, String> jsonMap = new HashMap<String, String>();
			if (cnt == 1) {
				jsonMap.put("flag", "true");
			}else{
				jsonMap.put("flag", "false");
			}
			
			andView.addObject("result", jsonMap);
			andView.setViewName("jsonConvertView");
			return andView;
		}
	}
	
	@RequestMapping("updateTech")
	@ResponseBody
	public ModelAndView updateTech(ModelAndView andView, String mem_id, String tech_type, String tech_fluent, String tech_period, String tech_num) throws Exception{
		
		TechniqueVO techVO = new TechniqueVO();
		techVO.setTech_num(tech_num);
		techVO.setTech_type(tech_type);
		techVO.setTech_fluent(tech_fluent);
		techVO.setTech_period(tech_period);
		techVO.setMem_id(mem_id);
		int cnt = this.frTechService.updateTech(techVO);
		Map<String, String> jsonMap = new HashMap<String, String>();
		if (cnt == 1) {
			jsonMap.put("flag", "true");
		}else{
			jsonMap.put("flag", "false");
		}
		
		andView.addObject("result", jsonMap);
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	@RequestMapping("waitDeleteTech")
	public ModelAndView waitDeleteTech(ModelAndView andView, String tech_num, String mem_id) throws Exception{
		
		Map<String, String> param = new HashMap<String, String>();
		param.put("mem_id", mem_id);
		param.put("tech_num", tech_num);
		
		int cnt = this.frTechService.waitDeleteTech(param);
		Map<String, String> jsonMap = new HashMap<String, String>();
		if (cnt == 1) {
			jsonMap.put("flag", "true");
		}else{
			jsonMap.put("flag", "false");
		}
		
		andView.addObject("result", jsonMap);
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	@RequestMapping("deleteTech")
	public ModelAndView deleteTech(ModelAndView andView, String tech_num, String mem_id) throws Exception{
		
		Map<String, String> param = new HashMap<String, String>();
		param.put("mem_id", mem_id);
		param.put("tech_num", tech_num);
		
		int cnt = this.frTechService.deleteTech(param);
		Map<String, String> jsonMap = new HashMap<String, String>();
		if (cnt >= 1) {
			jsonMap.put("flag", "true");
		}else{
			jsonMap.put("flag", "false");
		}
		
		andView.addObject("result", jsonMap);
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	@RequestMapping("calcenDeleteTech")
	public ModelAndView calcenDeleteTech(ModelAndView andView, String mem_id) throws Exception{
		
		Map<String, String> param = new HashMap<String, String>();
		param.put("mem_id", mem_id);
		this.frTechService.calcenDeleteTech(param);
		andView.addObject("mem_id", mem_id);
		andView.setViewName("redirect:/freProfile/techView.do");
		
		return andView;
	}
	
	@RequestMapping("techView")
	public ModelAndView techView(ModelAndView andView, String mem_id) throws Exception{
		
		Map<String, String> param = new HashMap<String, String>();
		param.put("mem_id", mem_id);
		
		List<TechniqueVO> list = this.frTechService.techCheck(param);
		System.out.println(list);
		if(list.size() == 0){
			andView.setViewName("user/frmyprofile/frTechBeforeForm");
			return andView;
			
		}else{

		List<TechniqueVO> techList = this.frTechService.techList(param);
		
		andView.addObject("techList", techList);
		andView.setViewName("user/frmyprofile/frTechView");
		
		return andView;
		}
	}
	
	@RequestMapping("updateTotalRepre")
	public ModelAndView updateTotalRepre(ModelAndView andView, String mem_id) throws Exception{
		
		Map<String, String> param = new HashMap<String, String>();
		param.put("mem_id", mem_id);
		
		int cnt = this.frTechService.updateTotalRepre(param);
		
		Map<String, String> jsonMap = new HashMap<String, String>();
		if (cnt != 0) {
			jsonMap.put("flag", "true");
		}else{
			jsonMap.put("flag", "false");
		}
		
		andView.addObject("result", jsonMap);
		andView.setViewName("jsonConvertView");
		return andView;
		
	}
	
	@RequestMapping("updateRepre")
	public ModelAndView updateRepre(ModelAndView andView, String mem_id, String tech_num) throws Exception{
		
		Map<String, String> param = new HashMap<String, String>();
		param.put("mem_id", mem_id);
		param.put("tech_num", tech_num);
		int cnt = this.frTechService.updateRepre(param);
		Map<String, String> jsonMap = new HashMap<String, String>();
		if (cnt == 1) {
			jsonMap.put("flag", "true");
		}else{
			jsonMap.put("flag", "false");
		}
		
		andView.addObject("result", jsonMap);
		andView.setViewName("jsonConvertView");
		return andView;
		
	}
	
	
	/////////////////////////////////////////////////////////////////////////////
	@RequestMapping("specForm")
	public ModelAndView specForm(ModelAndView andView, String mem_id) throws Exception{

		Map<String, String> param = new HashMap<String, String>();
		param.put("mem_id", mem_id);
		
		
		List<CareerVO> careerList = this.careerService.careerList(param);
		List<AcademicVO> academicList = this.academicService.academicList(param);
		List<LicenseVO> licenseList = this.licenseService.licenseList(param);
		andView.addObject("careerList", careerList);
		andView.addObject("academicList", academicList);
		andView.addObject("licenseList", licenseList);
		andView.setViewName("user/frmyprofile/frSpecForm");
		
		return andView;

	}
	
	
	@RequestMapping("insertCareer")
	public ModelAndView insertCareer(ModelAndView andView, String mem_id, String ca_company, String ca_department, String ca_position, String ca_in, String ca_out) throws Exception{
		
		CareerVO careerVO = new CareerVO();
		careerVO.setMem_id(mem_id);
		careerVO.setCa_company(ca_company);
		careerVO.setCa_department(ca_department);
		careerVO.setCa_position(ca_position);
		careerVO.setCa_in(ca_in);
		careerVO.setCa_out(ca_out);
		
		int cnt = this.careerService.insertCareer(careerVO);
		
		Map<String, String> jsonMap = new HashMap<String, String>();
		if (cnt == 1) {
			jsonMap.put("flag", "true");
		}else{
			jsonMap.put("flag", "false");
		}
		
		andView.addObject("result", jsonMap);
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	@RequestMapping("deleteCareer")
	public ModelAndView deleteCareer(ModelAndView andView, String ca_num, String mem_id) throws Exception{
		
		Map<String, String> param = new HashMap<String, String>();
		param.put("mem_id", mem_id);
		param.put("ca_num", ca_num);
		
		this.careerService.deleteCareer(param);
		
		andView.addObject("mem_id", mem_id);
		andView.setViewName("redirect:/freProfile/specForm.do");
		return andView;
	}
	
	@RequestMapping("careerInfo")
	public ModelAndView careerInfo(ModelAndView andView, String mem_id, String ca_num) throws Exception{
		
		Map<String, String> param = new HashMap<String, String>();
		param.put("mem_id", mem_id);
		param.put("ca_num", ca_num);
		
		CareerVO careerVO = this.careerService.careerInfo(param);
		
		Map<String, String> jsonMap = new HashMap<String, String>();
		if (careerVO != null) {
			jsonMap.put("flag", "true");
		}else{
			jsonMap.put("flag", "false");
		}
		
		andView.addObject("result", jsonMap);
		andView.addObject("careerInfo", careerVO);
		andView.setViewName("jsonConvertView");
		return andView;
		
	}
	
	@RequestMapping("updateCareer")
	public ModelAndView updateCareer(ModelAndView andView, CareerVO careerVO) throws Exception{
		
		int cnt = this.careerService.updateCareer(careerVO);
		Map<String, String> jsonMap = new HashMap<String, String>();
		if (cnt == 1) {
			jsonMap.put("flag", "true");
		}else{
			jsonMap.put("flag", "false");
		}
		
		andView.addObject("result", jsonMap);
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	//////////////////////////////////////////////////////////////////////////////

	
	@RequestMapping("insertLicense")
	public ModelAndView insertLicense(ModelAndView andView, LicenseVO licenseVO) throws Exception{
		
		int cnt = this.licenseService.insertLicense(licenseVO); 
		
		Map<String, String> jsonMap = new HashMap<String, String>();
		if (cnt == 1) {
			jsonMap.put("flag", "true");
		}else{
			jsonMap.put("flag", "false");
		}
		
		andView.addObject("result", jsonMap);
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	@RequestMapping("deleteLicense")
	public ModelAndView deleteLicense(ModelAndView andView, String li_num, String mem_id) throws Exception{
		
		Map<String, String> param = new HashMap<String, String>();
		param.put("mem_id", mem_id);
		param.put("li_num", li_num);
		
		this.licenseService.deleteLicense(param);
		
		andView.addObject("mem_id", mem_id);
		andView.setViewName("redirect:/freProfile/specForm.do");
		return andView;
	}
	
	@RequestMapping("licenseInfo")
	public ModelAndView licenseInfo(ModelAndView andView, String mem_id, String li_num) throws Exception{
		
		Map<String, String> param = new HashMap<String, String>();
		param.put("mem_id", mem_id);
		param.put("li_num", li_num);
		
		LicenseVO licenseVO = this.licenseService.licenseInfo(param);
		
		Map<String, String> jsonMap = new HashMap<String, String>();
		if (licenseVO != null) {
			jsonMap.put("flag", "true");
		}else{
			jsonMap.put("flag", "false");
		}
		
		andView.addObject("result", jsonMap);
		andView.addObject("licenseInfo", licenseVO);
		andView.setViewName("jsonConvertView");
		return andView;
		
	}
	
	@RequestMapping("updateLicense")
	public ModelAndView updateLicense(ModelAndView andView, LicenseVO licenseVO) throws Exception{
		
		int cnt = this.licenseService.updateLicense(licenseVO);
		Map<String, String> jsonMap = new HashMap<String, String>();
		if (cnt == 1) {
			jsonMap.put("flag", "true");
		}else{
			jsonMap.put("flag", "false");
		}
		
		andView.addObject("result", jsonMap);
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	
	//////////////////////////////////////////////////////////////////////////////
	@RequestMapping("insertAcademic")
	public ModelAndView insertAcademic(ModelAndView andView, AcademicVO academicVO) throws Exception{
		
		int cnt = this.academicService.insertAcademic(academicVO);
		
		Map<String, String> jsonMap = new HashMap<String, String>();
		if (cnt == 1) {
			jsonMap.put("flag", "true");
		}else{
			jsonMap.put("flag", "false");
		}
		
		andView.addObject("result", jsonMap);
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	@RequestMapping("deleteAcademic")
	public ModelAndView deleteAcademic(ModelAndView andView, String ac_num, String mem_id) throws Exception{
		
		Map<String, String> param = new HashMap<String, String>();
		param.put("mem_id", mem_id);
		param.put("ac_num", ac_num);
		
		this.academicService.deleteAcademic(param);
		
		andView.addObject("mem_id", mem_id);
		andView.setViewName("redirect:/freProfile/specForm.do");
		return andView;
	}
	
	@RequestMapping("academicInfo")
	public ModelAndView academicInfo(ModelAndView andView, String mem_id, String ac_num) throws Exception{
		
		Map<String, String> param = new HashMap<String, String>();
		param.put("mem_id", mem_id);
		param.put("ac_num", ac_num);
		
		AcademicVO academicVO = this.academicService.academicInfo(param);
		
		Map<String, String> jsonMap = new HashMap<String, String>();
		if (academicVO != null) {
			jsonMap.put("flag", "true");
		}else{
			jsonMap.put("flag", "false");
		}
		
		andView.addObject("result", jsonMap);
		andView.addObject("academicInfo", academicVO);
		andView.setViewName("jsonConvertView");
		return andView;
		
	}
	
	@RequestMapping("updateAcademic")
	public ModelAndView updateAcademic(ModelAndView andView, String mem_id, String ac_num, String ac_type, String ac_final, String ac_school, String ac_major, String ac_in, String ac_out) throws Exception{
		
		AcademicVO academicVO = new AcademicVO();
		academicVO.setMem_id(mem_id);
		academicVO.setac_final(ac_final);
		academicVO.setac_in(ac_in);
		academicVO.setac_major(ac_major);
		academicVO.setac_out(ac_out);
		academicVO.setac_school(ac_school);
		academicVO.setac_type(ac_type);
		academicVO.setac_num(ac_num);
		
		int cnt = this.academicService.updateAcademic(academicVO);
		Map<String, String> jsonMap = new HashMap<String, String>();
		if (cnt == 1) {
			jsonMap.put("flag", "true");
		}else{
			jsonMap.put("flag", "false");
		}
		
		andView.addObject("result", jsonMap);
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
//	@RequestMapping("evalAvg")
//	public ModelAndView evalAvg(ModelAndView andView, ){
		
//	}
	
	
	@RequestMapping("calendar")
	public ModelAndView calendar(ModelAndView andView, String mem_id) throws Exception{
		
		andView.setViewName("user/calendar/frCalendar");
		return andView;
	}
	@RequestMapping("signTool")
	public ModelAndView signTool(ModelAndView andView, String mem_id) throws Exception{
		andView.setViewName("window/frmyprofile/signTool");
		return andView;
	}
	
	
	
}
