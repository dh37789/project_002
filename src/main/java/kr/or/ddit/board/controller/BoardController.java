package kr.or.ddit.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.board.service.IBoardFileService;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.bore.service.IBoreService;
import kr.or.ddit.utils.CryptoGenerator;
import kr.or.ddit.utils.RolePagingUtil;
import kr.or.ddit.utils.RolePagingUtil2;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.Board_fileVO;
import kr.or.ddit.vo.Board_replyVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/board/")
public class BoardController {
	@Autowired
	private IBoardService service;
	@Autowired
	private IBoreService reservice;
	@Autowired
	private IBoardFileService BoardFileService;

	
	@RequestMapping("boardList")
	public ModelAndView boardList(ModelAndView andView,HttpServletRequest request,HttpSession session,String currentPage,String search,String search_keycode, String search_keyword)throws Exception{
		if(search != null){
			session.removeAttribute("currentPage");
		}
		
		if(currentPage == null || currentPage == ""){
			if(session.getAttribute("currentPage") != null){
				currentPage = (String) session.getAttribute("currentPage"); 
			}else{
				currentPage = "1";
			}
		}
		
		if(search_keycode == null){
			search_keycode = (String) session.getAttribute("search_keycode"); 
		}
		if(search_keyword == null){
			search_keyword = (String) session.getAttribute("search_keyword"); 
		}
		
		
		
		Map<String, String> params = new HashMap<String, String>();
		
		params.put("search_keycode", search_keycode);
		params.put("search_keyword", search_keyword);
		
		
		int totalCount = this.service.totalCount(params);
		
		RolePagingUtil pagingUtil = new RolePagingUtil(totalCount, Integer.parseInt(currentPage), request);
		
		String startCount = String.valueOf(pagingUtil.getStartCount());
		String endCount = String.valueOf(pagingUtil.getEndCount());
		params.put("startCount", startCount);
		params.put("endCount", endCount);
		
		List<BoardVO> boardList = this.service.boardList(params);
		request.setAttribute("boardList", boardList);
		
		session.setAttribute("paging", pagingUtil.getPageHtmls());
		
		session.setAttribute("currentPage", currentPage);
		session.setAttribute("search_keyword", search_keyword);
		session.setAttribute("search_keycode", search_keycode);
		
		andView.addObject("boardList",boardList);
		
		andView.setViewName("user/board/boardList");
		session.removeAttribute("search_keyword");
		return andView;
		
	}
	
	@RequestMapping("aboardList")
	public ModelAndView aboardList(ModelAndView andView,HttpServletRequest request,HttpSession session,String currentPage,String search,String search_keycode, String search_keyword)throws Exception{
		session.removeAttribute("search_keyword");
		if(search != null){
			session.removeAttribute("currentPage");
		}
		
		if(currentPage == null || currentPage == ""){
			if(session.getAttribute("currentPage") != null){
				currentPage = (String) session.getAttribute("currentPage"); 
			}else{
				currentPage = "1";
			}
		}
		
		if(search_keycode == null){
			search_keycode = (String) session.getAttribute("search_keycode"); 
		}
		if(search_keyword == null){
			search_keyword = (String) session.getAttribute("search_keyword"); 
		}
		
		
		
		Map<String, String> params = new HashMap<String, String>();
		
		params.put("search_keycode", search_keycode);
		params.put("search_keyword", search_keyword);
		
		
		int totalCount = this.service.totalCount(params);
		
		RolePagingUtil pagingUtil = new RolePagingUtil(totalCount, Integer.parseInt(currentPage), request);
		
		String startCount = String.valueOf(pagingUtil.getStartCount());
		String endCount = String.valueOf(pagingUtil.getEndCount());
		params.put("startCount", startCount);
		params.put("endCount", endCount);
		
		List<BoardVO> boardList = this.service.boardList(params);
		request.setAttribute("boardList", boardList);
		
		session.setAttribute("paging", pagingUtil.getPageHtmls());
		
		session.setAttribute("currentPage", currentPage);
		session.setAttribute("search_keyword", search_keyword);
		session.setAttribute("search_keycode", search_keycode);
		
		andView.addObject("boardList",boardList);
		
		andView.setViewName("admin/board/boardList");
		return andView;
		
		
	}
	
	
	
	@RequestMapping("boardView")
	public ModelAndView boardView(ModelAndView andView,Map<String,String> param,
			String bo_num,Map<String,String> params,
			HttpServletRequest request,String currentPage, HttpSession session) throws Exception{
		if(currentPage == null){
			currentPage = "1";
		}
		param.put("bo_num", bo_num);
		service.boardHit(param);
		BoardVO board = service.boardView(param);
		Board_fileVO InfoFile = BoardFileService.FileInfo(param);
		
		params.put("bo_num", bo_num);
		int totalCount = reservice.totalCount(params);
		
		RolePagingUtil2 pagingUtil2 = new RolePagingUtil2(totalCount, Integer.parseInt(currentPage), request);
		
		String startCount = String.valueOf(pagingUtil2.getStartCount());
		String endCount = String.valueOf(pagingUtil2.getEndCount());
		params.put("startCount", startCount);
		params.put("endCount", endCount);
		
		List<Board_replyVO> boreList = reservice.boreList(params);
		request.setAttribute("boreList", boreList);
		
		session.setAttribute("paging", pagingUtil2.getPageHtmls());
		session.setAttribute("currentPage", currentPage);
		
		andView.addObject("boreList",boreList);
		andView.addObject("board", board );
		andView.addObject("InfoFile", InfoFile);
		andView.setViewName("user/board/boardView");
		return andView;
	}
	
	@RequestMapping("aboardView")
	public ModelAndView aboardView(ModelAndView andView,Map<String,String> param,String bo_num,Map<String,String> params,HttpServletRequest request,String currentPage, HttpSession session) throws Exception{
		if(currentPage == null){
			currentPage = "1";
		}
		param.put("bo_num", bo_num);
		service.boardHit(param);
		BoardVO board = service.boardView(param);
		params.put("bo_num", bo_num);
		Board_fileVO InfoFile = BoardFileService.FileInfo(params);
		
		int totalCount = reservice.totalCount(params);
		
		RolePagingUtil pagingUtil = new RolePagingUtil(totalCount, Integer.parseInt(currentPage), request);
		
		String startCount = String.valueOf(pagingUtil.getStartCount());
		String endCount = String.valueOf(pagingUtil.getEndCount());
		params.put("startCount", startCount);
		params.put("endCount", endCount);
		
		List<Board_replyVO> boreList = reservice.boreList(params);
		request.setAttribute("boreList", boreList);
		
		session.setAttribute("paging", pagingUtil.getPageHtmls());
		session.setAttribute("currentPage", currentPage);
		
		
		andView.addObject("boreList",boreList);
		
		andView.addObject("board", board );
		andView.addObject("InfoFile", InfoFile);
		andView.setViewName("admin/board/boardView");
		return andView;
	}
	
	@RequestMapping("boardForm")
	public ModelAndView boardForm(ModelAndView andView){
		andView.setViewName("user/board/boardForm");
		return andView;
	}

	@RequestMapping("boardUpdateForm")
	public ModelAndView boardUpdateForm(ModelAndView andView,String bo_num,
			Map<String, String> params,Map<String, String> param) throws Exception{
		params.put("bo_num", bo_num);
		param.put("bo_num",bo_num);
		BoardVO board = service.boardView(params);
		Board_fileVO InfoFile =  BoardFileService.FileInfo(param);
		
		andView.addObject("board", board);
		andView.addObject("InfoFile",InfoFile);
		andView.setViewName("user/board/boardUpdateForm");
		return andView;
	}
	
	@RequestMapping("insertBoard")
	public String insertBoard(BoardVO board) throws Exception{
		service.insertBoard(board);
		return "forward:/board/boardList.do";
	}
	
	@RequestMapping("boardDelete")
	public String boardDelete(String bo_num) throws Exception{
		service.deleteBoard(bo_num);
		return "forward:/board/boardList.do";
	}
	@RequestMapping("aboardDelete")
	public String aboardDelete(String bo_num) throws Exception{
		service.deleteBoard(bo_num);
		return "forward:/board/aboardList.do";
	}
	
	@RequestMapping("boardUpdate")
	public String boardUpdate(BoardVO board) throws Exception{
		service.updateBoard(board);
		return  "forward:/board/boardList.do";
	}
	
	@RequestMapping("boardFileDelete")
	public String boardFileDelete(Map<String,String> params,Map<String,String> param,String bofile_num,String bo_num) throws Exception{
		params.put("bofile_num", bofile_num);
		BoardFileService.deleteFile(params);
		return "redirect:/board/boardUpdateForm.do?bo_num="+bo_num;
	}
	
	
}
