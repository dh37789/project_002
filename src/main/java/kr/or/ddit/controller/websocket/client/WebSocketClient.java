package kr.or.ddit.controller.websocket.client;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.or.ddit.chat.service.ChatService;
import kr.or.ddit.frProjectMeeting.service.MeetingService;
import kr.or.ddit.project.service.ApplyService;
import kr.or.ddit.project.service.ProjectService;
import kr.or.ddit.vo.ApmeetingVO;
import kr.or.ddit.vo.ChatVO;
import kr.or.ddit.vo.MeetingVO;
import kr.or.ddit.vo.ProjectVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/client/wsclient/")
public class WebSocketClient {
	@Autowired
	ProjectService projectService;
	@Autowired
	private MeetingService mtService;
	@Autowired
	private ApplyService apService;
	@Autowired
	private ChatService chatService; 
	
	
	@RequestMapping("/chatting")
	public ModelAndView wsClientUIChatting(ModelAndView andView, String pr_num,Map<String,String> params,HttpSession session) throws Exception{
		params.put("pr_num", pr_num);
		ProjectVO project= projectService.projectInfo(params);
		session.setAttribute("CHAT_PROJECT",project);
		List<ChatVO> chatList = chatService.selectChat(params);
		andView.addObject("chatList",chatList);
		andView.addObject("pr_num",pr_num);
		andView.addObject("project",project);
		andView.setViewName("user/notiles/chatting/wsclientChatting");
		return andView ;
	}
	
	@RequestMapping("/webCamIEetc")
	public String wsClientUIWebCamIEetc(String mt_num, Map<String, String> params
			, HttpSession session) throws Exception{
		params.put("mt_num", mt_num);
		MeetingVO mtInfo = mtService.boardInfo(params);
		session.setAttribute("MEET_INFO", mtInfo);
		return "user/webCam/webCamIEetc";

	}
	@RequestMapping("/apCamIEetc")
	public ModelAndView apClientCamIEetc(ModelAndView andView, String apmt_num, Map<String, String> params
			, HttpSession session, String pr_num) throws Exception{
		params.put("ap_num", apmt_num);
		ApmeetingVO mtInfo = apService.mtInfo(params);
		session.setAttribute("APMEET_INFO", mtInfo);
		andView.addObject("pr_num", pr_num);
		andView.setViewName("user/webCam/apCamIEetc");
		return andView;
	}
	
}
