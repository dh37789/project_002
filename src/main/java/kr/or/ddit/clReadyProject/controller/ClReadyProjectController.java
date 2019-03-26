package kr.or.ddit.clReadyProject.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.or.ddit.alarm.service.AlarmService;
import kr.or.ddit.clReadyProject.service.ContractFileService;
import kr.or.ddit.constract.service.SignService;
import kr.or.ddit.frMyProject.service.ContractService;
import kr.or.ddit.global.GlobalConstant;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.project.service.ApplyService;
import kr.or.ddit.project.service.ProjectService;
import kr.or.ddit.utils.AttacheFileMapper;
import kr.or.ddit.utils.CLOBtoString;
import kr.or.ddit.utils.ImageCompose;
import kr.or.ddit.utils.ImageReader;
import kr.or.ddit.utils.ImageTest;
import kr.or.ddit.utils.MoneyComma;
import kr.or.ddit.vo.ApplyVO;
import kr.or.ddit.vo.ConstractVO;
import kr.or.ddit.vo.Constract_fileVO;
import kr.or.ddit.vo.FileItemVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.SignVO;
import oracle.sql.CLOB;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.poi.util.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/readyProject/")
public class ClReadyProjectController {

	@Autowired
	private ProjectService service;
	
	@Autowired
	private ApplyService appService;
	
	@Autowired
	private IMemberService memService;
	
	@Autowired
	private ContractService conService;
	
	@Autowired
	private AttacheFileMapper mapper;
	
	@Autowired
	private SignService signService;
	
	@Autowired
	private ContractFileService conFileService;
	
	@Autowired
	private AlarmService alarmService;
	
	@Autowired
	private kr.or.ddit.constract.service.ContractService contractService;
	
	@RequestMapping("projectList")
	public ModelAndView readyProjectList(ModelAndView andView, 
			HttpSession session, Map<String, String> params) throws Exception{
		MemberVO memberInfo = (MemberVO) session.getAttribute("USER_LOGININFO");
		String client = memberInfo.getMem_id();
		params.put("client", client);
		List<ProjectVO> projectList = service.readyList(params);
		for (ProjectVO projectInfo : projectList) {
			String payment = MoneyComma.toNumFormat(Integer.parseInt(projectInfo.getPr_payment()));
			projectInfo.setPr_payment(payment);
		}
		andView.addObject("projectList", projectList);
		andView.setViewName("user/readyProject/readyList");
		return andView;
	}
	
	@RequestMapping("projectView")
	public ModelAndView readyProjectView(ModelAndView andView, Map<String, String> params,
			HttpSession session, String pr_num) throws Exception{
		params.put("pr_num", pr_num);
		ProjectVO projectInfo = service.projectView(params);
		List<HashMap<String, Object>> conList = appService.conList(params);
		for (HashMap<String, Object> conInfo : conList) {
			String content = CLOBtoString.clobToString((CLOB)conInfo.get("AP_CONTENT"));
			conInfo.put("AP_CONTENT", content);
			String money = MoneyComma.toNumFormat(Integer.parseInt(String.valueOf(conInfo.get("AP_PAYMENT"))));
			conInfo.put("AP_PAYMENT", money);
		}
		int conChk = conService.conChk(params);
		andView.addObject("conChk", conChk);
		andView.addObject("projectInfo", projectInfo);
		andView.addObject("conList", conList);
		andView.setViewName("user/readyProject/readyView");
		return andView;
	}
	@RequestMapping("readyCon")
	public ModelAndView readyCon(ModelAndView andView, Map<String, String> params, HttpSession session,
			String mem_id, String pr_num) throws Exception{
		params.put("mem_id", mem_id);
		params.put("pr_num", pr_num);
		MemberVO memberInfo = memService.memberInfo(params);
		ApplyVO applyInfo = appService.applyInfo(params);
		String money = MoneyComma.toNumFormat(Integer.parseInt(applyInfo.getAp_payment()));
		applyInfo.setAp_payment(money);
		ConstractVO conInfo = conService.constractInfo(params);
		if (conInfo.getCons_payment() != null) {
			money = MoneyComma.toNumFormat(Integer.parseInt(conInfo.getCons_payment()));
			conInfo.setCons_payment(money);
		}
		andView.addObject("mem_id", mem_id);
		andView.addObject("pr_num", pr_num);
		andView.addObject("conInfo", conInfo);
		andView.addObject("applyInfo", applyInfo);
		andView.addObject("memberInfo", memberInfo);
		andView.setViewName("user/readyProject/readyCon");
		return andView;
	}
	
	@RequestMapping("consUpdate")
	public String consUpdate(ConstractVO consInfo,String mem_name, String mem_id, String pr_num, Map<String, String> params) throws Exception{
		conService.updateCons(consInfo);
		params.put("pr_num", pr_num);
		ProjectVO projectInfo = service.projectInfo(params);
		params.put("mem_id", projectInfo.getClient());
		MemberVO memberInfo = memService.memberInfo(params);
		File file = ImageTest.textToImage(memberInfo.getMem_name(), mem_name, projectInfo.getPr_title());
		FileItem fileItem = new DiskFileItem("mainFile", Files.probeContentType(file.toPath()), false, file.getName(), (int) file.length(), file.getParentFile());
		try {
		    InputStream input = new FileInputStream(file);
		    OutputStream os = fileItem.getOutputStream();
		    IOUtils.copy(input, os);
		} catch (IOException ex) {
		}
		MultipartFile item = new CommonsMultipartFile(fileItem);
		FileItemVO fileInfo = mapper.mapping(item, consInfo.getCons_num());
		conFileService.insertContractFile(fileInfo);
		
		List<String> freeList = contractService.selectFree(pr_num);
		for(String free : freeList){
			
			params.put("client", free);
			params.put("content", "클라이언트가 "+projectInfo.getPr_title()+"에 계약을 등록했습니다.");
			alarmService.insertAlarmMessage(params);
			
		}
		
		return "forward:/readyProject/readyCon.do";
	}
	
	@ResponseBody
	@RequestMapping("contractFile")
	public ModelAndView contractFile(ModelAndView andView, Map<String, String> params,
			String cons_num) throws Exception{
		params.put("cons_num", cons_num);
		HashMap<String, String> consList = conService.consFile(params);
		andView.addObject("consList", consList);
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	@RequestMapping("clientOk")
	public String clientOk(ModelAndView andView,String cons_num, 
			Map<String,String> params, String mem_id, String client_id) throws Exception{
		params.put("cons_num", cons_num);
		params.put("mem_id", client_id);
		HashMap<String, String> consList = conService.consFile(params);
		SignVO signInfo = signService.signInfo(params);
		ImageCompose.contractSign(consList.get("CONSFILE_SAVE_NAME"), signInfo.getSign_save_name(), "c");
		conService.clientOk(params);
		
		
		params.put("client", mem_id);
		params.put("content", "계약이 최종 완료되었습니다. 대금을 입금하면 프로젝트가 시작됩니다.");
		alarmService.insertAlarmMessage(params);
		
		String pr_num = contractService.selectPr_num(cons_num);
		List<String> freeList = contractService.selectFree(pr_num);
		for(String free:freeList){
			params.put("client", free);
			params.put("content", "계약이 최종 완료되었습니다. 클라이언트가 대금을 입금하면 프로젝트가 시작됩니다.");
			alarmService.insertAlarmMessage(params);
		}
		
		return "forward:/readyProject/readyCon.do";
	}
	
	@RequestMapping("conDownload")
	public ModelAndView conDownload(ModelAndView andView, Map<String, String> params,
			String cons_num) throws Exception{
		params.put("cons_num", cons_num);
		Constract_fileVO fileInfo = conFileService.fileInfo(params);
		File downloadFile = new File(GlobalConstant.FILE_PATH, fileInfo.getConsfile_save_name());
		
		andView.setViewName("downloadView");
		andView.addObject("downloadFile", downloadFile);
		andView.addObject("fileName", fileInfo.getConsfile_name());
		return andView;
	}
	@ResponseBody
	@RequestMapping("contractPay")
	public ModelAndView contractPay(ModelAndView andView, Map<String, String> params,
			String pr_num) throws Exception{
		params.put("cons_proj_num", pr_num);
		int money = conService.totalMoney(params);
		String totalMoney = MoneyComma.toNumFormat(money);
		andView.addObject("totalMoney", totalMoney);
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	@RequestMapping("payOk")
	public String payOk(String pr_num, Map<String, String> params) throws Exception{
		params.put("pr_num", pr_num);
		service.payOk(params);
		return "forward:/readyProject/projectView.do";
	}
}
