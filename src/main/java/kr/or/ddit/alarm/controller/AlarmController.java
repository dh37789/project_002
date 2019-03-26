package kr.or.ddit.alarm.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.or.ddit.alarm.service.AlarmService;
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.Alarm_messageVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.MessageVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/alarm/")
public class AlarmController {
	@Autowired
	private AlarmService service;
	
	@RequestMapping("/updateAlarm")
	public String updateAlarm( Map<String,String> params,String str,HttpSession session) throws Exception{
		MemberVO member = (MemberVO) session.getAttribute("USER_LOGININFO");
		params.put("mem_id", member.getMem_id());
		String[] arr = str.split(",");
		
		params.put("ph_project", arr[3]);
		params.put("ph_apply", arr[4]);
		params.put("ph_con", arr[5]);
		params.put("ma_project", arr[0]);
		params.put("ma_apply", arr[1]);
		params.put("ma_con", arr[2]);
		service.updateAlarm(params);
		return "forward:/freProfile/infoView.do?mem_id="+member.getMem_id();
	}
	
	@RequestMapping("/selectAlarm")
	public ModelAndView selectAlarm(ModelAndView andView, String mem_id,Map<String,String> params) throws Exception{
		params.put("mem_id", mem_id);
		List<Alarm_messageVO> msgList = service.selectAlarmMessage(params);
		for(Alarm_messageVO msg : msgList){
			params.put("armsg_num", msg.getArmsg_num());
			service.hitArmsg(params);
		}
		andView.addObject("msgList",msgList);
		
		andView.setViewName("jsonConvertView");
		
		return andView;
	}
	
	@RequestMapping("/checkArmsg")
	public ModelAndView checkArmsg(ModelAndView andView, String armsg_num) throws Exception{
		
		service.checkArmsg(armsg_num);
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	@RequestMapping("/countAlarm")
	public ModelAndView countAlarm(ModelAndView andView, String mem_id) throws Exception{
		
		int count = service.countAlarm(mem_id);
		andView.addObject("count",count);
		andView.setViewName("jsonConvertView");
		return andView;
	}
}
