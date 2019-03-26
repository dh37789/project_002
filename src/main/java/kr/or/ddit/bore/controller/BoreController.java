package kr.or.ddit.bore.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.bore.service.IBoreService;
import kr.or.ddit.utils.CryptoGenerator;
import kr.or.ddit.utils.RolePagingUtil;
import kr.or.ddit.vo.Board_replyVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/bore/")
public class BoreController {
	@Autowired
	private IBoreService service;
	
	
//	@RequestMapping("boreList")
//	public ModelAndView boreList(ModelAndView andView,HttpServletRequest request,HttpSession session,String currentPage,String search,String search_keycode, String search_keyword)throws Exception{
//		
//		Map<String, String> params = new HashMap<String, String>();
//		
//		
//		int totalCount = this.service.totalCount();
//		
//		RolePagingUtil pagingUtil = new RolePagingUtil(totalCount, Integer.parseInt(currentPage), request);
//		
//		String startCount = String.valueOf(pagingUtil.getStartCount());
//		String endCount = String.valueOf(pagingUtil.getEndCount());
//		params.put("startCount", startCount);
//		params.put("endCount", endCount);
//		
//		List<Board_replyVO> boreList = this.service.boreList(params);
//		request.setAttribute("boreList", boreList);
//		
//		session.setAttribute("paging", pagingUtil.getPageHtmls());
//		session.setAttribute("currentPage", currentPage);
//		
//		
//		andView.addObject("boreList",boreList);
//		
//		return andView;
//		
//	}
//	
//	@RequestMapping("aboreList")
//	public ModelAndView aboreList(ModelAndView andView,HttpServletRequest request,HttpSession session,String currentPage,String search,String search_keycode, String search_keyword)throws Exception{
//		Map<String, String> params = new HashMap<String, String>();
//		int totalCount = this.service.totalCount();
//		
//		RolePagingUtil pagingUtil = new RolePagingUtil(totalCount, Integer.parseInt(currentPage), request);
//		
//		String startCount = String.valueOf(pagingUtil.getStartCount());
//		String endCount = String.valueOf(pagingUtil.getEndCount());
//		params.put("startCount", startCount);
//		params.put("endCount", endCount);
//		
//		List<Board_replyVO> boreList = this.service.boreList(params);
//		request.setAttribute("boreList", boreList);
//		
//		session.setAttribute("paging", pagingUtil.getPageHtmls());
//		
//		session.setAttribute("currentPage", currentPage);
//		
//		andView.addObject("boreList",boreList);
//		
//		return andView;
//		
//		
//	}
	
	@RequestMapping("insertBore")
	public String insertBore(Board_replyVO bore,String bo_num) throws Exception{
		service.insertBore(bore);
		return "redirect:/board/boardView.do?bo_num="+bo_num;
	}
	
	@RequestMapping("boreDelete")
	public String boreDelete(String bore_num,String bo_num) throws Exception{
		service.deleteBore(bore_num);
		return "redirect:/board/boardView.do?bo_num="+bo_num;
	}
	@RequestMapping("aboreDelete")
	public String aboreDelete(String bore_num,String bo_num) throws Exception{
		service.deleteBore(bore_num);
		return "redirect:/board/aboardView.do?bo_num="+bo_num;
	}
	
	@RequestMapping("boreUpdate")
	public String boreUpdate(Board_replyVO Bore,String bo_num) throws Exception{
		service.updateBore(Bore);
		return  "redirect:/board/boardView.do?bo_num="+bo_num;
	}
	
	@RequestMapping("insertBoreReply")
	public String insertBoreReply(Board_replyVO Bore,String bo_num)throws Exception{
		service.insertBoreReply(Bore);
		
		return "redirect:/board/boardView.do?bo_num="+bo_num;
	}
}
