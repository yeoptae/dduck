package com.kh.dduck.review.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.dduck.review.model.vo.Review;
import com.sun.javafx.collections.MappingChange.Map;

@Repository
public class ReviewDaoImpl implements ReviewDao {

	@Override
	public List<Map<String, String>> selectReviewList(SqlSessionTemplate session, int cPage, int numPerPage) {
		
		RowBounds rows = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("review.selectReviewList",null,rows);
	}

	@Override
	public int selectReviewCount(SqlSessionTemplate session) {
		
		return session.selectOne("review.selectReviewCount");
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
	
	
	
	
}
