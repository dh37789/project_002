package kr.or.ddit.fProjectNotice.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.alarm.service.AlarmService;
import kr.or.ddit.constract.service.ContractService;
import kr.or.ddit.fProjectNotice.service.ProjectNtcFileService;
import kr.or.ddit.fProjectNotice.service.ProjectNtcService;
import kr.or.ddit.global.GlobalConstant;
import kr.or.ddit.project.service.ProjectService;
import kr.or.ddit.utils.RolePagingUtil;
import kr.or.ddit.vo.FileItemVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.Project_noticeVO;
import kr.or.ddit.vo.Project_notice_fileVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/frprojectntc/")
public class FProjectNoticeController {
	@Autowired
	private ProjectNtcService service;
	@Autowired
	private ProjectNtcFileService fileService;
	@Autowired
	private ContractService conService;
	@Autowired
	private ProjectService projectService;
	@Autowired
	private AlarmService alarmService;
	
	@RequestMapping("frprojectntcList")
	public ModelAndView noticeList(ModelAndView andView, String pnum,String part,
			Map<String, String> params, HttpServletRequest request, String currentPage, 
			String search_code, String search_data, HttpSession session) throws Exception{
		if (pnum == "" || pnum == null) {
			pnum = (String) session.getAttribute("pnum");
		}
		params.put("pr_num", pnum);
		if (part == null) {
			part = (String) session.getAttribute("part");
		}
		if (currentPage == null) {
			currentPage = "1";
		}
		params.put("search_code", search_code);
		params.put("search_data", search_data);

		int totalCount = service.boardCount(params);
		
		RolePagingUtil paging = new RolePagingUtil(totalCount, Integer.parseInt(currentPage), request);
		String startCount = String.valueOf(paging.getStartCount());
		String endCount = String.valueOf(paging.getEndCount());
		

		params.put("startCount", startCount);
		params.put("endCount", endCount);
		
		String htmlCode = paging.getPageHtmls();
		List<Project_noticeVO> boardList = service.boardList(params);
	
		andView.addObject("htmlCode", htmlCode);
		andView.addObject("pnum", pnum);
		andView.addObject("part", part);
		andView.addObject("boardList", boardList);
		if (session.getAttribute("ADMIN_LOGININFO") != null) {
			andView.setViewName("adm/frmyprojectnotice/frMyProjectNtcList");
		}else{
			andView.setViewName("user/frmyprojectnotice/frMyProjectNtcList");
		}
		return andView;
	}
	
	@RequestMapping("frprojectntcAdd")
	public ModelAndView noticeWriteForm(ModelAndView andView, String pnum,String part){
		andView.addObject("part", part);
		andView.addObject("pnum", pnum);
		
		andView.setViewName("user/frmyprojectnotice/frMyProjectNtcWrite");
		return andView;
	}

	@RequestMapping("ntcwrite")
	public String noticeWrite(Project_noticeVO boardInfo, String pnum, 
			String part) throws Exception{
		service.insertNtc(boardInfo);
		
		String pr_num= boardInfo.getPr_num();
		Map<String, String> params = new HashMap<String, String>();
		params.put("pr_num", pr_num);
		ProjectVO project = projectService.projectInfo(params);
		List<String> freeList = conService.selectFree(pr_num);
		for(String free: freeList){
			params.put("client", free);
			params.put("content",project.getPr_title()+"프로젝트의 공지사항이 등록되었습니다. 확인해주세요");
			alarmService.insertAlarmMessage(params);
		}
		return "forward:/frprojectntc/frprojectntcList.do";
	}
	@RequestMapping("frprojectntcView")
	public ModelAndView noticeView(ModelAndView andView, String pnum,String part,String prno_num,
			Map<String, String> params, HttpSession session) throws Exception{
		params.put("prno_num", prno_num);
		Project_noticeVO boardInfo = service.boardInfo(params);
		Project_notice_fileVO boardInfoFile = fileService.boardFileInfo(params);
		
		andView.addObject("pnum", pnum);
		andView.addObject("part", part);
		andView.addObject("boardInfo", boardInfo);
		andView.addObject("boardInfoFile", boardInfoFile);
		if (session.getAttribute("ADMIN_LOGININFO") != null) {
			andView.setViewName("adm/frmyprojectnotice/frMyProjectNtcView");
		}else{
			andView.setViewName("user/frmyprojectnotice/frMyProjectNtcView");
		}
		return andView;
	}
	@RequestMapping("frprojectntcDelete")
	public String noticeDelete(Map<String, String> params, String prno_num, String pnum, String part) throws Exception{
		params.put("prno_num", prno_num);
		service.deleteNtc(params);
		return "forward:/frprojectntc/frprojectntcList.do";
	}
	@RequestMapping("frprojectntcUpdateForm")
	public ModelAndView noticeUpdateForm(ModelAndView andView, String pnum,String part,String prno_num,
			Map<String, String> params) throws Exception{
		params.put("prno_num", prno_num);
		Project_noticeVO boardInfo = service.boardInfo(params);
		Project_notice_fileVO boardInfoFile = fileService.boardFileInfo(params);
		
		andView.addObject("pnum", pnum);
		andView.addObject("part", part);
		andView.addObject("boardInfo", boardInfo);
		andView.addObject("boardInfoFile", boardInfoFile);
		andView.setViewName("user/frmyprojectnotice/frMyProjectNtcUpdateForm");
		return andView;
	}
	
	@RequestMapping("ntcFileDelete")
	@ResponseBody
	public ModelAndView ntcFileDelete(String prnofile_num,String prnofile_save_name, 
			Map<String, String> params,
			ModelAndView andView) throws Exception{
		params.put("prnofile_num", prnofile_num);
		
		int cnt = this.fileService.deleteFile(params);
		Map<String, String> jsonMap = new HashMap<String, String>();
		if (cnt == 1) {
			jsonMap.put("flag", "true");
		}else{
			jsonMap.put("flag", "false");
		}
		
		andView.addObject("result", jsonMap);
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	@RequestMapping("noticeUpdate")
	public String noticeUpdate(Project_noticeVO boardInfo, String pnum, String part) throws Exception{
		service.updateNtc(boardInfo);
		return "forward:/frprojectntc/frprojectntcList.do";
	}
	
	@RequestMapping("downloadFile")
	public ModelAndView downloadFile(ModelAndView andView, String prnofile_num,
					Map<String, String> params) throws Exception{
		
		params.put("prnofile_num", prnofile_num);
		Project_notice_fileVO fileInfo = fileService.fileInfo(params);
		File downloadFile = new File(GlobalConstant.FILE_PATH, fileInfo.getPrnofile_save_name());
		
		andView.setViewName("downloadView");
		andView.addObject("downloadFile", downloadFile);
		andView.addObject("fileName", fileInfo.getPrnofile_name());
		return andView;
	}
	
}
