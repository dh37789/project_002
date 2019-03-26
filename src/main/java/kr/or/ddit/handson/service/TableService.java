package kr.or.ddit.handson.service;

import java.util.Map;

import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.vo.Table_dataVO;

public interface TableService {

	Table_dataVO requestInfo(Map<String, String> params) throws Exception;

	void insertTable(Table_dataVO tableInfo) throws Exception;

	void updateTable(Table_dataVO tableInfo) throws Exception;

}
