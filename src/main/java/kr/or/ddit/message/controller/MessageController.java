package kr.or.ddit.message.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.message.service.MessageService;
import kr.or.ddit.utils.RolePagingUtil;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.MessageVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/message/")
public class MessageController {
	@Autowired
	private MessageService service;
	

	@RequestMapping("messageList")
	public ModelAndView messageList(ModelAndView andView,String mem_id,HttpServletRequest request, Map<String,String> params) throws Exception {
		params.put("mem_id", mem_id);
		
		
		List<MessageVO> messageFROM = service.messageFROM(params);
		List<MessageVO> messageTO = service.messageTO(params);

		andView.addObject("messageFROM",messageFROM);
		andView.addObject("messageTO",messageTO);
		andView.setViewName("user/notiles/message/messageList");
		
		return andView;
	}

	@RequestMapping("deleteMessage")
	public String deleteMessage(String msg_nums,HttpSession session) throws Exception {
		String arrs[] = msg_nums.split(",");
		for(String arr:arrs){
			service.deleteMessage(arr);
		}
		MemberVO member = (MemberVO) session.getAttribute("USER_LOGININFO");
		return "forward:/message/messageList.do?mem_id="+member.getMem_id();
	}

	@RequestMapping("insertMessage")
	public String insertMessage(MessageVO message,Map<String,String> params, HttpSession session) throws Exception {
		params.put("from", message.getMsg_from());
		params.put("to", message.getMsg_to());
		params.put("title", message.getMsg_title());
		params.put("content", message.getMsg_content());
		
		String msg_num = service.insertMessage(params);
		
		MemberVO member = (MemberVO) session.getAttribute("USER_LOGININFO");
		return "forward:/message/messageList.do?mem_id="+member.getMem_id();
	}

	@RequestMapping("messageInfo")
	public ModelAndView messageInfo(ModelAndView andView,String msg_num,Map<String,String> params,String flag) throws Exception {
		params.put("msg_num",msg_num);
		MessageVO message =service.messageInfo(params);
		if(flag.intern()=="true"){
			service.hitMessage(msg_num);
		}
		andView.addObject("message",message);
		andView.addObject("flag",flag);
		andView.setViewName("user/notiles/message/messageInfo");
		return andView;
	}
	
	@RequestMapping("countMessage")
	public ModelAndView countMessage(ModelAndView andView, String mem_id,Map<String,String> params)throws Exception{
		params.put("mem_id",mem_id);
		int count = service.totalCountTO(params);
		
		andView.addObject("count",count);
		andView.setViewName("jsonConvertView");
		
		return andView;
		}

}
