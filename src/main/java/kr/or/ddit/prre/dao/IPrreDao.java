package kr.or.ddit.prre.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.Project_reply;

public interface IPrreDao {
	public List<Project_reply> PrreList(Map<String,String> params)throws Exception;
	
	public void insertPrre(Project_reply Prre) throws Exception;
	
	public void updatePrre(Project_reply Prre) throws Exception;
	
	public void deletePrre(String param) throws Exception;

	public int totalCount(Map<String,String> params)throws Exception;

	public void insertPrreReply(Project_reply Prre) throws Exception;

}
