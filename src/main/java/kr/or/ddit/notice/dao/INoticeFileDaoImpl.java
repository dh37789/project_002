package kr.or.ddit.notice.dao;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.Notice_fileVO;
import kr.or.ddit.vo.Project_notice_fileVO;

@Repository("NoticeFileDao")
public class INoticeFileDaoImpl implements INoticeFileDao {
	@Autowired
	private SqlMapClient client;
	
	@Override
	public void insertFile(Notice_fileVO file) throws Exception {
		client.insert("notice_file.insertFile",file);
	}

	@Override
	public Notice_fileVO FileInfo(Map<String, String> param)
			throws Exception {
		return (Notice_fileVO) client.queryForObject("notice_file.FileInfo", param);
		
	}

	@Override
	public int deleteFile(Map<String, String> params) throws Exception {
		return client.update("notice_file.deleteFile", params);
	}

}
