package kr.or.ddit.qna.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.utils.AttacheFileMapper;
import kr.or.ddit.vo.FileItemVO;
import kr.or.ddit.vo.QnaVO;
import kr.or.ddit.vo.Qna_fileVO;
@Repository("QnaDao")
public class IQnaDaoImpl implements IQnaDao{
	@Autowired
	private SqlMapClient client;
	@Autowired
	private AttacheFileMapper mapper;
	@Autowired
	private IQnaFileDao itemDao;
	
	@Override
	public List<QnaVO> qnaList(Map<String, String> params)
			throws Exception {
		return client.queryForList("qna.qnaList",params);
	}

	@Override
	public QnaVO qnaView(Map<String, String> param) throws Exception {
		return (QnaVO)client.queryForObject("qna.qnaView",param);
	}

	@Override
	public void insertQna(QnaVO qna) throws Exception {
		String qa_num= (String)client.insert("qna.insertQna",qna);
		if (!qna.getFile().getOriginalFilename().equals("")) {
			FileItemVO item = mapper.mapping(qna.getFile(), qa_num);
			Qna_fileVO file = new Qna_fileVO();
			System.out.println(qna.getFile().getName());
			file.setQafile_qa_num(qa_num);
			file.setQafile_size(item.getFile_size());
			file.setQafile_name(item.getFile_name());
			file.setQafile_save_name(item.getFile_save_name());
			file.setQafile_type(item.getFile_content_type());
			itemDao.insertFile(file);
		}
	}

	@Override
	public void updateQna(QnaVO Qna) throws Exception {
		client.update("qna.updateQna", Qna);
		String qa_num = Qna.getQa_num();
		if ((!(Qna.getFile() == null))&&!Qna.getFile().getOriginalFilename().equals("")) {
			FileItemVO item = mapper.mapping(Qna.getFile(), qa_num);
			Qna_fileVO file = new Qna_fileVO();
			System.out.println(Qna.getFile().getName());
			file.setQafile_qa_num(qa_num);
			file.setQafile_size(item.getFile_size());
			file.setQafile_name(item.getFile_name());
			file.setQafile_save_name(item.getFile_save_name());
			file.setQafile_type(item.getFile_content_type());
			itemDao.insertFile(file);
		}
	}

	@Override
	public void deleteQna(String param) throws Exception {
		client.update("qna.deleteQna",param);
	}

	@Override
	public void delQna(String param) throws Exception {
		client.update("qna.delQna",param);
	}

	@Override
	public void qnaHit(Map<String, String> param) throws Exception {
		client.update("qna.qnaHit",param);		
	}

	@Override
	public void insertQnaReply(QnaVO qna)
			throws Exception {
		String qa_depth = String.valueOf(Integer.parseInt(qna.getQa_depth()) +1);
		qna.setQa_depth(qa_depth);
		
		client.insert("qna.insertQnaReply", qna);
		
		String qa_num = qna.getQa_num();
		if (!qna.getFile().getOriginalFilename().equals("")) {
			FileItemVO item = mapper.mapping(qna.getFile(), qa_num);
			Qna_fileVO file = new Qna_fileVO();
			System.out.println(qna.getFile().getName());
			file.setQafile_qa_num(qa_num);
			file.setQafile_size(item.getFile_size());
			file.setQafile_name(item.getFile_name());
			file.setQafile_save_name(item.getFile_save_name());
			file.setQafile_type(item.getFile_content_type());
			itemDao.insertFile(file);
		}
	}
	
	@Override
	public int totalCount() throws Exception {
		return (int)client.queryForObject("qna.totalCount");
	}

	@Override
	public void qnaRe(String param) throws Exception {
		client.update("qna.qnaRe",param);
	}

	@Override
	public void qnaReDe(String param) throws Exception {
		client.update("qna.qnaReDe",param);
	}

}
