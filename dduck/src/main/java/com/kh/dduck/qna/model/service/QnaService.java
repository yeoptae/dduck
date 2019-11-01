package com.kh.dduck.qna.model.service;

import java.util.List;
import java.util.Map;

import com.kh.dduck.qna.model.vo.Qna;
import com.kh.dduck.qna.model.vo.QnaComment;

public interface QnaService {

	/* Qna List */
	int selectQnaCount();
	List<Map<String,String>> selectQnaList(int cPage,int numPerpage);
	
	/* qna View */
	Map<String, String> selectQna(int qnCode);
	Map<String, String> selectQnaComment(int qaCode);
	
	/* qna comment insert */
	int insertQnaComment(QnaComment q);
	
	/* qna comment delete */
	int qnaCommentDelete(QnaComment qm);
	
	/* qna comment update(수정) */
	int qnaCommentUpdate(QnaComment qm);
	
	/* qna delete */
	int qnaDelete(Qna qna);
	
	/* qna 등록 */
	int insertQna(Qna qna);
	
	/* qna update */
	int qnaUpdateFormEnd(Qna qna);
}
