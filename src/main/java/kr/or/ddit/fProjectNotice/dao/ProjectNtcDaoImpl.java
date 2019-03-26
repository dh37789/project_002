package kr.or.ddit.fProjectNotice.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.utils.AttacheFileMapper;
import kr.or.ddit.vo.FileItemVO;
import kr.or.ddit.vo.Project_noticeVO;
import kr.or.ddit.vo.Project_notice_fileVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository("projectNtcDao")
public class ProjectNtcDaoImpl implements ProjectNtcDao{
	@Autowired
	private SqlMapClient client;
	@Autowired
	private AttacheFileMapper mapper;
	@Autowired
	private ProjectNtcFileDao itemDao;
	
	@Override
	public List<Project_noticeVO> boardList(Map<String, String> params)
			throws Exception {
		return (List<Project_noticeVO>) client.queryForList("project_notice.boardList", params);
	}

	@Override
	public void insertNtc(Project_noticeVO boardInfo) throws Exception {
		String prno_num = (String) client.insert("project_notice.insertNtc", boardInfo);
		if (!boardInfo.getNtcFile().getOriginalFilename().equals("")) {
			FileItemVO item = mapper.mapping(boardInfo.getNtcFile(), prno_num);
			Project_notice_fileVO file = new Project_notice_fileVO();
			file.setPrno_num(prno_num);
			file.setPrno_size(item.getFile_size());
			file.setPrnofile_name(item.getFile_name());
			file.setPrnofile_save_name(item.getFile_save_name());
			file.setPrnofile_type(item.getFile_content_type());
			itemDao.insertNtcFile(file);
		}
	}

	@Override
	public Project_noticeVO boardInfo(Map<String, String> params)
			throws Exception {
		return (Project_noticeVO) client.queryForObject("project_notice.boardInfo", params);
	}

	@Override
	public void deleteNtc(Map<String, String> params) throws Exception {
		client.update("project_notice.deleteNtc", params);
	}

	@Override
	public void updateNtc(Project_noticeVO boardInfo) throws Exception {
		client.update("project_notice.updateNtc", boardInfo);
		String prno_num = boardInfo.getPrno_num();
		if (!boardInfo.getNtcFile().getOriginalFilename().equals("")) {
			FileItemVO item = mapper.mapping(boardInfo.getNtcFile(), prno_num);
			Project_notice_fileVO file = new Project_notice_fileVO();
			System.out.println(boardInfo.getNtcFile().getName());
			file.setPrno_num(prno_num);
			file.setPrno_size(item.getFile_size());
			file.setPrnofile_name(item.getFile_name());
			file.setPrnofile_save_name(item.getFile_save_name());
			file.setPrnofile_type(item.getFile_content_type());
			itemDao.insertNtcFile(file);
		}
	}

	@Override
	public int boardCount(Map<String, String> params) throws Exception {
		return (int) client.queryForObject("project_notice.boardCount", params);
	}

}
