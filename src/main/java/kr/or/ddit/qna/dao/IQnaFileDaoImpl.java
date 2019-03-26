package kr.or.ddit.qna.dao;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.Qna_fileVO;

@Repository("QnaFileDao")
public class IQnaFileDaoImpl implements IQnaFileDao {
	@Autowired
	private SqlMapClient client;
	
	@Override
	public void insertFile(Qna_fileVO file) throws Exception {
		client.insert("qna_file.insertFile",file);
	}

	@Override
	public Qna_fileVO FileInfo(Map<String, String> param)
			throws Exception {
		return (Qna_fileVO) client.queryForObject("qna_file.FileInfo", param);
		
	}

	@Override
	public int deleteFile(Map<String, String> params) throws Exception {
		return client.update("qna_file.deleteFile", params);
	}

}
