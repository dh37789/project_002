package kr.or.ddit.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.utils.AttacheMemberFileMapper;
import kr.or.ddit.vo.FileItemVO;
import kr.or.ddit.vo.MemberVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/member/")
public class MemberController {

	@Autowired
	private IMemberService memberService;

	@Autowired
	private AttacheMemberFileMapper mapper;
	
	@RequestMapping("selectCF")
	public String selectCF(){
		return "user/member/selectCF";
	}
	
	@RequestMapping("clMemberForm")
	public String clMemberForm(){
		return "user/member/clMemberForm";
	}
	
	@RequestMapping("frMemberForm")
	public String frMemberForm(){
		return "user/member/frMemberForm";
	}
	
	@RequestMapping("insertMember")
	public String insertMamber(MemberVO memberInfo) throws Exception{
		this.memberService.insertMember(memberInfo);
		return "redirect:/main/hello.do";
	}
	
	@RequestMapping("idCheck")
	public ModelAndView idCheck(String mem_id, Map<String, String> params, 
			ModelAndView andView) throws Exception{
		params.put("mem_id", mem_id);
		MemberVO memberInfo = this.memberService.memberInfo(params);
		Map<String, String> jsonMap = new HashMap<String, String>();
		
		if(memberInfo==null){
			jsonMap.put("flag", "true");
		}else{
			jsonMap.put("flag", "false");
		}
		
		andView.addObject("result", jsonMap);
		andView.setViewName("jsonConvertView");
		
		return andView;
	}
	
	@RequestMapping("insertMemPic")
	public ModelAndView insertMemPic(String mem_id, ModelAndView andView, 
			Map<String, String> params, HttpSession session) throws Exception{
		
		MemberVO membervo = new MemberVO();
		String fileSaveName = mapper.mapping(membervo.getMemberFile(), mem_id);
		params.put("mem_picture", fileSaveName);
		params.put("mem_id", mem_id);
		
		this.memberService.insertMemPic(params);
		MemberVO memberInfo = this.memberService.memberInfo(params);
		session.setAttribute("USER_LOGININFO", memberInfo);
		andView.addObject("mem_id", mem_id);
		andView.setViewName("redirect:/freProfile/infoView.do");
		return andView;
	}
		
}
