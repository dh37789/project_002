package kr.or.ddit.adStats.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ProjectVO;


public interface IStatsService {
	
	public Map<String, String> totalSales() throws Exception;	
	
	public Map<String, String> pureSales() throws Exception;
	
	public Map<String, String> categoryList() throws Exception;
	
	public Map<String, String> pjCondition() throws Exception;
	
	public Map<String, String> pjCategory() throws Exception;
	
	public Map<String, String> pjRegion() throws Exception;

	public List<Map<String, String>> projectCnt() throws Exception;
	
	public List<Map<String, String>> projectPayment() throws Exception;
	
	public List<Map<String, String>> freeJoinProject() throws Exception;
	
	public List<Map<String, String>> freeSalary() throws Exception;
	
}
