package kr.or.ddit.adManagement.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.adManagement.service.MemberMgnService;
import kr.or.ddit.utils.RolePagingUtil;
import kr.or.ddit.vo.MemberVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/memberMgn/")
public class memberMgnController {
	@Autowired
	private MemberMgnService service;
	
	@RequestMapping("clientMgn")
	public ModelAndView clientMgnList(ModelAndView andView, Map<String, String> params, HttpServletRequest request, HttpSession session, String search_keyword, String search_keycode, String currentPage) throws Exception {
		
		request.getParameter("currentPage");
		if(currentPage == null) {
			currentPage = "1";
		}
		
		request.getParameter("search_keycode");
		if(search_keycode == null) {
			search_keycode = (String) session.getAttribute("search_keycode");
		}
		request.getParameter("search_keyword");
		if(search_keyword == null) {
			search_keyword = (String) session.getAttribute("search_keyword");
		}
		
		params = new HashMap<String, String>();
		params.put("search_keycode", search_keycode);
		params.put("search_keyword", search_keyword);
		
		int clientCount = service.clientCount(params);
		
		RolePagingUtil pagingUtil = new RolePagingUtil(clientCount, Integer.parseInt(currentPage), request);
		
	    params.put("startCount", String.valueOf(pagingUtil.getStartCount()));
	    params.put("endCount", String.valueOf(pagingUtil.getEndCount()));
		
	    List<MemberVO> clientList = service.clientList(params);
	    
	    andView.addObject("clientList", clientList);
	    andView.addObject("paging", pagingUtil.getPageHtmls());
	    andView.addObject("search_keycode", search_keycode);
	    andView.addObject("search_keyword", search_keyword);
		
		andView.setViewName("admin/memberMgn/clientList");
		
		return andView;
	}
	
	@RequestMapping("freelancerMgn")
	public ModelAndView freelancerMgnList(ModelAndView andView, Map<String, String> params, HttpServletRequest request, HttpSession session, String search_keyword, String search_keycode, String currentPage) throws Exception {
		
		request.getParameter("currentPage");
		if(currentPage == null) {
			currentPage = "1";
		}
		
		request.getParameter("search_keycode");
		if(search_keycode == null) {
			search_keycode = (String) session.getAttribute("search_keycode");
		}
		request.getParameter("search_keyword");
		if(search_keyword == null) {
			search_keyword = (String) session.getAttribute("search_keyword");
		}
		
		params = new HashMap<String, String>();
		params.put("search_keycode", search_keycode);
		params.put("search_keyword", search_keyword);
		
		int freelancerCount = service.freelancerCount(params);
		
		RolePagingUtil pagingUtil = new RolePagingUtil(freelancerCount, Integer.parseInt(currentPage), request);
		
	    params.put("startCount", String.valueOf(pagingUtil.getStartCount()));
	    params.put("endCount", String.valueOf(pagingUtil.getEndCount()));
		
	    List<MemberVO> freelancerList = service.freelancerList(params);
	    
	    andView.addObject("freelancerList", freelancerList);
	    andView.addObject("paging", pagingUtil.getPageHtmls());
	    andView.addObject("search_keycode", search_keycode);
	    andView.addObject("search_keyword", search_keyword);
		
		andView.setViewName("admin/memberMgn/freelancerList");
		
		return andView;
	}
	
	@RequestMapping("blackMgn")
	public ModelAndView cl_blackMgnList(ModelAndView andView, Map<String, String> params, String iden_num, HttpServletRequest request, HttpSession session, String search_keyword, String search_keycode, String currentPage) throws Exception {
		if(iden_num == null) {	
			if(currentPage == null) {
				currentPage = "1";
			}
			
			int totalCount = service.totalCount(params);
			
			RolePagingUtil pagingUtil = new RolePagingUtil(totalCount, Integer.parseInt(currentPage), request);
			
		    params.put("startCount", String.valueOf(pagingUtil.getStartCount()));
		    params.put("endCount", String.valueOf(pagingUtil.getEndCount()));
		    
		    List<MemberVO> blackList = service.blackList(params);
		    	
		    andView.addObject("blackList", blackList);
		    andView.addObject("paging", pagingUtil.getPageHtmls());
		    andView.setViewName("admin/memberMgn/blackList");
		   
		 } else if(iden_num.equals("1")) {
			request.getParameter("currentPage");
			if(currentPage == null) {
				currentPage = "1";
			}
				
			int clientCount = service.clientCount(params);
				
			RolePagingUtil pagingUtil = new RolePagingUtil(clientCount, Integer.parseInt(currentPage), request);
				
			params.put("startCount", String.valueOf(pagingUtil.getStartCount()));
			params.put("endCount", String.valueOf(pagingUtil.getEndCount()));
		   
			List<MemberVO> blackList = service.cl_blackList(params);
		    	
		    andView.addObject("blackList", blackList);
		    andView.addObject("paging", pagingUtil.getPageHtmls());
		    andView.setViewName("admin/memberMgn/blackList");
		    
		 } else {
			request.getParameter("currentPage");
			if(currentPage == null) {
				currentPage = "1";
			}
				
			int freelancerCount = service.freelancerCount(params);
				
			RolePagingUtil pagingUtil = new RolePagingUtil(freelancerCount, Integer.parseInt(currentPage), request);
				
			params.put("startCount", String.valueOf(pagingUtil.getStartCount()));
			params.put("endCount", String.valueOf(pagingUtil.getEndCount()));			 
		    
			List<MemberVO> blackList = service.free_blackList(params);
		    	
		    andView.addObject("blackList", blackList);
		    andView.addObject("paging", pagingUtil.getPageHtmls());
		    andView.setViewName("admin/memberMgn/blackList");
		 }
			
		return andView;
	}
	
    @RequestMapping("search")
    public ModelAndView search(ModelAndView andView, Map<String, String> params, String currentPage, @RequestParam("search_keyword") String search_keyword, @RequestParam("search_keycode") String search_keycode, HttpServletRequest request) throws Exception{
		if(currentPage == null) {
			currentPage = "1";
		}
		int totalCount = service.totalCount(params);
		
		RolePagingUtil pagingUtil = new RolePagingUtil(totalCount, Integer.parseInt(currentPage), request);
		
	    params.put("startCount", String.valueOf(pagingUtil.getStartCount()));
	    params.put("endCount", String.valueOf(pagingUtil.getEndCount())); 
    	
        params.put("search_keycode", search_keycode);
        params.put("search_keyword", search_keyword);
       
        List<MemberVO> blackList = service.blackList(params);
       
        andView.addObject("search_keycode", search_keycode);
        andView.addObject("search_keyword", search_keyword);
       
        andView.addObject("blackList", blackList);
        andView.addObject("paging", pagingUtil.getPageHtmls());
        andView.setViewName("admin/memberMgn/blackList");
       
       return andView;
    }
	
	@RequestMapping("addBlack")
	public String addBlack(ModelAndView andView, String mem_id, String iden_num) throws Exception {
		if(iden_num.equals("1")) {
			Map<String, String> params = new HashMap<String, String>();
			params.put("iden_num", iden_num);
			params.put("mem_id", mem_id);
			
			this.service.addBlack(params);
			List<MemberVO> clientList = service.clientList(new HashMap<String, String>());

			andView.addObject("clientList", clientList);
			return "redirect:/memberMgn/clientMgn.do";
			
		} else {
			Map<String, String> params = new HashMap<String, String>();
			params.put("iden_id", iden_num);
			params.put("mem_id", mem_id);
			
			this.service.addBlack(params);
			List<MemberVO> freelancerList = service.freelancerList(params);
			
			andView.addObject("freelancerList", freelancerList);
			
			return "redirect:/memberMgn/freelancerMgn.do";
		}
	}
	
	@RequestMapping("removeBlack")
	public String removeBlack(ModelAndView andView, String mem_id, String iden_num) throws Exception {
		
		if(iden_num == null) {
			Map<String, String> params = new HashMap<String, String>();
			params.put("iden_num", iden_num);
			params.put("mem_id", mem_id);
			
			this.service.removeBlack(params);
			List<MemberVO> blackList = service.blackList(params);
			
			andView.addObject("blackList", blackList);
			return "redirect:/memberMgn/blackMgn.do";
			
		} else if(iden_num.equals("1")){
			Map<String, String> params = new HashMap<String, String>();
			params.put("iden_num", iden_num);
			params.put("mem_id", mem_id);
			
			this.service.removeBlack(params);
			List<MemberVO> blackList = service.cl_blackList(params);
			
			andView.addObject("blackList", blackList);
			return "redirect:/memberMgn/blackMgn.do";
			
		} else {
			Map<String, String> params = new HashMap<String, String>();
			params.put("iden_num", iden_num);
			params.put("mem_id", mem_id);
			
			this.service.removeBlack(params);
			List<MemberVO> blackList = service.free_blackList(params);
			
			andView.addObject("blackList", blackList);
			return "redirect:/memberMgn/blackMgn.do";
		}
	}
	
	@RequestMapping("deleteMember")
	public String deleteMember(ModelAndView andView, String mem_id, String iden_num) throws Exception {
		if(iden_num.equals("1")) {
			
			Map<String, String> params = new HashMap<String, String>();
			params.put("iden_num", iden_num);
			params.put("mem_id", mem_id);
			
			this.service.deleteMember(params);
			List<MemberVO> clientList = service.clientList(params);
			
			andView.addObject("clientList", clientList);
			return "redirect:/memberMgn/clientMgn.do";
			
		} else {
			Map<String, String> params = new HashMap<String, String>();
			params.put("iden_num", iden_num);
			params.put("mem_id", mem_id);
			
			this.service.deleteMember(params);
			List<MemberVO> freelancerList = service.freelancerList(params);
			
			andView.addObject("freelancerList", freelancerList);
			return "redirect:/memberMgn/freelancerMgn.do";
		}
	}
	
	@RequestMapping("memberView")
	public ModelAndView memberView(ModelAndView andView, @RequestParam String mem_id, @RequestParam String iden_num, @RequestParam String status_num, HttpServletRequest request ) throws Exception {
		if(iden_num.equals("1") && (!status_num.equals("2"))){
			Map<String, String> params = new HashMap<String, String>();
			params.put("iden_num", iden_num);
			params.put("status_num", status_num);
			params.put("mem_id", mem_id);
			
			MemberVO memberInfo = service.memberInfo(params);
			
			andView.addObject("memberInfo", memberInfo);
			andView.setViewName("admin/memberMgn/clientView");
			
		} else if(iden_num.equals("2") && (!status_num.equals("2"))){
			Map<String, String> params = new HashMap<String, String>();
			params.put("iden_num", iden_num);
			params.put("status_num", status_num);
			params.put("mem_id", mem_id);
			
			MemberVO memberInfo = service.memberInfo(params);
			
			andView.addObject("memberInfo", memberInfo);
			andView.setViewName("admin/memberMgn/freelancerView");
			
		} else if(iden_num.equals("1") && status_num.equals("2")){
			Map<String, String> params = new HashMap<String, String>();
			params.put("iden_num", iden_num);
			params.put("status_num", status_num);
			params.put("mem_id", mem_id);
			
			MemberVO memberInfo = service.memberInfo(params);
			
			andView.addObject("memberInfo", memberInfo);
			andView.setViewName("admin/memberMgn/clientView");
			
		} else if(iden_num.equals("2") && status_num.equals("2")){
			Map<String, String> params = new HashMap<String, String>();
			params.put("iden_num", iden_num);
			params.put("status_num", status_num);
			params.put("mem_id", mem_id);
			
			MemberVO memberInfo = service.memberInfo(params);
			
			andView.addObject("memberInfo", memberInfo);
			andView.setViewName("admin/memberMgn/freelancerView");
		}
		return andView;
	}

	@RequestMapping("blackListView")
	public ModelAndView blackListView(ModelAndView andView, @RequestParam String mem_id, @RequestParam String iden_num, @RequestParam String status_num, HttpServletRequest request ) throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		params.put("iden_num", iden_num);
		params.put("status_num", status_num);
		params.put("mem_id", mem_id);
		
		MemberVO memberInfo = service.memberInfo(params);
		
		andView.addObject("memberInfo", memberInfo);
		andView.setViewName("admin/memberMgn/blackListView");
		return andView;
	}
	
	@RequestMapping("updateClient")
	public ModelAndView updateMember(ModelAndView andview, MemberVO memberInfo, @RequestParam String mem_id, Map<String, String> params) throws Exception {
		
		service.updateMember(memberInfo);
		params.put("mem_id", mem_id);
		memberInfo = service.memberInfo(params);
		
		andview.addObject("memberInfo", memberInfo);
		andview.setViewName("admin/memberMgn/clientView");
					
		return andview;
	}
	
	@RequestMapping("updateFreelancer")
	public ModelAndView updateFreelancer(ModelAndView andview, MemberVO memberInfo, @RequestParam String mem_id, Map<String, String> params) throws Exception {
		
		service.updateMember(memberInfo);
		params.put("mem_id", mem_id);
		memberInfo = service.memberInfo(params);
		
		andview.addObject("memberInfo", memberInfo);
		andview.setViewName("admin/memberMgn/freelancerView");
		
		return andview;
	}
	
	@RequestMapping("updateBlack")
	public ModelAndView updateBlack(ModelAndView andview, MemberVO memberInfo, @RequestParam String mem_id, Map<String, String> params) throws Exception {
		
		service.updateMember(memberInfo);
		params.put("mem_id", mem_id);
		memberInfo = service.memberInfo(params);
		
		andview.addObject("memberInfo", memberInfo);
		andview.setViewName("admin/memberMgn/blackListView");
		
		return andview;
	}
	
	
}
