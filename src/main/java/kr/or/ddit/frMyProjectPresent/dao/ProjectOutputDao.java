package kr.or.ddit.frMyProjectPresent.dao;

import java.util.Map;

import kr.or.ddit.vo.Project_outputVO;

public interface ProjectOutputDao {

	void requestFile(Project_outputVO file) throws Exception;

	Project_outputVO fileInfo(Map<String, String> params) throws Exception;

	void deleteFile(Map<String, String> params) throws Exception;

	Project_outputVO downloadFile(Map<String, String> params) throws Exception;

}
