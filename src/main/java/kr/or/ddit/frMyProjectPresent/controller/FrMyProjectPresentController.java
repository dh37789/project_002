package kr.or.ddit.frMyProjectPresent.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.frMyProject.service.ProjectService;
import kr.or.ddit.frMyProjectPresent.service.ProjectOutputService;
import kr.or.ddit.global.GlobalConstant;
import kr.or.ddit.projectTest.service.TestService;
import kr.or.ddit.utils.AttacheFileMapper;
import kr.or.ddit.utils.RolePagingUtil;
import kr.or.ddit.vo.FileItemVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.Project_notice_fileVO;
import kr.or.ddit.vo.Project_outputVO;
import kr.or.ddit.vo.TestVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/frmyprojecting/")
public class FrMyProjectPresentController {
	
	@Autowired
	private TestService testService;
	
	@Autowired
	private ProjectService proService;
	
	@Autowired
	private ProjectOutputService service;
	
	@Autowired
	private AttacheFileMapper mapper;
	
	@RequestMapping("frmyprojecting")
	public ModelAndView present(ModelAndView andView, HttpSession session, Map<String, String> params,
			String search_data, String search_code, HttpServletRequest request, String currentPage) throws Exception{
		
		String test_pr_num = (String) session.getAttribute("pnum");
		if (currentPage == null) {
			currentPage = "1";
		}
		params.put("test_pr_num", test_pr_num);
		params.put("search_code", search_code);
		params.put("search_data", search_data);
		
		int totalCount = testService.totalCount(params);
		
		RolePagingUtil paging = new RolePagingUtil(totalCount, Integer.parseInt(currentPage), request);
		
		String start = String.valueOf(paging.getStartCount()); 
		String end = String.valueOf(paging.getEndCount());
		
		params.put("start", start);
		params.put("end", end);
		
		List<TestVO> testList = testService.boardList(params);
		
		String htmlCode = String.valueOf(paging.getPageHtmls());
		
		params.put("pr_num", test_pr_num);

		ProjectVO projectInfo = proService.myProjectInfo(params);
		
		params.put("ouput_num", "0");
		Project_outputVO requestInfo = service.fileInfo(params);
		params.put("ouput_num", "3");
		Project_outputVO useFile = service.fileInfo(params);
		params.put("ouput_num", "9");
		Project_outputVO tableFile = service.fileInfo(params);
		params.put("ouput_num", "10");
		Project_outputVO menuFile = service.fileInfo(params);
		params.put("ouput_num", "11");
		Project_outputVO sceneFile = service.fileInfo(params);
		params.put("ouput_num", "12");
		Project_outputVO processFile = service.fileInfo(params);
		params.put("ouput_num", "14");
		Project_outputVO classFile = service.fileInfo(params);
		
		andView.addObject("projectInfo", projectInfo);
		andView.addObject("requestInfo", requestInfo);
		andView.addObject("useFile", useFile);
		andView.addObject("tableFile", tableFile);
		andView.addObject("menuFile", menuFile);
		andView.addObject("sceneFile", sceneFile);
		andView.addObject("processFile", processFile);
		andView.addObject("classFile", classFile);
		
		andView.addObject("htmlCode", htmlCode);
		andView.addObject("testList", testList);
		if (session.getAttribute("ADMIN_LOGININFO") != null) {
			andView.setViewName("adm/frmyprojecting/frmyprojecting");
		}else{
			andView.setViewName("user/frmyprojecting/frmyprojecting");
		}
		return andView;
	}
	@RequestMapping("projectStep1")
	public ModelAndView step1(ModelAndView andView, HttpSession session) throws Exception{
		session.setAttribute("step", "1");
		andView.setViewName("jsonConvertView");
		return andView;
	}
	@RequestMapping("projectStep2")
	public ModelAndView step2(ModelAndView andView, HttpSession session) throws Exception{
		session.setAttribute("step", "2");
		andView.setViewName("jsonConvertView");
		return andView;
	}
	@RequestMapping("projectStep3")
	public ModelAndView step3(ModelAndView andView, HttpSession session) throws Exception{
		session.setAttribute("step", "3");
		andView.setViewName("jsonConvertView");
		return andView;
	}
	@RequestMapping("projectStep4")
	public ModelAndView step4(ModelAndView andView, HttpSession session) throws Exception{
		session.setAttribute("step", "4");
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	@RequestMapping("requestFile")
	public String requestFile(MultipartFile files, HttpSession session, 
			String ouput_num, String mem_id) throws Exception{
		String pr_num = (String) session.getAttribute("pnum");
		if (!files.getOriginalFilename().equals("")) {
			FileItemVO item = mapper.mapping(files, pr_num);
			Project_outputVO file = new Project_outputVO();
			file.setPr_num(pr_num);
			file.setProut_size(item.getFile_size());
			file.setProut_name(item.getFile_name());
			file.setProut_save_name(item.getFile_save_name());
			file.setProut_type(item.getFile_content_type());
			file.setOuput_num(ouput_num);
			file.setMem_id(mem_id);
			service.requestFile(file);
		}
		return "forward:/frmyprojecting/frmyprojecting.do";
	}
	
	@RequestMapping("deleteFile")
	public String deleteFile(String prout_num, Map<String, String> params) throws Exception{
		params.put("prout_num", prout_num);
		service.deleteFile(params);
		return "forward:/frmyprojecting/frmyprojecting.do";
	}
	
	@RequestMapping("downloadFile")
	public ModelAndView downloadFile(ModelAndView andView, String prout_num,
			Map<String, String> params) throws Exception{

		params.put("prout_num", prout_num);
		Project_outputVO fileInfo = service.downloadFile(params);
		File downloadFile = new File(GlobalConstant.FILE_PATH, fileInfo.getProut_save_name());
		
		andView.setViewName("downloadView");
		andView.addObject("downloadFile", downloadFile);
		andView.addObject("fileName", fileInfo.getProut_name());
		return andView;
	} 
	
	@ResponseBody
	@RequestMapping("updateGit")
	public ModelAndView updateGit(ModelAndView andView, Map<String, String> params,
			String pr_num, String gitUrl) throws Exception{
		params.put("pr_num", pr_num);
		params.put("gitUrl", gitUrl);
		proService.updateGit(params);
		andView.setViewName("jsonConvertView");
		return andView;
	}
}
