package kr.or.ddit.notice.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.utils.AttacheFileMapper;
import kr.or.ddit.vo.FileItemVO;
import kr.or.ddit.vo.NoticeVO;
import kr.or.ddit.vo.Notice_fileVO;
import kr.or.ddit.vo.Project_notice_fileVO;
@Repository("NoticeDao")
public class INoticeDaoImpl implements INoticeDao{
	@Autowired
	private SqlMapClient client;
	@Autowired
	private AttacheFileMapper mapper;
	@Autowired
	private INoticeFileDao itemDao;
	
	@Override
	public List<NoticeVO> noticeList(Map<String, String> params)
			throws Exception {
		return client.queryForList("notice.noticeList",params);
	}

	@Override
	public NoticeVO noticeView(Map<String, String> param) throws Exception {
		return (NoticeVO)client.queryForObject("notice.noticeView",param);
	}

	@Override
	public void insertNotice(NoticeVO notice) throws Exception {
		String no_num= (String)client.insert("notice.insertNotice",notice);
		if (!notice.getFile().getOriginalFilename().equals("")) {
			FileItemVO item = mapper.mapping(notice.getFile(), no_num);
			Notice_fileVO file = new Notice_fileVO();
			System.out.println(notice.getFile().getName());
			file.setNofile_noti_num(no_num);
			file.setNofile_size(item.getFile_size());
			file.setNofile_name(item.getFile_name());
			file.setNofile_save_name(item.getFile_save_name());
			file.setNofile_type(item.getFile_content_type());
			itemDao.insertFile(file);
		}
	}

	@Override
	public void updateNotice(NoticeVO notice) throws Exception {
		client.update("notice.updateNotice", notice);
		String no_num = notice.getNo_num();
		if ((!(notice.getFile() == null))&&!notice.getFile().getOriginalFilename().equals("")) {
			FileItemVO item = mapper.mapping(notice.getFile(), no_num);
			Notice_fileVO file = new Notice_fileVO();
			System.out.println(notice.getFile().getName());
			file.setNofile_noti_num(no_num);
			file.setNofile_size(item.getFile_size());
			file.setNofile_name(item.getFile_name());
			file.setNofile_save_name(item.getFile_save_name());
			file.setNofile_type(item.getFile_content_type());
			itemDao.insertFile(file);
		}
	}

	@Override
	public void deleteNotice(String param) throws Exception {
		client.update("notice.deleteNotice",param);
	}

	@Override
	public void noticeHit(Map<String, String> param) throws Exception {
		client.update("notice.noticeHit",param);		
	}

	@Override
	public int totalCount(Map<String, String> params) throws Exception {
		return (int)client.queryForObject("notice.totalCount",params);
	}

}
