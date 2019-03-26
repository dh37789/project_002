package kr.or.ddit.file;

import java.io.File;
import java.util.Map;

import kr.or.ddit.board.service.IBoardFileService;
import kr.or.ddit.global.GlobalConstant;
import kr.or.ddit.notice.service.INoticeFileService;
import kr.or.ddit.project.service.ProjectFileService;
import kr.or.ddit.qna.service.IQnaFileService;
import kr.or.ddit.utils.AttacheFileMapper;
import kr.or.ddit.vo.Board_fileVO;
import kr.or.ddit.vo.FileItemVO;
import kr.or.ddit.vo.Notice_fileVO;
import kr.or.ddit.vo.Project_fileVO;
import kr.or.ddit.vo.Qna_fileVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/file/")
public class fileController {
	@Autowired
	private AttacheFileMapper fileMapper;
	@Autowired
	private INoticeFileService NoticeFileService;
	@Autowired
	private IQnaFileService QnaFileService;
	@Autowired
	private IBoardFileService BoardFileService;
	@Autowired
	private ProjectFileService projectFileService;
	
	   @RequestMapping("NoticeFileDownload")
	      public ModelAndView fileDownload(String no_num,
	            ModelAndView andView,
	            Map<String, String> params) throws Exception{
	         // order 1 tilesViewResolver : downloadView X
	         // order 2 beanNameViewResolver : downloadView O
		   	andView.setViewName("downloadView");
	         
	         params.put("nofile_noti_num", no_num);
	         Notice_fileVO FileInfo = NoticeFileService.FileInfo(params);
	         File downloadFile = new File(GlobalConstant.FILE_PATH, FileInfo.getNofile_save_name());
	         String fileName = FileInfo.getNofile_name();
	         andView.addObject("FileInfo", FileInfo);
	         andView.addObject("downloadFile", downloadFile);
	         andView.addObject("fileName",fileName);
		       
	         return andView;
	   }
	
	   @RequestMapping("QnaFileDownload")
	   public ModelAndView qfileDownload(String qa_num,
			   ModelAndView andView,
			   Map<String, String> params) throws Exception{
		   // order 1 tilesViewResolver : downloadView X
		   // order 2 beanNameViewResolver : downloadView O
		   andView.setViewName("downloadView");
		   
		   params.put("qafile_qa_num", qa_num);
		   Qna_fileVO FileInfo = QnaFileService.FileInfo(params);
		   File downloadFile = new File(GlobalConstant.FILE_PATH, FileInfo.getQafile_save_name());
		   String fileName = FileInfo.getQafile_name();
		   andView.addObject("FileInfo", FileInfo);
		   andView.addObject("downloadFile", downloadFile);
		   andView.addObject("fileName",fileName);
		   
		   return andView;
	   }

	   @RequestMapping("BoardFileDownload")
	   public ModelAndView bfileDownload(String bo_num,
			   ModelAndView andView,
			   Map<String, String> params) throws Exception{
		   // order 1 tilesViewResolver : downloadView X
		   // order 2 beanNameViewResolver : downloadView O
		   andView.setViewName("downloadView");
		   
		   params.put("bo_num", bo_num);
		   Board_fileVO FileInfo = BoardFileService.FileInfo(params);
		   File downloadFile = new File(GlobalConstant.FILE_PATH, FileInfo.getBofile_save_name());
		   String fileName = FileInfo.getBofile_name();
		   andView.addObject("FileInfo", FileInfo);
		   andView.addObject("downloadFile", downloadFile);
		   andView.addObject("fileName",fileName);
		   
		   return andView;
	   }
	   
	   @RequestMapping("ProjectFileDownload")
	   public ModelAndView pfileDownload(String pr_num,
			   ModelAndView andView,
			   Map<String, String> params) throws Exception{
		   // order 1 tilesViewResolver : downloadView X
		   // order 2 beanNameViewResolver : downloadView O
		   andView.setViewName("downloadView");
		   
		   params.put("pr_num", pr_num);
		   Project_fileVO fileInfo = projectFileService.fileInfo(params);
		   File downloadFile = new File(GlobalConstant.FILE_PATH, fileInfo.getPrfile_save_name());
		   String fileName = fileInfo.getPrfile_name();
		   andView.addObject("fileInfo", fileInfo);
		   andView.addObject("downloadFile", downloadFile);
		   andView.addObject("fileName",fileName);
		   
		   return andView;
	   }
	   
}
