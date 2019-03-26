package kr.or.ddit.evalation.controller;

import java.util.HashMap;
import java.util.Map;

import kr.or.ddit.evalation.service.IEvalationService;
import kr.or.ddit.vo.EvalationVO;
import kr.or.ddit.vo.PortfolioVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/eval/")
public class EvalationController {

	@Autowired
	private IEvalationService evalService;
	
	@RequestMapping("insertEval")
	@ResponseBody
	public ModelAndView insertEval(ModelAndView andView, EvalationVO evalationVO) throws Exception{
		Map<String, String> jsonMap = new HashMap<String, String>();
		
		int cnt = this.evalService.insertEvalation(evalationVO);
		
		if (cnt == 1) {
			jsonMap.put("flag", "true");
		}else{
			jsonMap.put("flag", "false");
		}
		
		andView.addObject("result", jsonMap);
		andView.setViewName("jsonConvertView");
		return andView;

	}
}
