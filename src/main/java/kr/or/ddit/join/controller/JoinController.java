package kr.or.ddit.join.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.member.service.IMemberIdenService;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.IMemberStatusService;
import kr.or.ddit.project.service.ProjectService;
import kr.or.ddit.utils.CryptoGenerator;
import kr.or.ddit.utils.MoneyComma;
import kr.or.ddit.vo.MemberVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.social.connect.Connection;
import org.springframework.social.google.api.Google;
import org.springframework.social.google.api.impl.GoogleTemplate;
import org.springframework.social.google.api.plus.Person;
import org.springframework.social.google.api.plus.PlusOperations;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/join/")
public class JoinController {

	@Autowired
	private IMemberService memberService;
	
	@Autowired
	private IMemberIdenService memberIdenService;

	@Autowired
	private IMemberStatusService memberStatusService;
	
	@Autowired
	private CryptoGenerator cryptoGen;
	
	@Autowired
	private GoogleConnectionFactory googleConnectionFactory;
	
	@Autowired
	private OAuth2Parameters googleOAuth2Parameters;
	
	private OAuth2Operations oauthOperations;
	
	@Autowired
	private MessageSourceAccessor messageAccessor;
	
	@Autowired
	private ProjectService projectService;
	
	@RequestMapping("loginForm")
	public ModelAndView loginForm(ModelAndView andView,
			HttpSession session){
		
		oauthOperations = googleConnectionFactory.getOAuthOperations();
		String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
		
		andView.addObject("google_url", url);
		andView.addObject("publicKeyMap", cryptoGen.getGeneratePairKey(session));
		
		return andView;
	}
	
	@RequestMapping("loginCheck")
	public String loginCheck(Map<String, String> params, Map<String, String> paramiden, Map<String, String> paramStatus, String mem_id, String mem_pass, HttpSession session,
							HttpServletRequest request, HttpServletResponse response) throws Exception{

		mem_id = CryptoGenerator.decryptRSA(session, mem_id);
		mem_pass = CryptoGenerator.decryptRSA(session, mem_pass);

		params.put("mem_id", mem_id);
		params.put("mem_pass", mem_pass);
		
		
		MemberVO memberInfo = memberService.memberInfo(params);
		
		if(memberInfo == null){
			String message = "";
			try {
				message = URLEncoder.encode(this.messageAccessor.getMessage("fail.common.join", Locale.KOREA), "UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			return "redirect:/join/loginForm.do?message=" + message;
		}
		paramiden.put("iden_num", memberInfo.getIden_num());
		String iden = memberIdenService.memberIden(paramiden);
		paramStatus.put("status_num", memberInfo.getStatus_num());
		String status = memberStatusService.memStatus(paramStatus);
			
		if(status.equals("탈퇴 신청")){
			String message = "";
			try {
				message = URLEncoder.encode(this.messageAccessor.getMessage("fail.common.join", Locale.KOREA), "UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			return "redirect:/join/loginForm.do?message=" + message;
		}else if(status.equals("블랙리스트")){
			String message = "";
			try {
				message = URLEncoder.encode(this.messageAccessor.getMessage("cop.member.black", Locale.KOREA), "UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			return "redirect:/join/loginForm.do?message=" + message;
		}else if(status.equals("탈퇴")){
			String message = "";
			try {
				message = URLEncoder.encode(this.messageAccessor.getMessage("cop.member.out", Locale.KOREA), "UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			return "redirect:/join/loginForm.do?message=" + message;
		}else if(iden.equals("관리자")){
			session.setAttribute("ADMIN_LOGININFO", memberInfo);
			return "forward:/main/admin.do";
			
		}else if(iden.equals("클라이언트")){
			List<Map<String,Object>> projectList =projectService.chatClientProjectList(params);
			params.put("client", mem_id);
			int endPro = projectService.endCount(params);
			int proing = projectService.proing(params);
			int tempMoney = projectService.proMoney(params);
			String proMoney = MoneyComma.toNumFormat(tempMoney);
			session.setAttribute("proing", proing);
			session.setAttribute("proMoney", proMoney);
			session.setAttribute("endPro", endPro);
			session.setAttribute("PROJECTLIST", projectList);
			session.setAttribute("USER_LOGININFO", memberInfo);
			return "forward:/main/hello.do";
		}else{
			List<Map<String,Object>> projectList =projectService.chatFreeProjectList(params);
			params.put("cons_free_id", mem_id);
			int frendPro = projectService.frEndCount(params);
			int frproing = projectService.frProing(params);
			int tempMoney = projectService.frProMoney(params);
			String frproMoney = MoneyComma.toNumFormat(tempMoney);
			session.setAttribute("frendPro", frendPro);
			session.setAttribute("frproing", frproing);
			session.setAttribute("frproMoney", frproMoney);
			session.setAttribute("PROJECTLIST", projectList);
			session.setAttribute("USER_LOGININFO", memberInfo);
			return "forward:/main/hello.do";
		}
		
	}
	
	@RequestMapping("logOut")
	public String logout(HttpServletRequest request, HttpSession session) throws Exception{
			session.invalidate();
		return "redirect:/main/hello.do";
	}
	
//	@RequestMapping("callback")
//	  public String googleCallback(ModelAndView andView, String code) throws Exception {
//
//	    System.out.println("Google login success");
//
//	    //저는 성공하면 메인페이지로 리다이렉트합니다.
//	    return "forward:/main/hello.do";
//	    
//	  }
//	@RequestMapping("callback")
//	public String googleCallback(HttpServletRequest request, String code) throws Exception {
//		
//		code = request.getParameter("code");
//		 
//		oauthOperations = googleConnectionFactory.getOAuthOperations();
//        AccessGrant accessGrant = oauthOperations.exchangeForAccess(code, googleOAuth2Parameters.getRedirectUri(),
//                null);
// 
//        String accessToken = accessGrant.getAccessToken();
//        Long expireTime = accessGrant.getExpireTime();
// 
//        if (expireTime != null && expireTime < System.currentTimeMillis()) {
//            accessToken = accessGrant.getRefreshToken();
//            System.out.printf("accessToken is expired. refresh token = {}", accessToken);
// 
//        }
// 
//        Connection<Google> connection = googleConnectionFactory.createConnection(accessGrant);
//        Google google = connection == null ? new GoogleTemplate(accessToken) : connection.getApi();
//        System.out.println(connection);
// 
//        PlusOperations plusOperations = google.plusOperations();
//        Person profile = plusOperations.getGoogleProfile();
//        System.out.println("User Uid : " + profile.getId());
//        System.out.println("User Name : " + profile.getDisplayName());
//        System.out.println("User Email : " + profile.getAccountEmail());
//        System.out.println("User Profile : " + profile.getImageUrl());
//        System.out.println("나와좀 ㅅㅂ");
//        
//        // Access Token 취소
//        try {
//            System.out.println("Closing Token....");
//            String revokeUrl = "https://accounts.google.com/o/oauth2/revoke?token=" + accessToken + "";
//            URL url = new URL(revokeUrl);
//            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
//            conn.setRequestMethod("GET");
//            conn.setDoOutput(true);
// 
//            BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
//            String inputLine;
//            StringBuffer response = new StringBuffer();
//            while ((inputLine = in.readLine()) != null) {
//                response.append(inputLine);
//            }
//            in.close();
//        } catch (Exception e) {
// 
//            e.printStackTrace();
//        }
//		return "redirect:/join/loginForm.do";
//		
//	}
	
	
}
