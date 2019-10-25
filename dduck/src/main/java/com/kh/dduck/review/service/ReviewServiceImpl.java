package com.kh.dduck.review.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dduck.review.model.dao.ReviewDao;
import com.kh.dduck.review.model.vo.Review;
import com.sun.javafx.collections.MappingChange.Map;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	ReviewDao dao;
	
	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public List<Map<String, String>> selectReviewList(int cPage, int numPerPage) {
		
		return dao.selectReviewList(session,cPage,numPerPage);
	}

	@Override
	public int selectReviewCount() {
		
		return dao.selectReviewCount(session);
	}

	@Override
	public int insertReview(Review r) {
		
		return dao.insertReview(session, r);
	}

	@Override
	public int deleteReview(Review r) {
		
		return dao.deleteReview(session,r);
	}

	@Override
	public int updateReview(Review r) {
		
		return dao.updateReview(session, r);
	}
	
	
	
	
}
