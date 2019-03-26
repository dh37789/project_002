//package kr.or.ddit.adminMain.controller;
//
//import java.util.List;
//import java.util.Map;
//
//import kr.or.ddit.project.service.ProjectService;
//import kr.or.ddit.project.service.ProjectTechService;
//import kr.or.ddit.vo.ProjectVO;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.servlet.ModelAndView;
//
//@Controller
//@RequestMapping("/main/")
//public class AdminMainController {
//	@Autowired
//	private ProjectService projectService;
//	@Autowired
//	private ProjectTechService techservice;
//	
//	
//	@RequestMapping("admin")
//	public ModelAndView stProjectList(ModelAndView andView, Map<String, String> params) throws Exception{
//		List<ProjectVO> stbyProList = projectService.stbyProList();
//		List<ProjectVO> projectingList = projectService.projectingList();
//		
//		andView.addObject("stbyProList",stbyProList);
//		andView.addObject("projectingList", projectingList);
//		andView.setViewName("admin/main/index");
//		
//		return andView;
//	}
//}
