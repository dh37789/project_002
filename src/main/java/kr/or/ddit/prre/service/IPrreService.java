package kr.or.ddit.prre.service;

import java.util.List;
import java.util.Map;



import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.Project_reply;

public interface IPrreService {
	public List<Project_reply> prreList(Map<String,String> params)throws Exception;
	
	
	public void insertPrre(Project_reply Prre) throws Exception;
	
	public void updatePrre(Project_reply Prre) throws Exception;
	
	public void deletePrre(String param) throws Exception;
	
	public int totalCount(Map<String,String> params)throws Exception;

	public void insertPrreReply(Project_reply Prre)throws Exception;

}
