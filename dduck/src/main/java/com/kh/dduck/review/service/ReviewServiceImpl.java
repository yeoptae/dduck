package com.kh.dduck.review.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dduck.adminboard.model.vo.SaleBoardFile;
import com.kh.dduck.review.model.dao.ReviewDao;
import com.kh.dduck.review.model.vo.Review;


@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	ReviewDao dao;
	
	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public List<Map<String, String>> selectReviewList(int cPage, int numPerPage,int pCode) {
		
		return dao.selectReviewList(session,cPage,numPerPage,pCode);
	}

	@Override
	public int selectReviewCount(int pCode) {
		
		return dao.selectReviewCount(session,pCode);
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

	@Override
	public Map<String, Object> selectSale(int pCode) {
		
		return dao.selectSale(session, pCode);
	}

	@Override
	public List<SaleBoardFile> selectAttachList(int pCode) {
		
		return dao.selectAttachList(session,pCode);
	}

	
	
	
	
	
}
