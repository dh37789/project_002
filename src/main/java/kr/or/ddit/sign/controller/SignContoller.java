package kr.or.ddit.sign.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.util.Map;

import javax.imageio.ImageIO;

import kr.or.ddit.constract.service.SignService;
import kr.or.ddit.utils.AttacheFileMapper;
import kr.or.ddit.utils.AttacheSignMapper;
import kr.or.ddit.utils.ImageReader;
import kr.or.ddit.vo.SignVO;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.poi.util.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/sign/")
public class SignContoller {

	@Autowired
	private AttacheSignMapper mapper;
	
	@Autowired
	private SignService service;
	
	@RequestMapping("signView")
	@ResponseBody
	public ModelAndView signView(ModelAndView andView, String sign_data, String mem_id,
			Map<String, String> params) throws Exception{
		File file = ImageReader.makeFileWithString(sign_data);
		FileItem fileItem = new DiskFileItem("mainFile", Files.probeContentType(file.toPath()), false, file.getName(), (int) file.length(), file.getParentFile());
		try {
		    InputStream input = new FileInputStream(file);
		    OutputStream os = fileItem.getOutputStream();
		    IOUtils.copy(input, os);
		} catch (IOException e) {}
		MultipartFile signFile = new CommonsMultipartFile(fileItem);
		SignVO signInfo = mapper.mapping(signFile, mem_id);
		params.put("mem_id", mem_id);
		int cnt = service.countSign(params);
		if (cnt == 0) {
			service.insertFirstSign(signInfo);
		}else{
			service.insertSign(signInfo);
		}
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	@RequestMapping("deleteSign")
	public String deleteSign(String mem_id, String sign_num, 
			Map<String, String> params) throws Exception{
		params.put("sign_num", sign_num);
		service.deleteSign(params);
		return "forward:/freProfile/infoView.do";
	}
	
	@RequestMapping("representSign")
	public String representSign(String mem_id, String sign_num, 
			Map<String, String> params) throws Exception{
		params.put("sign_num", sign_num);
		params.put("mem_id", mem_id);
		service.resetSign(params);
		return "forward:/freProfile/infoView.do";
	}
}
