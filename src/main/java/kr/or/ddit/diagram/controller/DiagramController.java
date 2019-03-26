package kr.or.ddit.diagram.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.diagram.service.DiagramService;
import kr.or.ddit.utils.RolePagingUtil;
import kr.or.ddit.vo.DiagramVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/diagram/")
public class DiagramController {

	@Autowired
	private DiagramService service;
	
	@RequestMapping("diagramList")
	public ModelAndView diagramList(ModelAndView andView, Map<String, String> params,
			String output_num, HttpSession session, String search_code, String search_data,
			String currentPage, HttpServletRequest request) throws Exception{
		
		params.put("search_code", search_code);
		params.put("search_data", search_data);
		if (currentPage == null) {
			currentPage = "1";
		}
		if (output_num == null) {
			output_num = (String) session.getAttribute("output_num");
		}
		session.setAttribute("output_num", output_num);
		String pr_num = (String) session.getAttribute("pnum");
		params.put("output_num", output_num);
		params.put("pr_num", pr_num);
		int totalCount = service.diagramCount(params);
		
		RolePagingUtil paging = new RolePagingUtil(totalCount, Integer.parseInt(currentPage), request);
		
		String startCount = String.valueOf(paging.getStartCount());
		String endCount = String.valueOf(paging.getEndCount());
		
		params.put("startCount", startCount);
		params.put("endCount", endCount);
		
		List<DiagramVO> diagramList = service.diagramList(params);
		
		String htmlCode = paging.getPageHtmls();
		
		andView.addObject("htmlCode", htmlCode);
		andView.addObject("diagramList", diagramList);
		if (session.getAttribute("ADMIN_LOGININFO") != null) {
			andView.setViewName("adm/diagram/diagramList");
		}else{
			andView.setViewName("user/diagram/diagramList");
		}
		return andView;
	}
	
	@RequestMapping("tool")
	public ModelAndView tool(ModelAndView andView, Map<String, String> params,
			HttpSession session)
	throws Exception{
		andView.setViewName("window/frmyproject/tool");
		return andView;
	}
	
	@RequestMapping("diagramWrite")
	@ResponseBody
	public ModelAndView diagramWrite(ModelAndView andView, DiagramVO diagram) throws Exception{
		if (diagram.getData_num().equals("")) {
			String data_num = service.insertDiagram(diagram);
			andView.addObject("data_num", data_num);
		}else{
			service.updateDiagram(diagram);
			String data_num = diagram.getData_num();
			andView.addObject("data_num", data_num);
		}
		
		Map<String, String> jsonMap = new HashMap<String, String>();
		jsonMap.put("flag", "true");
		andView.addObject("result", jsonMap);
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	@RequestMapping("diagramView")
	public ModelAndView diagramView(ModelAndView andView, Map<String, String> params, String data_num)
	throws Exception{
		params.put("data_num", data_num);
		DiagramVO diagramInfo = service.diagramInfo(params);
		andView.addObject("diagramInfo", diagramInfo);
		andView.setViewName("window/frmyproject/tool");
		return andView;
	}
	
	@RequestMapping("diagramDelete")
	public String diagramDelete(String data_num, Map<String, String> params) throws Exception{
		params.put("data_num", data_num);
		service.deleteDiagram(params);
		return "forward:/diagram/diagramList.do";
	}
}
