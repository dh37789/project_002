package kr.or.ddit.chat.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.chat.service.ChatService;
import kr.or.ddit.project.service.ProjectService;
import kr.or.ddit.utils.CLOBtoString;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ProjectVO;
import oracle.sql.CLOB;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/chat/")
public class ChatController {
	@Autowired
	private ChatService chatService;
	@Autowired
	private ProjectService projectService;
	
	@RequestMapping("insertChat")
	public ModelAndView insertChat(ModelAndView andView,Map<String, String> params,String mem_id,String msg,HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		ProjectVO project = (ProjectVO) session.getAttribute("CHAT_PROJECT");
		params.put("pr_num", project.getPr_num());
		params.put("mem_id", mem_id);
		params.put("ip", request.getRemoteAddr());
		params.put("content", msg);
		
		
		chatService.insertChat(params);
		andView.setViewName("jsonConvertView");
		return andView;
	}
	@ResponseBody
	@RequestMapping("accessingMember")
	public ModelAndView accessingMember(ModelAndView andView,HttpSession session,Map<String,String> params) throws Exception{
		Map<String,List<Object>> totalList = new HashMap<String,List<Object>>();
		MemberVO member = (MemberVO) session.getAttribute("USER_LOGININFO");
		params.put("mem_id",member.getMem_id());
		List<Map<String, Object>> projectList =projectService.chatFreeProjectList(params);
		for(Map<String,Object> project : projectList){
			String pr_num = String.valueOf(project.get("CONS_PROJ_NUM"));
			params.put("pr_num",pr_num);
			List<Map<String,Object>> memberList = projectService.chatMemberList(params);
			if(totalList.containsKey(pr_num)){
				for(Map<String, Object> mem : memberList){
					totalList.get(pr_num).add(mem);
				}
			}else{
				totalList.put(pr_num, new ArrayList<Object>());
				for(Map<String, Object> mem : memberList){
					totalList.get(pr_num).add(mem);
				}
			}
		}
		andView.addObject("projectListt",projectList);
		andView.addObject("totalListt",totalList);
		andView.setViewName("jsonConvertView");
		return andView;
		
	}
	
	@RequestMapping("chattingBot")
	public ModelAndView chattingBot(ModelAndView andView){
		
		andView.setViewName("user/chatting/chattingBot");
		return andView;
	}
	
	@RequestMapping("selectChattingBot")
	public ModelAndView selectChattingBot(ModelAndView andView,String msg){
		String answer = "";
		if(msg.contains("검수")){
			if(msg.contains("걸")){
				answer="프로젝트 검수에 대해 소요되는 시간은 최대 24시간입니다.";
			}else if(msg.contains("과정")){
				answer="클라이언트님께서 등록해주신 자료를 토대로 저희 파피용에서 프로젝트를 검수해드리겠습니다.";
			}else{
				answer="검수에 대한 비용은 100% 무료입니다.";
			}
		}else if(msg.contains("지원")){
			if(msg.contains("결과")){
				answer="지원 결과는 나의 프로젝트 메뉴단에서 확인하실 수 있고 결과가 나오면 알림이 전송됩니다.";
			}else{
				answer="지원 취소를 원하신다면 저희 파피용에 연락해주세요. ";
			}
		}else if(msg.contains("안녕")){
			answer="안녕하세요 제 이름은 파피봇입니다. ";
		}else{
			answer="등록되지 않은 질문입니다. 보다 나은 서비스를 위해 노력하겠습니다.";
		}
		
		andView.addObject("answer",answer);
		andView.setViewName("jsonConvertView");
		return andView;
	}

}
