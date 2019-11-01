package com.kh.dduck.qna.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.dduck.qna.model.vo.Qna;
import com.kh.dduck.qna.model.vo.QnaComment;

public interface QnaDao {

	/* Qna List */
	List<Map<String, String>> selectQnaList(SqlSessionTemplate session, int cPage, int numPerPage);
	int selectQnaCount(SqlSessionTemplate session);
	
	/* qna View */
	Map<String, String> selectQna(SqlSessionTemplate session, int qaCode);
	Map<String, String> selectQnaComment(SqlSessionTemplate session, int qaCode);
	
	/* qna comment insert */
	int insertQnaComment(SqlSessionTemplate session, QnaComment q);
	
	/* qna comment delete */
	int qnaCommentDelete(SqlSessionTemplate session, QnaComment qm);
	
	/* qna comment update(수정) */
	int qnaCommentUpdate(SqlSessionTemplate session, QnaComment qm);
	
	/* qna 등록 */
	int insertQna(SqlSessionTemplate session, Qna qna);
	
	/* qna update */
	int qnaUpdateFormEnd(SqlSessionTemplate session, Qna qna);
	
	/* qna delete */
	int qnaDelete(SqlSessionTemplate session,Qna qna);
}
