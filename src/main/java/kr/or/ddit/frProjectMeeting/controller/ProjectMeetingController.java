package kr.or.ddit.frProjectMeeting.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.frMyProject.service.ContractService;
import kr.or.ddit.frProjectMeeting.service.MeetingService;
import kr.or.ddit.utils.RolePagingUtil;
import kr.or.ddit.vo.MeetingVO;
import kr.or.ddit.vo.WorkVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/projectMeeting/")
public class ProjectMeetingController {
	@Autowired
	private MeetingService service;
	@Autowired
	private ContractService conService;
	
	@RequestMapping("meetingList")
	public ModelAndView meetingList(ModelAndView andView, Map<String, String> params,
			HttpSession session, String currentPage, String search_data,
			String search_code, HttpServletRequest request) throws Exception{
		if (currentPage == null) {
			currentPage = "1";
		}
		
		params.put("search_data", search_data);
		params.put("search_code", search_code);
		
		String pr_num = (String) session.getAttribute("pnum");
		params.put("pr_num", pr_num);
		
		int totalCount = service.boardCount(params);
		
		RolePagingUtil paging = new RolePagingUtil(totalCount, Integer.parseInt(currentPage), request);
		
		String startCount = String.valueOf(paging.getStartCount());
		String endCount = String.valueOf(paging.getEndCount());
		
		params.put("startCount", startCount);
		params.put("endCount", endCount);
		
		List<MeetingVO> boardList = service.boardList(params);
		
		String htmlCode = paging.getPageHtmls();
		
		andView.addObject("htmlCode", htmlCode);
		andView.addObject("boardList", boardList);
		if (session.getAttribute("ADMIN_LOGININFO") != null) {
			andView.setViewName("adm/projectMeeting/projectMeetingList");
		}else{
			andView.setViewName("user/projectMeeting/projectMeetingList");
		}
		return andView;
	}
	
	@RequestMapping("meetingView")
	public ModelAndView meetingList(ModelAndView andView, Map<String, String> params,
			String mt_num, HttpSession session) throws Exception{
		params.put("mt_num", mt_num);
		
		MeetingVO boardInfo = service.boardInfo(params);
		
		andView.addObject("boardInfo", boardInfo);
		if (session.getAttribute("ADMIN_LOGININFO") != null) {
			andView.setViewName("adm/projectMeeting/projectMeetingView");
		}else{
			andView.setViewName("user/projectMeeting/projectMeetingView");
		}
		return andView;
	}
	
	@RequestMapping("meetingForm")
	public ModelAndView meetingForm(ModelAndView andView, Map<String, String> params, 
			HttpSession session, String cons_free_id) throws Exception{
		
		String pnum = (String) session.getAttribute("pnum");
		params.put("cons_proj_num", pnum);
		params.put("cons_free_id", cons_free_id);
		
		List<HashMap<String, Object>> memList = conService.meetList(params);
		
		andView.addObject("memList", memList);
		andView.setViewName("user/projectMeeting/projectMeetingForm");
		return andView;
	}
	
	@RequestMapping("meetingWrite")
	public String meetingWrite(MeetingVO meetingInfo) throws Exception{
		service.insertMeeting(meetingInfo);
		return "forward:/projectMeeting/meetingList.do";
	}
	@RequestMapping("meetingAccept")
	@ResponseBody
	public ModelAndView meetingAccept(String mt_to_accept,String mt_num, 
			Map<String, String> params, ModelAndView andView) throws Exception{
		int cnt = 0;
		if (mt_to_accept.equals("0")) {
			params.put("mt_num", mt_num);
			
			cnt = service.meetingAccept(params);
		}
		
		Map<String, String> jsonMap = new HashMap<String, String>();
		if (cnt == 1) {
			jsonMap.put("flag", "true");
		}else{
			jsonMap.put("flag", "false");
		}
		
		MeetingVO boardInfo = service.boardInfo(params);
		andView.addObject("boardInfo", boardInfo);
		andView.addObject("result", jsonMap);
		andView.setViewName("jsonConvertView");
		return andView;
	}
	@RequestMapping("meetingReject")
	@ResponseBody
	public ModelAndView meetingReject(String mt_to_accept,String mt_num, 
			Map<String, String> params, ModelAndView andView) throws Exception{
		int cnt = 0;
		params.put("mt_num", mt_num);
		
		mt_to_accept = service.acceptChk(params);
		
		if (mt_to_accept.equals("0")) {
			cnt = service.meetingReject(params);
		}
		
		Map<String, String> jsonMap = new HashMap<String, String>();
		if (cnt == 1) {
			jsonMap.put("flag", "true");
		}else{
			jsonMap.put("flag", "false");
		}
		
		MeetingVO boardInfo = service.boardInfo(params);
		andView.addObject("boardInfo", boardInfo);
		andView.addObject("result", jsonMap);
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	@RequestMapping("meetingDel")
	public String meetingDel(Map<String, String> params, String mt_num) throws Exception{
		params.put("mt_num", mt_num);
		service.deleteMeeting(params);
		return "forward:/projectMeeting/meetingList.do";
	}
}
