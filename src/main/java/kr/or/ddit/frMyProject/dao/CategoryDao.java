package kr.or.ddit.frMyProject.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.CategoryVO;
import kr.or.ddit.vo.Free_TypeVO;

public interface CategoryDao {

	CategoryVO categoryStatus(Map<String, String> params) throws Exception ;
	CategoryVO selectCategory(Map<String, String> params) throws Exception ;
	CategoryVO cateInfo(Map<String, String> params) throws Exception ;

	List<Free_TypeVO> category() throws Exception;
	List<Map<String,String>> detail(String ftype_num) throws Exception;
}
