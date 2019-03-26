package kr.or.ddit.projectWork.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.frMyProject.service.ContractService;
import kr.or.ddit.projectWork.service.ProjectWorkService;
import kr.or.ddit.utils.GanttChartDTO;
import kr.or.ddit.utils.RolePagingUtil;
import kr.or.ddit.vo.WorkVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/projectWork/")
public class ProjectWorkController {
	@Autowired
	private ProjectWorkService service;
	@Autowired
	private ContractService conService;
	
	@RequestMapping("workList")
	public ModelAndView workList(ModelAndView andView, Map<String, String> params, HttpSession session,
			String currentPage, HttpServletRequest request, String search_code, String search_data) throws Exception{
		String pnum = (String) session.getAttribute("pnum");
		params.put("work_proj_num", pnum);
		if (currentPage == null) {
			currentPage = "1";
		}
		if (search_code!=null) {
			if (search_code.equals("rank")) {
				if (search_data.equals("상")) {
					search_data = "0";
				}else if (search_data.equals("중")) {
					search_data = "1";
				}else if (search_data.equals("하")){
					search_data = "2";
				}
			}
		}
		params.put("search_code", search_code);
		params.put("search_data", search_data);
		
		int totalCount = service.totalCount(params);
		
		RolePagingUtil paging = new RolePagingUtil(totalCount, Integer.parseInt(currentPage), request);
		String start = String.valueOf(paging.getStartCount());
		String end = String.valueOf(paging.getEndCount());
		
		params.put("start", start);
		params.put("end", end);
		
		List<WorkVO> workList = service.boardList(params);
		
		String htmlCode = paging.getPageHtmls();
		andView.addObject("htmlCode", htmlCode);
		andView.addObject("workList", workList);
		if (session.getAttribute("ADMIN_LOGININFO") != null) {
			andView.setViewName("adm/projectWork/workList");
		}else{
			andView.setViewName("user/projectWork/workList");
		}
		return andView;
	}
	
	@RequestMapping("workForm")
	public ModelAndView workForm(ModelAndView andView, Map<String, String> params, HttpSession session) throws Exception{
		String pnum = (String) session.getAttribute("pnum");
		params.put("cons_proj_num", pnum);
		params.put("work_proj_num", pnum);
		
		List<HashMap<String, Object>> memList = conService.memList(params);
		List<WorkVO> orderList = service.orderList(params);
		
		andView.addObject("orderList", orderList);
		andView.addObject("memList", memList);
		andView.setViewName("user/projectWork/workForm");
		return andView;
	}
	
	@RequestMapping("workWrite")
	public String workWrite(WorkVO workInfo, Map<String, String> params, HttpSession session) throws Exception{
		if (!workInfo.getWork_order().equals("")) {
			String pnum = (String) session.getAttribute("pnum");
			params.put("work_proj_num", pnum);
			params.put("work_order", workInfo.getWork_order());
			WorkVO orderInfo = service.orderInfo(params);
			workInfo.setWork_group(orderInfo.getWork_num());
		}
		service.insertWork(workInfo);
		return "forward:/projectWork/workList.do";
	}
	
	@RequestMapping("workViewForm")
	public ModelAndView workView(ModelAndView andView, Map<String, String> params, String work_num
			, HttpSession session) throws Exception{
		String pnum = (String) session.getAttribute("pnum");
		params.put("work_proj_num", pnum);
		params.put("work_num", work_num);
		WorkVO workInfo = service.boardInfo(params);
		if (workInfo.getWork_order() != null) {
			params.put("work_order", workInfo.getWork_order());
			WorkVO orderInfo = service.orderInfo(params);
			andView.addObject("orderInfo", orderInfo);
		}
		andView.addObject("workInfo", workInfo);
		if (session.getAttribute("ADMIN_LOGININFO") != null) {
			andView.setViewName("adm/projectWork/workView");
		}else{
			andView.setViewName("user/projectWork/workView");
		}
		return andView;
	}
	@RequestMapping("workDel")
	public String workDel(Map<String, String> params, String work_num) throws Exception{
		params.put("work_num", work_num);
		service.deleteWork(params);
		return "forward:/projectWork/workList.do";
	}
	
	@RequestMapping("workEditForm")
	public ModelAndView workEditForm(ModelAndView andView, Map<String, String> params, 
			String work_num, HttpSession session) throws Exception{
		params.put("work_num", work_num);

		String pnum = (String) session.getAttribute("pnum");
		params.put("cons_proj_num", pnum);
		params.put("work_proj_num", pnum);
		
		WorkVO workInfo = service.boardInfo(params);
		List<HashMap<String, Object>> memList = conService.memList(params);
		List<WorkVO> orderList = service.orderList(params);
		
		andView.addObject("orderList", orderList);
		andView.addObject("memList", memList);
		andView.addObject("workInfo", workInfo);
		andView.setViewName("user/projectWork/workEditForm");
		return andView;
	}
	@RequestMapping("workEdit")
	public String workEdit(WorkVO workInfo, Map<String, String> params, HttpSession session) throws Exception{
		if (!workInfo.getWork_order().equals("")) {
			String pnum = (String) session.getAttribute("pnum");
			params.put("work_proj_num", pnum);
			params.put("work_order", workInfo.getWork_order());
			WorkVO orderInfo = service.orderInfo(params);
			workInfo.setWork_group(orderInfo.getWork_num());
		}else{
			workInfo.setWork_group(workInfo.getWork_num());
		}
		service.updateWork(workInfo);
		return "forward:/projectWork/workList.do";
	}
	@RequestMapping("ganttChart")
	public ModelAndView ganttChart(ModelAndView andView, Map<String, String> params, HttpSession session) throws Exception{
		String pnum = (String) session.getAttribute("pnum");
		params.put("work_proj_num", pnum);
		
		List<WorkVO> workList = service.chartList(params);
		String jsCode = GanttChartDTO.getDtoCode(workList);
		int size = workList.size() * 50;
		if (size < 200) {
			size = 200;
		}
		andView.addObject("size", size);
		andView.addObject("jsCode", jsCode);
		if (session.getAttribute("ADMIN_LOGININFO") != null) {
			andView.setViewName("adm/projectWork/ganttChart");
		}else{
			andView.setViewName("user/projectWork/ganttChart");
		}
		return andView;
	}
}
