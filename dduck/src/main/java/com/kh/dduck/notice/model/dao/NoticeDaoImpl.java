package com.kh.dduck.notice.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.dduck.notice.model.vo.NoticeFile;

@Repository
public class NoticeDaoImpl implements NoticeDao {

	/* notive view 페이징처리 */
	//리스트 불러오기
	@Override
	public List<Map<String, String>> selectNoticeList(SqlSessionTemplate session, int cPage, int numPerPage) {
		RowBounds rows=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("notice.selectNoticeList",null,rows);
	}
	//전체 글 수 조회
	@Override
	public int selectNoticeCount(SqlSessionTemplate session) {
		return session.selectOne("notice.selectNoticeCount");
	}
	
	
	/* notiveFormEnd 게시글 등록 */
	@Override
	//게시글 내용 등록
	public int insertNotice(SqlSessionTemplate session, Map<String, String> param) {
		return session.insert("notice.insertNotice",param);
	}
	//첨부파일 등록
	@Override
	public int insertNoticeFile(SqlSessionTemplate session, NoticeFile ntf) {
		return session.insert("notice.insertNoticeFileList",ntf);
	}
	
	/* notice view 연결 */
	@Override
	public Map<String, String> selectNotice(SqlSessionTemplate session, int noticeCode) {
		return session.selectOne("notice.selectNotice",noticeCode);
	}
	@Override
	public List<NoticeFile> selectNoticeFileList(SqlSessionTemplate session, int noticeCode) {
		return session.selectList("notice.selectNoticeFileList",noticeCode);
	}
}
