package kr.or.ddit.carrer.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.CareerVO;

@Repository("careerDao")
public class ICareerDaoImpl implements ICareerDao{
	@Autowired
	private SqlMapClient client;
	
	@Override
	public List<CareerVO> careerList(Map<String, String> mem_id) throws Exception {
		return client.queryForList("career.careerList", mem_id);
	}

	@Override
	public int updateCareer(CareerVO careerVO) throws Exception {
		return client.update("career.updateCareer", careerVO);
	}

	@Override
	public int insertCareer(CareerVO careerVO) throws Exception {
		int cnt = 0;
		String key = (String) client.insert("career.insertCareer", careerVO);
		if (key != null) {
			cnt = 1;
		}
		return cnt;
	}

	@Override
	public int deleteCareer(Map<String, String> param) throws Exception {
		return client.delete("career.deleteCareer", param);
	}

	@Override
	public List<CareerVO> careerCheck(Map<String, String> mem_id)
			throws Exception {
		return client.queryForList("career.careerCheck", mem_id);
	}

	@Override
	public CareerVO careerInfo(Map<String, String> param) throws Exception {
		return (CareerVO) client.queryForObject("career.careerInfo", param);
	}

}
