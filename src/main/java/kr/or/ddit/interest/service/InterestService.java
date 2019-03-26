package kr.or.ddit.interest.service;

import java.util.List;
import java.util.Map;




import kr.or.ddit.vo.Interest_projectVO;
import kr.or.ddit.vo.Intest_FreelancerVO;

public interface InterestService {
	public String insertProject(Map<String, String> params) throws Exception;

	public String insertFreelancer(Map<String, String> params) throws Exception;

	public int deleteProject(Map<String, String> params) throws Exception;

	public int deleteFreelancer(Map<String, String> params) throws Exception;

	public List<Interest_projectVO> selectProject(Map<String, String> params)
			throws Exception;

	public List<Intest_FreelancerVO> selectFreelancer(Map<String, String> params)
			throws Exception;

	public int checkProject(Map<String, String> params) throws Exception;

	public int checkFreelancer(Map<String, String> params) throws Exception;

	public String selectInpr_num(Map<String, String> params) throws Exception;
	
	public List<Map<String, Object>> freeList(Map<String,String> params) throws Exception;
	
	public int countFree(Map<String,String> params)throws Exception;
}
