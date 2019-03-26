package kr.or.ddit.main.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.or.ddit.main.service.MainService;
import kr.or.ddit.project.service.ProjectService;
import kr.or.ddit.project.service.ProjectTechService;
import kr.or.ddit.utils.MoneyComma;
import kr.or.ddit.vo.CrawlingVO;
import kr.or.ddit.vo.LanguageVO;
import kr.or.ddit.vo.ProjectVO;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import sun.util.calendar.Era;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/main/")
public class HomeController {
	@Autowired
	private MainService mainService;
	@Autowired
	private ProjectService projectService;
	@Autowired
	private ProjectTechService techservice;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws Exception 
	 */
	@RequestMapping("hello")
	public ModelAndView home(ModelAndView andView, Map<String, String> params, 
			HttpSession session) throws Exception {
		int totalCount = mainService.totalCount();
		int countPay = mainService.countPay();
		int countMember = mainService.countMember();
		List<ProjectVO> projectList = projectService.mainProList();
		Gson gson = new Gson();
		
		String url = "https://news.naver.com/main/list.nhn?mode=LS2D&mid=shm&sid1=105&sid2=230";
		System.out.println("=======================================");
		System.out.println("url : " + url);
		
		Document doc = Jsoup.connect(url).get();
		
		Elements element = doc.select("div.newsflash_body");
		
		System.out.println("========================================");
		List<CrawlingVO> crawList = new ArrayList<CrawlingVO>(); 
		
		for (Element el : element.select("li")) {
			CrawlingVO crawlingVO= new CrawlingVO();
			System.out.println(el.select("dt").text());
			System.out.println(el.select("a").attr("href"));
			
			crawlingVO.setCrawlingTitle(el.select("dt").text());
			crawlingVO.setCrawlingHref(el.select("a").attr("href"));
			crawlingVO.setCrawlingTotal("<a href='" + el.select("a").attr("href") + "'>" + el.select("dt").text() + "</a>");

			crawList.add(crawlingVO);
		}
		int crawSize = crawList.size();

		
//		ProjectVO project = new ProjectVO();
		for (ProjectVO project : projectList) {
			String prnum = project.getPr_num();
			List<LanguageVO> lang= techservice.techList(prnum);
			project.setTechList(lang);
			
			String money = MoneyComma.toNumFormat(Integer.parseInt(project.getPr_payment()));
			project.setPr_payment(money);
		}
		if (session.getAttribute("ADMIN_LOGININFO") != null) {
			session.removeAttribute("ADMIN_LOGININFO");
		}
		
		andView.addObject("crawList", crawList);
		andView.addObject("crawSize", crawSize);
		andView.addObject("totalCount", totalCount);
		andView.addObject("countPay", countPay);
		andView.addObject("countMember", countMember);
		andView.addObject("projectList", projectList);
		andView.setViewName("user/main/index");
		
		return andView;
	}
	
	@RequestMapping("admin")
	public ModelAndView stProjectList(ModelAndView andView, Map<String, String> params
			, HttpSession session) throws Exception{
		List<ProjectVO> stbyProList = projectService.stbyProList();
		List<ProjectVO> projectingList = projectService.projectingList();
		
		for (ProjectVO project : stbyProList) {
			String money = MoneyComma.toNumFormat(Integer.parseInt(project.getPr_payment()));
			project.setPr_payment(money);
		}
		
		for (ProjectVO project : projectingList) {
			String money = MoneyComma.toNumFormat(Integer.parseInt(project.getPr_payment()));
			project.setPr_payment(money);
		}
		if (session.getAttribute("USER_LOGININFO") != null) {
			session.removeAttribute("USER_LOGININFO");
		}
		
		andView.addObject("stbyProList",stbyProList);
		andView.addObject("projectingList", projectingList);
		andView.setViewName("admin/main/index");
		
		return andView;
	}
	@ResponseBody
	@RequestMapping("crawling")
	public ModelAndView crawling(ModelAndView andView) throws IOException{
		String url = "https://news.naver.com/main/list.nhn?mode=LS2D&mid=shm&sid1=105&sid2=230";
		System.out.println("=======================================");
		System.out.println("url : " + url);
		
		Document doc = Jsoup.connect(url).get();
		
		Elements element = doc.select("div.newsflash_body");
		
		System.out.println("========================================");
		List<CrawlingVO> crawList = new ArrayList<CrawlingVO>(); 
		
		for (Element el : element.select("li")) {
			CrawlingVO crawlingVO= new CrawlingVO();
			System.out.println(el.select("dt").text());
			System.out.println(el.select("a").attr("href"));
			
			crawlingVO.setCrawlingTitle(el.select("dt").text());
			crawlingVO.setCrawlingHref(el.select("a").attr("href"));
			crawlingVO.setCrawlingTotal("<a href='" + el.select("a").attr("href") + "'>" + el.select("dt").text() + "</a>");
			crawList.add(crawlingVO);
		}
		int crawSize = crawList.size();
		
		andView.addObject("crawList",crawList);
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	
}
