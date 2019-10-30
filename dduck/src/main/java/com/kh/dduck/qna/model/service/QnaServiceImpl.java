package com.kh.dduck.qna.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dduck.qna.model.dao.QnaDao;
import com.kh.dduck.qna.model.vo.QnaComment;

@Service
public class QnaServiceImpl implements QnaService {

	@Autowired
	QnaDao dao;
	@Autowired
	SqlSessionTemplate session;
	
	/* Qna List */
	@Override
	public int selectQnaCount() {
		return dao.selectQnaCount(session);
	}
	@Override
	public List<Map<String, String>> selectQnaList(int cPage, int numPerpage) {
		return dao.selectQnaList(session, cPage, numPerpage);
	}
	
	/* qna View */
	@Override
	public Map<String, String> selectQna(int qnCode) {
		return dao.selectQna(session, qnCode);
	}
	@Override
	public Map<String, String> selectQnaComment(int qnCode) {
		return dao.selectQnaComment(session, qnCode);
	}
	
	/* qna comment insert*/
	@Override
	public int insertQnaComment(QnaComment q) {
		return dao.insertQnaComment(session, q);
	}
	
	/* qna comment delete */
	@Override
	public int qnaCommentDelete(QnaComment qm) {
		return dao.qnaCommentDelete(session, qm);
	}
	
	/* qna comment update(수정) */
	@Override
	public int qnaCommentUpdate(QnaComment qm) {
		return dao.qnaCommentUpdate(session,qm);
	}
}
