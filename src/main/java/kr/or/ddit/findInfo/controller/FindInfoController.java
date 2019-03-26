package kr.or.ddit.findInfo.controller;

import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.findInfo.service.FindInfoService;
import kr.or.ddit.vo.MemberVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/findInfo/")
public class FindInfoController {
	@Autowired
	private FindInfoService service;
	@Autowired
	JavaMailSender mailSender;
	
	@ResponseBody
	@RequestMapping("findId")
	public ModelAndView findId(Map<String, String> params, String mem_name,	String mem_mail, ModelAndView andView) throws Exception {
		
		params.put("mem_name", mem_name);
		params.put("mem_mail", mem_mail);
		
		MemberVO findId = service.findInfo(params);
		
		if(findId == null){
			andView.addObject("flag", false);
			
		}else{
			String MemberId = findId.getMem_id();
			andView.addObject("flag", true);
			andView.addObject("MemberId", MemberId);
			
		}
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	@ResponseBody
	@RequestMapping("findPass")
	public ModelAndView findPass(ModelAndView andView, Map<String, String> params, HttpServletResponse response, String mem_id, String mem_name, String mem_mail) throws Exception{
		params.put("mem_id", mem_id);
		params.put("mem_name", mem_name);
		params.put("mem_mail", mem_mail);

		MemberVO findPass = service.findInfo(params);
		if(findPass != null) {
			andView.addObject("flag", true);
			
			String tempPass = ""; 
			for(int i=0; i<8; i++) { 
				int rndVal = (int)(Math.random() * 62); 
				if(rndVal < 10) { tempPass += rndVal; 
				} else if(rndVal > 35) {
					tempPass += (char)(rndVal + 61); 
					} else { 
						tempPass += (char)(rndVal + 55); 
						} 
				}
		
			String setfrom = "govl327@naver.com";
			String tomail = findPass.getMem_mail();
			String title = "안녕하세요 Papillon 입니다. " + findPass.getMem_name() + "님의 임시 비밀번호 입니다.";
			String content = findPass.getMem_name() + "님의 임시 비밀번호는 " + tempPass + " 입니다.";
			
			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				
				messageHelper.setFrom(setfrom);
				messageHelper.setTo(tomail);
				messageHelper.setSubject(title);
				messageHelper.setText(content);
				
				mailSender.send(message);
				
				params.put("mem_pass", tempPass);
				service.randomPass(params);
				
			}catch(Exception e) {
				System.out.println(e);
			}
		} else {
			andView.addObject("flag", false);
		}
		
		andView.setViewName("jsonConvertView");
		
		return andView;
	}
	
	@RequestMapping("changePass")
	public ModelAndView changePass(ModelAndView andView, String mem_pass, String mem_id, Map<String, String> params) throws Exception {
		
		params.put("mem_pass", mem_pass);
		params.put("mem_id", mem_id);
		
		service.randomPass(params);
		
		andView.addObject("mem_id", mem_id);
		andView.setViewName("forward:/freProfile/infoView.do");
		
		return andView;
	}
}
