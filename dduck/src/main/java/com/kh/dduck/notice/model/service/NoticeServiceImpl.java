package com.kh.dduck.notice.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dduck.notice.model.dao.NoticeDao;
import com.kh.dduck.notice.model.vo.NoticeFile;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	NoticeDao dao;
	@Autowired
	SqlSessionTemplate session;
	
	/* notice view 페이징처리 */
	//리스트 불러오기
	@Override
	public List<Map<String, String>> selectNoticeList(int cPage, int numPerpage) {
		return dao.selectNoticeList(session,cPage,numPerpage);
	}
	//전체 글 수 조회
	@Override
	public int selectNoticeCount() {
		return dao.selectNoticeCount(session);
	}
	
	/* notiveFormEnd 게시글, 첨부 파일 등록 */
	@Override
	public int insertNotice(Map<String, String> param, List<NoticeFile> NoticeFileList) throws Exception {
		int result=0;
		result=dao.insertNotice(session,param);//notice테이블에 데이터 입력
		if(result==0) throw new RuntimeException();
		if(NoticeFileList.size()>0) {
			for(NoticeFile nfl : NoticeFileList) {
				nfl.setNoticeCode(Integer.parseInt(param.get("noticeCode")));
				result=dao.insertNoticeFile(session,nfl);
				if(result==0) throw new Exception();
			}
		}
		
		return result;
	}
	
	/* notice view 연결 */
	@Override
	public Map<String, String> selectNotice(int noticeCode) {
		return dao.selectNotice(session, noticeCode);
	}
	@Override
	public List<NoticeFile> selectNoticeFileList(int noticeCode) {
		return dao.selectNoticeFileList(session,noticeCode);
	}
	
}
