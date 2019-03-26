package kr.or.ddit.fProjectNotice.dao;

import java.util.Map;

import kr.or.ddit.vo.Project_notice_fileVO;

public interface ProjectNtcFileDao {

	void insertNtcFile(Project_notice_fileVO file) throws Exception;

	Project_notice_fileVO boardFileInfo(Map<String, String> params) throws Exception;

	int deleteFile(Map<String, String> params) throws Exception;

	Project_notice_fileVO fileInfo(Map<String, String> params) throws Exception;

}
