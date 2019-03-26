package kr.or.ddit.qna.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.qna.service.IQnaFileService;
import kr.or.ddit.qna.service.IQnaService;
import kr.or.ddit.utils.CryptoGenerator;
import kr.or.ddit.utils.RolePagingUtil;
import kr.or.ddit.vo.QnaVO;
import kr.or.ddit.vo.Qna_fileVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/qna/")
public class QnaController {
	@Autowired
	private IQnaService service;
	@Autowired
	private IQnaFileService QnaFileService;
	
	
	@RequestMapping("qnaList")
	public ModelAndView qnaList(ModelAndView andView,HttpServletRequest request,HttpSession session,String currentPage,String search,String search_keycode, String search_keyword)throws Exception{
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
		
		
		int totalCount = this.service.totalCount();
		
		RolePagingUtil pagingUtil = new RolePagingUtil(totalCount, Integer.parseInt(currentPage), request);
		
		String startCount = String.valueOf(pagingUtil.getStartCount());
		String endCount = String.valueOf(pagingUtil.getEndCount());
		params.put("startCount", startCount);
		params.put("endCount", endCount);
		
		List<QnaVO> qnaList = this.service.qnaList(params);
		request.setAttribute("qnaList", qnaList);
		
		session.setAttribute("paging", pagingUtil.getPageHtmls());
		
		session.setAttribute("currentPage", currentPage);
		session.setAttribute("search_keyword", search_keyword);
		session.setAttribute("search_keycode", search_keycode);
		andView.addObject("qnaList",qnaList);
		
		andView.setViewName("user/qna/qnaList");
		session.removeAttribute("search_keyword");
		return andView;
		
	}
	
	@RequestMapping("aqnaList")
	public ModelAndView aqnaList(ModelAndView andView,HttpServletRequest request,HttpSession session,String currentPage,String search,String search_keycode, String search_keyword)throws Exception{
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
		
		
		int totalCount = this.service.totalCount();
		
		RolePagingUtil pagingUtil = new RolePagingUtil(totalCount, Integer.parseInt(currentPage), request);
		
		String startCount = String.valueOf(pagingUtil.getStartCount());
		String endCount = String.valueOf(pagingUtil.getEndCount());
		params.put("startCount", startCount);
		params.put("endCount", endCount);
		
		List<QnaVO> qnaList = this.service.qnaList(params);
		request.setAttribute("qnaList", qnaList);
		
		session.setAttribute("paging", pagingUtil.getPageHtmls());
		
		session.setAttribute("currentPage", currentPage);
		session.setAttribute("search_keyword", search_keyword);
		session.setAttribute("search_keycode", search_keycode);
		
		andView.addObject("qnaList",qnaList);
		
		andView.setViewName("admin/qna/qnaList");
		return andView;
		
		
	}
	
	
	
	@RequestMapping("qnaView")
	public ModelAndView qnaView(ModelAndView andView,Map<String,String> param,String qa_num,Map<String,String> params) throws Exception{
		param.put("qa_num", qa_num);
		service.qnaHit(param);
		QnaVO qna = service.qnaView(param);
		params.put("qafile_qa_num", qa_num);
		Qna_fileVO InfoFile = QnaFileService.FileInfo(params);
		
		andView.addObject("qna", qna );
		andView.addObject("InfoFile", InfoFile);
		andView.setViewName("user/qna/qnaView");
		return andView;
	}
	
	@RequestMapping("aqnaView")
	public ModelAndView aqnaView(ModelAndView andView,Map<String,String> param,String qa_num,Map<String,String> params) throws Exception{
		param.put("qa_num", qa_num);
		service.qnaHit(param);
		QnaVO qna = service.qnaView(param);
		params.put("qafile_qa_num", qa_num);
		Qna_fileVO InfoFile = QnaFileService.FileInfo(params);
		
		andView.addObject("qna", qna );
		andView.addObject("InfoFile", InfoFile);
		andView.setViewName("admin/qna/qnaView");
		return andView;
	}
	
	@RequestMapping("qnaForm")
	public ModelAndView qnaForm(ModelAndView andView){
		andView.setViewName("user/qna/qnaForm");
		return andView;
	}

	@RequestMapping("qnaUpdateForm")
	public ModelAndView qnaUpdateForm(ModelAndView andView,String qa_num,
			Map<String, String> params,Map<String, String> param) throws Exception{
		params.put("qa_num", qa_num);
		param.put("qafile_qa_num",qa_num);
		QnaVO qna = service.qnaView(params);
		Qna_fileVO InfoFile =  QnaFileService.FileInfo(param);
		
		andView.addObject("qna", qna);
		andView.addObject("InfoFile",InfoFile);
		andView.setViewName("user/qna/qnaUpdateForm");
		return andView;
	}
	
	@RequestMapping("insertQna")
	public String insertQna(QnaVO qna) throws Exception{
		service.insertQna(qna);
		return "forward:/qna/qnaList.do";
	}
	
	@RequestMapping("qnaDelete")
	public String qnaDelete(String qa_num) throws Exception{
		service.delQna(qa_num);
		return "forward:/qna/qnaList.do";
	}

	@RequestMapping("aqnaDelete")
	public String aqnaDelete(String qa_num) throws Exception{
		service.delQna(qa_num);
		return "forward:/qna/aqnaList.do";
	}

	@RequestMapping("aqnaReDelete")
	public String aqnaReDelete(String qa_num,String qa_group) throws Exception{
		service.deleteQna(qa_num);
		service.qnaReDe(qa_group);
		return "forward:/qna/aqnaList.do";
	}
	
	@RequestMapping("qnaUpdate")
	public String qnaUpdate(QnaVO qna) throws Exception{
		service.updateQna(qna);
		return  "forward:/qna/qnaList.do";
	}
	
	@RequestMapping("qnaFileDelete")
	public String qnaFileDelete(Map<String,String> params,Map<String,String> param,String qafile_num,String qa_num) throws Exception{
		params.put("qafile_num", qafile_num);
		QnaFileService.deleteFile(params);
		return "redirect:/qna/qnaUpdateForm.do?qa_num="+qa_num;
	}
	
	@RequestMapping("qnaReplyForm")
	public ModelAndView qnaReplyForm(ModelAndView andView,String qa_num,
			Map<String, String> param) throws Exception{
		param.put("qa_num", qa_num);
		QnaVO qna = service.qnaView(param);
		andView.addObject("qna", qna);
		andView.setViewName("admin/qna/qnaReplyForm");
		return andView;
	}
	
	@RequestMapping("insertQnaReply")
	public String insertQnaReply(QnaVO qna,String qa_group)throws Exception{
		service.insertQnaReply(qna);
		service.qnaRe(qa_group);
		return "redirect:/qna/aqnaList.do";
	}
}
