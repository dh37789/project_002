package kr.or.ddit.frMyProject.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.CategoryVO;
import kr.or.ddit.vo.Free_TypeVO;

public interface CategoryService {
	/**
	 * 카테고리의 상태값을 가져온다.
	 * @param params
	 * @return
	 * @throws Exception
	 */
	CategoryVO categoryStatus(Map<String, String> params) throws Exception;
	/**
	 * 카테고리 값을 가져오되 ftype과 조인해서 한글 값으로 가져온다.
	 * @param params
	 * @return
	 * @throws Exception
	 */
	CategoryVO selectCategory(Map<String, String> params) throws Exception;
	/**
	 * 카테고리를 가져온다
	 * @param params
	 * @return
	 */
	CategoryVO cateInfo(Map<String, String> params) throws Exception;
	/**
	 * 카테고리 select에 넣을 값을 가져온다.
	 * @return
	 * @throws Exception
	 */
	List<Free_TypeVO> category() throws Exception;
	/**
	 * 세부 카테고리 select에 넣을 값을 가져온다.
	 * @param ftype_num
	 * @return
	 * @throws Exception
	 */
	List<Map<String,String>> detail(String ftype_num) throws Exception;

}
