package kr.or.ddit.findInfo.service;

import java.util.Map;

import kr.or.ddit.vo.MemberVO;

public interface FindInfoService {
	
	public MemberVO findInfo(Map<String, String> params) throws Exception;
	
	public void randomPass(Map<String, String> params) throws Exception;
}
