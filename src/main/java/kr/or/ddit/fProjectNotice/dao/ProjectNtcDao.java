package kr.or.ddit.fProjectNotice.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.Project_noticeVO;

public interface ProjectNtcDao {

	List<Project_noticeVO> boardList(Map<String, String> params) throws Exception;

	void insertNtc(Project_noticeVO boardInfo) throws Exception;

	Project_noticeVO boardInfo(Map<String, String> params) throws Exception;

	void deleteNtc(Map<String, String> params) throws Exception;

	void updateNtc(Project_noticeVO boardInfo) throws Exception;

	int boardCount(Map<String, String> params) throws Exception;

}
