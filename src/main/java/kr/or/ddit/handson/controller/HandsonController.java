package kr.or.ddit.handson.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.or.ddit.handson.service.TableService;
import kr.or.ddit.vo.Table_dataVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.lowagie.text.pdf.codec.GifImage;

@Controller
@RequestMapping("/handson/")
public class HandsonController {
	
	@Autowired
	private TableService service;
	
	@RequestMapping("requestTable")
	public ModelAndView requestTable(ModelAndView andView, String output_num,
			HttpSession session, Map<String, String> params) throws Exception{
		session.setAttribute("output_num", output_num);
		String pr_num = (String) session.getAttribute("pnum");
		params.put("output_num", output_num);
		params.put("pr_num", pr_num);
		
		Table_dataVO tableInfo = service.requestInfo(params);
		
		andView.addObject("tableInfo", tableInfo);
		andView.setViewName("window/tableForm/requestTable");
		return andView;
	}
	
	@RequestMapping("unitTable")
	public ModelAndView unitTable(ModelAndView andView, String output_num,
			HttpSession session, Map<String, String> params) throws Exception{
		session.setAttribute("output_num", output_num);
		String pr_num = (String) session.getAttribute("pnum");
		params.put("output_num", output_num);
		params.put("pr_num", pr_num);
		
		Table_dataVO tableInfo = service.requestInfo(params);
		
		andView.addObject("tableInfo", tableInfo);
		andView.setViewName("window/tableForm/unitForm");
		return andView;
	}

	@RequestMapping("standardTable")
	public ModelAndView standardTable(ModelAndView andView, String output_num,
			HttpSession session, Map<String, String> params) throws Exception{
		session.setAttribute("output_num", output_num);
		String pr_num = (String) session.getAttribute("pnum");
		params.put("output_num", output_num);
		params.put("pr_num", pr_num);
		
		Table_dataVO tableInfo = service.requestInfo(params);
		
		andView.addObject("tableInfo", tableInfo);
		andView.setViewName("window/tableForm/standardForm");
		return andView;
	}

	@RequestMapping("wordTable")
	public ModelAndView wordTable(ModelAndView andView, String output_num,
			HttpSession session, Map<String, String> params) throws Exception{
		session.setAttribute("output_num", output_num);
		String pr_num = (String) session.getAttribute("pnum");
		params.put("output_num", output_num);
		params.put("pr_num", pr_num);
		
		Table_dataVO tableInfo = service.requestInfo(params);
		
		andView.addObject("tableInfo", tableInfo);
		andView.setViewName("window/tableForm/wordForm");
		return andView;
	}
	
	@RequestMapping("materialTable")
	public ModelAndView materialTable(ModelAndView andView, String output_num,
			HttpSession session, Map<String, String> params) throws Exception{
		session.setAttribute("output_num", output_num);
		String pr_num = (String) session.getAttribute("pnum");
		params.put("output_num", output_num);
		params.put("pr_num", pr_num);
		
		Table_dataVO tableInfo = service.requestInfo(params);
		
		andView.addObject("tableInfo", tableInfo);
		andView.setViewName("window/tableForm/materialForm");
		return andView;
	}
	
	@RequestMapping("tableWrite")
	@ResponseBody
	public ModelAndView tableEdit(ModelAndView andView, Table_dataVO tableInfo) throws Exception{
		if (tableInfo.getData_num().equals("")) {
			service.insertTable(tableInfo);
		}else{
			service.updateTable(tableInfo);
		}
		Map<String, String> jsonMap = new HashMap<String, String>();
		jsonMap.put("flag", "true");
		
		andView.addObject("result", jsonMap);
		andView.setViewName("jsonConvertView");
		return andView;
	}
}
