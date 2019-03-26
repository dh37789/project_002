package kr.or.ddit.clMyProject.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.or.ddit.frMyProject.service.ProjectService;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ProjectVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/clMyProject/")
public class ClMyProjectController {

	@Autowired
	private ProjectService service;
	
	@RequestMapping("projectList")
	public ModelAndView projectList(ModelAndView andView, Map<String, String> params,
			HttpSession session) throws Exception{
		MemberVO memberInfo = (MemberVO) session.getAttribute("USER_LOGININFO");
		params.put("client", memberInfo.getMem_id());
		List<ProjectVO> projectList = service.clMyproject(params);
		
		andView.addObject("projectList", projectList);
		andView.setViewName("user/clMyProject/clMyProjectList");
		return andView;
	}
}
