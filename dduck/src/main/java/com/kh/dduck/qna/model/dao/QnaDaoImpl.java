package com.kh.dduck.qna.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.dduck.qna.model.vo.Qna;
import com.kh.dduck.qna.model.vo.QnaComment;

@Repository
public class QnaDaoImpl implements QnaDao {

	
	/* qna List */
	@Override
	public int selectQnaCount(SqlSessionTemplate session) {
		return session.selectOne("qna.selectQnaCount");
	}
	@Override
	public List<Map<String, String>> selectQnaList(SqlSessionTemplate session, int cPage, int numPerPage) {
		RowBounds rows=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("qna.selectQnaList",null,rows);
	}
	
	/* qna View */
	@Override
	public Map<String, String> selectQna(SqlSessionTemplate session, int qaCode) {
		return session.selectOne("qna.selectQna",qaCode);
	}
	@Override
	public Map<String, String> selectQnaComment(SqlSessionTemplate session, int qaCode) {
		return session.selectOne("qna.selectQnaComment",qaCode);
	}
	
	/* qna comment insert */
	@Override
	public int insertQnaComment(SqlSessionTemplate session, QnaComment q) {
		return session.insert("qna.insertQnaComment",q);
	}
	
	/* qna comment delete */
	@Override
	public int qnaCommentDelete(SqlSessionTemplate session, QnaComment qm) {
		return session.delete("qna.qnaCommentDelete",qm);
	}
	
	/* qna comment update(수정) */
	@Override
	public int qnaCommentUpdate(SqlSessionTemplate session, QnaComment qm) {
		return session.update("qna.qnaCommentUpdate",qm);
	}
	
	/* qna 등록 */
	@Override
	public int insertQna(SqlSessionTemplate session, Qna qna) {
		return session.insert("qna.insertQna",qna);
	}
	
	/* qna update */
	@Override
	public int qnaUpdateFormEnd(SqlSessionTemplate session, Qna qna) {
		return session.update("qna.qnaUpdateFormEnd",qna);
	}
	
	/* qna delete */
	@Override
	public int qnaDelete(SqlSessionTemplate session, Qna qna) {
		return session.delete("qna.qnaDelete", qna);
	}
}
