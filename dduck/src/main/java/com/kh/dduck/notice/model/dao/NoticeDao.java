package com.kh.dduck.notice.model.dao;

import java.util.List;
import java.util.Map;import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;

import com.kh.dduck.notice.model.vo.Notice;
import com.kh.dduck.notice.model.vo.NoticeFile;

public interface NoticeDao {
	
	/* notice view 페이징처리 */
	List<Map<String,String>> selectNoticeList(SqlSessionTemplate session, int cPage, int numPerPage);
	int selectNoticeCount(SqlSessionTemplate session);
	
	/* notiveFormEnd 게시글/첨부파일 등록 */
	int insertNotice(SqlSessionTemplate session, Map<String,String> param);
	int insertNoticeFile(SqlSessionTemplate session, NoticeFile ntf);
	
	/* notice view 연결 */
	Map<String, String> selectNotice(SqlSessionTemplate session, int noticeCode);
	List<NoticeFile> selectNoticeFileList(SqlSessionTemplate session, int noticeCode);
	
	/* 게시글 삭제 */
	int selectNoticeCode(SqlSessionTemplate session, int noticeCode);
	
	/* notice delete */
	int noticeDelete(SqlSessionTemplate session, int noticeCode);
	
	/* notice update */
	int deleteNoticeFile(SqlSessionTemplate session, int noticeCode);
	int updateNotice(SqlSessionTemplate session, Notice n);

}
