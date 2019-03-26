package kr.or.ddit.frMyProject.service;

import java.util.Map;

import kr.or.ddit.vo.Free_TypeVO;

public interface Free_typeService {
	/**
	 * 프리랜서 타입을 확인한다 (0. 개발, 1. 디자인)
	 * @param params
	 * @return
	 * @throws Exception
	 */
	Free_TypeVO typeStatus(Map<String, String> params) throws Exception;

}
