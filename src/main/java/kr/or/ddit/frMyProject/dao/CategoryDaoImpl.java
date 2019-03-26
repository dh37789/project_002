package kr.or.ddit.frMyProject.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.CategoryVO;
import kr.or.ddit.vo.Free_TypeVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository("CategoryDao")
public class CategoryDaoImpl implements CategoryDao {

	@Autowired
	private SqlMapClient client;
	
	@Override
	public CategoryVO categoryStatus(Map<String, String> params) throws Exception {
		return (CategoryVO) client.queryForObject("category.categoryStatus", params);
	}

	@Override
	public CategoryVO selectCategory(Map<String, String> params)
			throws Exception {
		return (CategoryVO) client.queryForObject("category.selectCategory", params);
	}
	
	@Override
	public List<Free_TypeVO> category() throws Exception {
		return client.queryForList("category.category");
	}

	@Override
	public CategoryVO cateInfo(Map<String, String> params) throws Exception {
		return (CategoryVO) client.queryForObject("category.cateInfo", params);
	}

	@Override
	public List<Map<String,String>> detail(String ftype_num) throws Exception {
		return client.queryForList("category.detail",ftype_num);
	}


}
