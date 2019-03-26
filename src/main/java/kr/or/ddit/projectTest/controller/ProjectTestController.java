package kr.or.ddit.projectTest.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.or.ddit.projectTest.service.TestService;
import kr.or.ddit.vo.TestVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/projectTest/")
public class ProjectTestController {
	@Autowired
	private TestService service; 
	
	@RequestMapping("projectTestForm")
	public ModelAndView testForm(ModelAndView andView, Map<String, String> params, HttpSession session){
//		String pr_num = (String) session.getAttribute("pnum");
//		andView.addObject("pr_num", pr_num);
		andView.setViewName("user/testBoard/projectTestForm");
		return andView;
	}
	@RequestMapping("projectTestAdd")
	public String testForm(TestVO testInfo) throws Exception{
		service.insertTest(testInfo);
		return "forward:/frmyprojecting/frmyprojecting.do";
	}
	@RequestMapping("projectTestView")
	public ModelAndView testView(ModelAndView andView, String test_num, Map<String, String> params,
			HttpSession session) throws Exception{
		params.put("test_num", test_num);
		TestVO testInfo = service.boardInfo(params);
		andView.addObject("testInfo", testInfo);
		if (session.getAttribute("ADMIN_LOGININFO") != null) {
			andView.setViewName("adm/testBoard/projectTestView");
		}else{
			andView.setViewName("user/testBoard/projectTestView");
		}
		return andView;
	}
	@RequestMapping("projectTestUpdateForm")
	public ModelAndView testUpdateForm(ModelAndView andView, String test_num, Map<String, String> params) throws Exception{
		params.put("test_num", test_num);
		TestVO testInfo = service.boardInfo(params);
		andView.addObject("testInfo", testInfo);
		andView.setViewName("user/testBoard/projectTestUpdateForm");
		return andView;
	}
	@RequestMapping("projectTestUpdate")
	public String testUpdate(TestVO boardInfo) throws Exception{
		service.boardUpdate(boardInfo);
		return "forward:/frmyprojecting/frmyprojecting.do";
	}
	@RequestMapping("projectTestDelete")
	public String testDelete(String test_num, Map<String, String> params) throws Exception{
		params.put("test_num", test_num);
		service.boardDelete(params);
		return "forward:/frmyprojecting/frmyprojecting.do";
	}
}
