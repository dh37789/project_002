package kr.or.ddit.project.controller;

import java.io.PrintWriter;
import java.sql.Clob;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.alarm.service.AlarmService;
import kr.or.ddit.constract.service.ContractService;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.project.service.ApplyService;
import kr.or.ddit.project.service.ProjectService;
import kr.or.ddit.project.service.ProjectTechService;
import kr.or.ddit.utils.CLOBtoString;
import kr.or.ddit.utils.MoneyComma;
import kr.or.ddit.vo.ApmeetingVO;
import kr.or.ddit.vo.ApplyVO;
import kr.or.ddit.vo.ConstractVO;
import kr.or.ddit.vo.LanguageVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ProjectVO;
import oracle.sql.CLOB;

import org.apache.http.HttpResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sun.rmi.rmid.ExecPermission;

@Controller
@RequestMapping("/apply/")
public class ApplyController {
	@Autowired
	private ApplyService applyService;
	
	@Autowired
	private ProjectService projectService;
	
	@Autowired
	private ProjectTechService techservice;
	
	@Autowired
	private IMemberService memberService;
	
	@Autowired
	private ContractService conService;
	
	@Autowired
	private AlarmService alarmService;
	
	@RequestMapping("applyView")
	public ModelAndView applyView(ModelAndView andView,HttpSession session,String pr_num,Map<String,String> params) throws Exception{
		params.put("pr_num", pr_num);
		ProjectVO project = projectService.projectView(params);
		
		List<LanguageVO> lang= techservice.techList(pr_num);
		project.setTechList(lang);
		
		String money = MoneyComma.toNumFormat(Integer.parseInt(project.getPr_payment()));
		project.setPr_payment(money);
				
		MemberVO member = (MemberVO) session.getAttribute("USER_LOGININFO");
		
		andView.addObject("project",project);
		andView.addObject("member",member);
		andView.setViewName("user/common/applyView");
		return andView;
	}
	
	@RequestMapping("apply")
	public ModelAndView apply(ModelAndView andView, HttpSession session,Map<String,String> params,ApplyVO apply) throws Exception{
		MemberVO member = (MemberVO) session.getAttribute("USER_LOGININFO");
		params.put("mem_id", member.getMem_id());
		params.put("pr_num", apply.getAp_project());
		params.put("payment", apply.getAp_payment());
		params.put("content", apply.getAp_content());
		
		int ap_num = applyService.apply(params);
		
		return andView;
	}
	
	@RequestMapping("insertApply")
	public String insertApply( ApplyVO apply,HttpSession session,Map<String,String> params ) throws Exception{
		MemberVO member = (MemberVO) session.getAttribute("USER_LOGININFO");
		
		params.put("mem_id", member.getMem_id());
		params.put("payment", apply.getAp_payment());
		params.put("content", apply.getAp_content());
		params.put("pr_num", apply.getAp_project());
		
		applyService.apply(params);
		
		ProjectVO project = projectService.projectInfo(params);
		params.put("client", project.getClient());
		params.put("content", "프리랜서가 "+project.getPr_title()+"에 지원했습니다.");
		alarmService.insertAlarmMessage(params);
		
		return "forward:/project/projectList.do";
		
	}
	
	@RequestMapping("checkApply")
	public String checkApply(ServletResponse response,Map<String,String> params,HttpSession session,String pr_num) throws Exception{
		MemberVO member= (MemberVO) session.getAttribute("USER_LOGININFO");
		params.put("mem_id",member.getMem_id() );
		params.put("pr_num",pr_num );
		
		int result  = applyService.checkApply(params);
		
		Map<String, String> jsonMap = new HashMap<String, String>();
		if (result == 0) {
			jsonMap.put("flag", "true");

		} else {
			jsonMap.put("flag", "false");
		}

		ObjectMapper mapper = new ObjectMapper();
		String jsonData;
		jsonData = mapper.writeValueAsString(jsonMap);
		PrintWriter out =  response.getWriter();
		out.println(jsonData);
		return null;
	}
	
	@RequestMapping("applyList")
	public ModelAndView applyList(ModelAndView andView,Map<String,String> params,HttpSession session) throws Exception{
		
		MemberVO member = (MemberVO) session.getAttribute("USER_LOGININFO");
		params.put("mem_id", member.getMem_id());
		
		List<HashMap<String, Object>> applyList = applyService.selectList(params);
		
		for (HashMap<String, Object> prInfo : applyList) {
			String money = MoneyComma.toNumFormat(Integer.parseInt(String.valueOf(prInfo.get("AP_PAYMENT"))));
			prInfo.put("AP_PAYMENT", money);
			}
		
		if(applyList.size()==0){
			andView.addObject("noProject","지원한 프로젝트가 없습니다.");
		}else{
			andView.addObject("applyList",applyList);
			for(int i=0; i< applyList.size();i++){
			CLOB clob = (CLOB) applyList.get(i).get("AP_CONTENT");
			String result =CLOBtoString.clobToString(clob);
			applyList.get(i).put("AP_CONTENT", result);
			params.put("mem_id", (String) applyList.get(i).get("CLIENT"));
			MemberVO client =memberService.memberInfo(params);
			
			applyList.get(i).put("client", client);
			}
			
		}
		andView.setViewName("user/frApply/applyList");
		return andView;
	}
	@RequestMapping("meetChk")
	@ResponseBody	
	public ModelAndView meetChk(ModelAndView andView, String ap_num, String pr_num,
			Map<String, String> params) throws Exception{
		params.put("ap_num", ap_num);
		ApmeetingVO mtInfo = applyService.mtInfo(params);
		
		andView.addObject("mtInfo", mtInfo);
		andView.addObject("pr_num", pr_num);
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	@RequestMapping("frMeetOk")
	public String frMeetOk(String pr_num, String apmt_num, Map<String, String> params, 
			HttpSession session) throws Exception{
		params.put("pr_num", pr_num);
		params.put("apmt_num", apmt_num);
		MemberVO memberInfo = (MemberVO) session.getAttribute("USER_LOGININFO");
		applyService.frUpdateStatus(params);
		applyService.updateMtStatus(params);
		return "forward:/apply/applyList.do";
	}
	
	@RequestMapping("frMeetCancel")
	public String frMeetCancel(String pr_num, String apmt_num, Map<String, String> params, 
			HttpSession session) throws Exception{
		params.put("pr_num", pr_num);
		params.put("apmt_num", apmt_num);
		applyService.frCancelStatus(params);
		return "forward:/apply/applyList.do";
	}
	

}
