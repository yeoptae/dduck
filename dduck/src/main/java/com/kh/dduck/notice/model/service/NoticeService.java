package com.kh.dduck.notice.model.service;

import java.util.List;
import java.util.Map;

import com.kh.dduck.notice.model.vo.NoticeFile;

public interface NoticeService {

	/* notice view 페이징처리 */
	int selectNoticeCount();
	List<Map<String,String>> selectNoticeList(int cPage,int numPerpage);
	
	/* notiveFormEnd 게시글 등록 */
	int insertNotice(Map<String, String> param,List<NoticeFile> NoticeFileList) throws Exception;
	
	/* notice view 연결 */
	Map<String,String> selectNotice(int noticeCode);
	List<NoticeFile> selectNoticeFileList(int noticeCode);
	
	/* notice delete */
	int noticeDelete(int noticeCode);
	
	/* notice update */
	int updateNotice(Map<String, String> param,List<NoticeFile> NoticeFileList) throws Exception;
	
}