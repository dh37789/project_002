package kr.or.ddit.constract.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.or.ddit.alarm.service.AlarmService;
import kr.or.ddit.constract.service.ContractService;
import kr.or.ddit.constract.service.SignService;
import kr.or.ddit.project.service.ProjectService;
import kr.or.ddit.utils.CLOBtoString;
import kr.or.ddit.utils.ImageCompose;
import kr.or.ddit.utils.MoneyComma;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.SignVO;
import oracle.sql.CLOB;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/contract/")
public class ContractController {
	@Autowired
	private ContractService service;
	
	@Autowired
	private SignService signService;
	
	@Autowired
	private AlarmService alarmService;
	
	@Autowired
	private ProjectService projectService;
	
	@RequestMapping("contractList")
	public ModelAndView contractList(ModelAndView andView,HttpSession session,Map<String,String> params) throws Exception{
		MemberVO member = (MemberVO) session.getAttribute("USER_LOGININFO");
		params.put("mem_id", member.getMem_id());
		List<Map<String, Object>> contractList =  service.contractList(params);
		
		for (Map<String, Object> prInfo : contractList) {
			String money = MoneyComma.toNumFormat(Integer.parseInt(String.valueOf(prInfo.get("CONS_PAYMENT"))));
			prInfo.put("CONS_PAYMENT", money);
		}
		
		if(contractList.size()==0){
		andView.addObject("noProject","계약중인 프로젝트가 없습니다.");
		}else{
			for(int i=0;i<contractList.size();i++){
				CLOB clob = (CLOB) contractList.get(i).get("CONS_CONTENT");
				if(clob!=null){
				String result = CLOBtoString.clobToString(clob);
				contractList.get(i).put("CONS_CONTENT", result);
				}
				
//				String payment = (String) contractList.get(i).get("CONS_PAYMENT");
//				contractList.get(i).put("CONS_PAYMENT",MoneyComma.toNumFormat(Integer.parseInt(payment)));
				
			}
			
			andView.addObject("contractList",contractList);
		}
		
		andView.setViewName("user/frcontract/contractList");
		
		return andView;
	}
	@RequestMapping("freeOk")
	public String freeOk(ModelAndView andView,String cons_num,Map<String,String> params, String mem_id) throws Exception{
		params.put("cons_num", cons_num);
		params.put("mem_id", mem_id);
		HashMap<String, String> consList = service.consFile(params);
		SignVO signInfo = signService.signInfo(params);
		ImageCompose.contractSign(consList.get("CONSFILE_SAVE_NAME"), signInfo.getSign_save_name(), "f");
		service.freeOk(params);
		
		String pr_num = service.selectPr_num(cons_num);
		params.put("pr_num", pr_num);
		ProjectVO project =projectService.projectInfo(params);
		params.put("client", project.getClient());
		params.put("content", "프리랜서가 "+project.getPr_title()+"에 계약 확인했습니다.");
		alarmService.insertAlarmMessage(params);
		
		return "forward:/contract/contractList.do";
	}
	
	@RequestMapping("freeNo")
	public String freeNo(ModelAndView andView,String cons_num,String cons_content,Map<String, String> params) throws Exception{
		params.put("cons_num", cons_num);
		params.put("cons_content", cons_content);
		service.freeNo(params);
		
		String pr_num = service.selectPr_num(cons_num);
		params.put("pr_num", pr_num);
		ProjectVO project =projectService.projectInfo(params);
		params.put("client", project.getClient());
		params.put("content", "프리랜서가 "+project.getPr_title()+"에 계약 수정 요청했습니다.");
		alarmService.insertAlarmMessage(params);
		
		
		return "forward:/contract/contractList.do";
	}
	
	@RequestMapping("contractFile")
	@ResponseBody
	public ModelAndView contractFile(ModelAndView andView, Map<String, String> params,
			String cons_num) throws Exception{
		params.put("cons_num", cons_num);
		HashMap<String, String> consList = service.consFile(params);
		andView.addObject("consList", consList);
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	@RequestMapping("updateEndCheck")
	@ResponseBody
	public ModelAndView updateEndCheck(String pr_num, ModelAndView andView, String cons_free_id) throws Exception{
		Map<String, String> params = new HashMap<String, String>();
		params.put("cons_proj_num", pr_num);
		params.put("cons_free_id", cons_free_id);
		
		Map<String, String> jsonMap = new HashMap<String, String>();
		int cnt = this.service.updateEndCheck(params);
		
		if (cnt == 1) {
			jsonMap.put("flag", "true");
		}else{
			jsonMap.put("flag", "false");
		}
		
		andView.addObject("result", jsonMap);
		andView.setViewName("jsonConvertView");
		return andView;
		
	}
	
	@RequestMapping("countEndCheck")
	public ModelAndView countEndCheck(ModelAndView andView,String pr_num, Map<String, String> params, String mem_id) throws Exception{
		params.put("cons_proj_num", pr_num);
		
		int consFree = this.service.countConsFree(params);
		int consEndChk = this.service.countConsEndChk(params);
		
		if(consFree == consEndChk){
			andView.addObject("pr_num", pr_num);
			andView.addObject("mem_id", mem_id);
			andView.setViewName("redirect:/frmyproject/updatePrStatus.do");
			
			return andView;
		}else{
			
			andView.addObject("pnum", pr_num);
			andView.addObject("mem_id", mem_id);
			andView.setViewName("redirect:/frmyproject/projectView.do");
			
			return andView;
		}
	}
	
}
