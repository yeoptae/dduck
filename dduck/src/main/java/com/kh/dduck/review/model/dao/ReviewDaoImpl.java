package com.kh.dduck.review.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.dduck.adminboard.model.vo.SaleBoardFile;
import com.kh.dduck.review.model.vo.Review;


@Repository
public class ReviewDaoImpl implements ReviewDao {

	@Override
	public List<Map<String, String>> selectReviewList(SqlSessionTemplate session, int cPage, int numPerPage, int pCode) {
		
		RowBounds rows = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("review.selectReviewList",pCode,rows);
	}

	@Override
	public int selectReviewCount(SqlSessionTemplate session,int pCode) {
		
		return session.selectOne("review.selectReviewCount",pCode);
	}

	@Override
	public int insertReview(SqlSessionTemplate session, Review r) {
		
		return session.insert("review.insertReview",r);
	}

	@Override
	public int deleteReview(SqlSessionTemplate session, Review r) {
		
		return session.delete("review.deleteReview",r);
	}

	@Override
	public int updateReview(SqlSessionTemplate session, Review r) {
		
		return session.update("review.updateReview",r);
	}

	@Override
	public Map<String, Object> selectSale(SqlSessionTemplate session, int pCode) {
		
		return session.selectOne("review.selectSale",pCode);
	}

	@Override
	public List<SaleBoardFile> selectAttachList(SqlSessionTemplate session, int pCode) {

		return session.selectList("review.selectAttachList",pCode);
	}

	
	
	
	
}
