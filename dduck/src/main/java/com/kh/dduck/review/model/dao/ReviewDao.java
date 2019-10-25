package com.kh.dduck.review.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.dduck.review.model.vo.Review;
import com.sun.javafx.collections.MappingChange.Map;

public interface ReviewDao {
	
	List<Map<String,String>> selectReviewList(SqlSessionTemplate session,int cPage,int numPerPage);
	int selectReviewCount(SqlSessionTemplate session);

	int insertReview(SqlSessionTemplate session, Review r);
	int deleteReview(SqlSessionTemplate session, Review r);
	int updateReview(SqlSessionTemplate session, Review r);
}
