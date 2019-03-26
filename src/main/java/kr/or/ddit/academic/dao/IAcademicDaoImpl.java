package kr.or.ddit.academic.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.AcademicVO;

@Repository("academicDao")
public class IAcademicDaoImpl implements IAcademicDao{
	@Autowired
	private SqlMapClient client;
	
	@Override
	public List<AcademicVO> academicList(Map<String, String> mem_id)
			throws Exception {
		return client.queryForList("academic.academicList", mem_id);
	}

	@Override
	public int updateAcademic(AcademicVO academicVO) throws Exception {
		return client.update("academic.updateAcademic", academicVO);
	}

	@Override
	public int insertAcademic(AcademicVO academicVO) throws Exception {
		int cnt = 0;
		String key = (String) client.insert("academic.insertAcademic", academicVO);
		if (key != null) {
			cnt = 1;
		}
		return cnt;
	}

	@Override
	public int deleteAcademic(Map<String, String> param) throws Exception {
		return client.delete("academic.deleteAcademic", param);
	}

	@Override
	public List<AcademicVO> academicCheck(Map<String, String> mem_id)
			throws Exception {
		return client.queryForList("academic.academicCheck", mem_id);
	}

	@Override
	public AcademicVO academicInfo(Map<String, String> param) throws Exception {
		return (AcademicVO) client.queryForObject("academic.academicInfo", param);
	}

}
