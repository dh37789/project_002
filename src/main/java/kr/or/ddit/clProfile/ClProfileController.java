package kr.or.ddit.clProfile;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.adManagement.service.MemberMgnService;
import kr.or.ddit.evalation.service.IEvalationService;
import kr.or.ddit.frMyProject.service.ProjectService;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.utils.MoneyComma;
import kr.or.ddit.vo.EvalArrayVO;
import kr.or.ddit.vo.MemberVO;

@Controller
@RequestMapping("/clProfile/")
public class ClProfileController {

	@Autowired
	private IMemberService memberService;

	@Autowired
	private MemberMgnService memberMgnSerivce;
	
	@Autowired
	private IEvalationService evalService;
	
	@Autowired
	private ProjectService projectService; 

	@RequestMapping("clMyProfileList")
	public ModelAndView clMyProfileList(ModelAndView andView, String mem_id) throws Exception{
		
		Map<String, String> param = new HashMap<String, String>();
		param.put("mem_id", mem_id);
		
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
			
			
			int countRegis = this.projectService.clCountRegisPr(param);
			int countContract = this.projectService.clCountContract(param);
			int countProjecting = this.projectService.clCountProjecting(param);
			int countEnd = this.projectService.clCountEndPr(param);
			int totalP = this.projectService.clTotalPay(param);
			
			String totalPay = MoneyComma.toNumFormat(totalP);
			
			andView.addObject("countRegis", countRegis);
			andView.addObject("countProjecting", countProjecting);
			andView.addObject("countEnd", countEnd);
			andView.addObject("countContract", countContract);
			andView.addObject("totalPay", totalPay);
			andView.addObject("memberInfo", memberInfo);
			andView.addObject("evalList", evalList);
			andView.setViewName("user/clmyprofile/clMyProfileList");
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
			
			int countRegis = this.projectService.clCountRegisPr(param);
			int countContract = this.projectService.clCountContract(param);
			int countProjecting = this.projectService.clCountProjecting(param);
			int countEnd = this.projectService.clCountEndPr(param);
			int totalMoney = this.projectService.clTotalPay(param);
			int countEval = this.evalService.countEval(paramEvto);
			
			String totalPay = MoneyComma.toNumFormat(totalMoney);

			andView.addObject("memberInfo", memberInfo);
			andView.addObject("evalList", evalList);
			andView.addObject("countEval", countEval);
			andView.addObject("totalAvg", totalAvg);
			andView.addObject("countRegis", countRegis);
			andView.addObject("countContract", countContract);
			andView.addObject("countProjecting", countProjecting);
			andView.addObject("countEnd", countEnd);
			andView.addObject("totalPay", totalPay);
			andView.setViewName("user/clmyprofile/clMyProfileList");

			return andView;
		}
	}
	
	@RequestMapping("infoView")
	public ModelAndView infoView(ModelAndView andView, String mem_id) throws Exception{
		
		Map<String, String> param = new HashMap<String, String>();
		param.put("mem_id", mem_id);
		MemberVO memberInfo = this.memberService.memberInfo(param);
		
		andView.addObject("memberInfo", memberInfo);
		andView.setViewName("user/clmyprofile/clInfoView");
		
		return andView;
	}
	
	@RequestMapping("infoEditForm")
	public ModelAndView infoEditForm(ModelAndView andView, String mem_id) throws Exception{
		
		Map<String, String> param = new HashMap<String, String>();
		param.put("mem_id", mem_id);
		MemberVO memberInfo = this.memberService.memberInfo(param);
		
		andView.addObject("memberInfo", memberInfo);
		andView.setViewName("user/clmyprofile/clInfoEditForm");
		
		return andView;
	}
	
	@RequestMapping("updateInfo")
	public ModelAndView updateclelancer(ModelAndView andview, MemberVO memberInfo, String mem_id, Map<String, String> params) throws Exception {
		
		this.memberMgnSerivce.updateMember(memberInfo);
		
		andview.addObject("mem_id", mem_id);
		andview.setViewName("redirect:/clProfile/infoView.do");
		
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
	
	@RequestMapping("selfInfoBeforeForm")
	public String selfInfoBeforeForm() throws Exception{
		
		return "user/clmyprofile/clSelfInfoBeforeForm";
	}
	
	@RequestMapping("selfInfoForm")
	public String selfInfoForm() throws Exception{
		
		return "user/clmyprofile/clSelfInfoForm";
	}
	
	@RequestMapping("updateSelfInfo")
	public ModelAndView updateSelfInfo(ModelAndView andView, MemberVO membervo, String mem_id) throws Exception{
		
		this.memberService.updateSelfInfo(membervo);
		Map<String, String> param = new HashMap<String, String>();
		param.put("mem_id", mem_id);
		if(this.memberService.selfInfoCheck(param)==null){
			andView.addObject("mem_id", mem_id);
			andView.setViewName("redirect:/clProfile/selfInfoBeforeForm.do");
			
			return andView;
		}
		andView.addObject("mem_id", mem_id);
		andView.setViewName("redirect:/clProfile/selfInfoBeforeView.do");
		
		return andView;
	}
	
	@RequestMapping("selfInfoBeforeView")
	public ModelAndView selfInfoBeforeView(ModelAndView andView, String mem_id) throws Exception{
		
		Map<String, String> param = new HashMap<String, String>();
		param.put("mem_id", mem_id);
		
		MemberVO memberInfo = this.memberService.memberInfo(param);
		andView.addObject("memberInfo", memberInfo);
		andView.setViewName("user/clmyprofile/clSelfInfoBeforeView");
		
		return andView;
	}
	
	@RequestMapping("selfInfoView")
	public ModelAndView selfInfoView(ModelAndView andView, String mem_id) throws Exception{
		
		Map<String, String> param = new HashMap<String, String>();
		param.put("mem_id", mem_id);
		
		MemberVO memberInfo = this.memberService.memberInfo(param);
		andView.addObject("memberInfo", memberInfo);
		andView.setViewName("user/clmyprofile/clSelfInfoView");

		return andView;
	}
}
