package kr.or.ddit.frMyProject.dao;

import java.util.Map;

import kr.or.ddit.vo.Free_TypeVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository("free_typeDao")
public class Free_typeDaoImpl implements Free_typeDao{
	@Autowired
	SqlMapClient client;

	@Override
	public Free_TypeVO typeStatus(Map<String, String> params) throws Exception {
		return (Free_TypeVO) client.queryForObject("free_type.typeStatus", params);
	}
}
