package kr.or.ddit.notice.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.global.GlobalConstant;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.notice.service.INoticeFileService;
import kr.or.ddit.notice.service.INoticeService;
import kr.or.ddit.utils.CryptoGenerator;
import kr.or.ddit.utils.RolePagingUtil;
import kr.or.ddit.vo.NoticeVO;
import kr.or.ddit.vo.Notice_fileVO;
import kr.or.ddit.vo.Project_noticeVO;
import kr.or.ddit.vo.Project_notice_fileVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/notice/")
public class NoticeController {
	@Autowired
	private INoticeService service;
	@Autowired
	private INoticeFileService NoticeFileService;
	
	
	@RequestMapping("noticeList")
	public ModelAndView noticeList(ModelAndView andView,HttpServletRequest request,HttpSession session,String currentPage,String search,String search_keycode, String search_keyword)throws Exception{
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
		
		List<NoticeVO> noticeList = this.service.noticeList(params);
		request.setAttribute("noticeList", noticeList);
		
		session.setAttribute("paging", pagingUtil.getPageHtmls());
		
		session.setAttribute("currentPage", currentPage);
		session.setAttribute("search_keyword", search_keyword);
		session.setAttribute("search_keycode", search_keycode);
		
		andView.addObject("noticeList",noticeList);
		
		andView.setViewName("user/notice/noticeList");
		session.removeAttribute("search_keyword");
		return andView;
		
	}
	
	@RequestMapping("anoticeList")
	public ModelAndView anoticeList(ModelAndView andView,HttpServletRequest request,HttpSession session,String currentPage,String search,String search_keycode, String search_keyword)throws Exception{
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
		
		List<NoticeVO> noticeList = this.service.noticeList(params);
		request.setAttribute("noticeList", noticeList);
		
		session.setAttribute("paging", pagingUtil.getPageHtmls());
		
		session.setAttribute("currentPage", currentPage);
		session.setAttribute("search_keyword", search_keyword);
		session.setAttribute("search_keycode", search_keycode);
		
		andView.addObject("noticeList",noticeList);
		
		andView.setViewName("admin/notice/noticeList");
		return andView;
		
		
	}
	
	
	
	@RequestMapping("noticeView")
	public ModelAndView noticeView(ModelAndView andView,Map<String,String> param,String no_num,Map<String,String> params) throws Exception{
		param.put("no_num", no_num);
		NoticeVO notice = service.noticeView(param);
		params.put("nofile_noti_num", no_num);
		Notice_fileVO InfoFile = NoticeFileService.FileInfo(params);
		service.noticeHit(param);
		
		andView.addObject("notice", notice );
		andView.addObject("InfoFile", InfoFile);
		andView.setViewName("user/notice/noticeView");
		return andView;
	}
	
	@RequestMapping("anoticeView")
	public ModelAndView anoticeView(ModelAndView andView,Map<String,String> param,String no_num,Map<String,String> params) throws Exception{
		param.put("no_num", no_num);
		service.noticeHit(param);
		NoticeVO notice = service.noticeView(param);
		params.put("nofile_noti_num", no_num);
		Notice_fileVO InfoFile = NoticeFileService.FileInfo(params);
		
		andView.addObject("notice", notice );
		andView.addObject("InfoFile", InfoFile);
		andView.setViewName("admin/notice/noticeView");
		return andView;
	}
	
	@RequestMapping("noticeForm")
	public ModelAndView noticeForm(ModelAndView andView){
		andView.setViewName("admin/notice/noticeForm");
		return andView;
	}

	@RequestMapping("noticeUpdateForm")
	public ModelAndView noticeUpdateForm(ModelAndView andView,String no_num,
			Map<String, String> params,Map<String, String> param) throws Exception{
		params.put("no_num", no_num);
		param.put("nofile_noti_num", no_num);
		NoticeVO notice = service.noticeView(params);
		Notice_fileVO InfoFile =  NoticeFileService.FileInfo(param);
 		
		andView.addObject("notice",notice);
		andView.addObject("InfoFile",InfoFile);
		andView.setViewName("admin/notice/noticeUpdateForm");
		return andView;
	}
	
	@RequestMapping("insertNotice")
	public String insertNotice(NoticeVO notice) throws Exception{
		service.insertNotice(notice);
		return "forward:/notice/anoticeList.do";
	}
	
	@RequestMapping("noticeDelete")
	public String noticeDelete(String no_num) throws Exception{
		service.deleteNotice(no_num);
		return "forward:/notice/anoticeList.do";
	}
	
	@RequestMapping("noticeUpdate")
	public String noticeUpdate(NoticeVO notice) throws Exception{
		service.updateNotice(notice);
		return  "forward:/notice/anoticeList.do";
	}
	
	@RequestMapping("noticeFileDelete")
	public String noticeFileDelete(Map<String,String> params,Map<String,String> param,String nofile_num,String no_num) throws Exception{
		params.put("nofile_num", nofile_num);
		NoticeFileService.deleteFile(params);
		return "redirect:/notice/noticeUpdateForm.do?no_num="+no_num;
	}
	
	
}
