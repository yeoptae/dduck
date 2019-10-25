package com.kh.dduck.review.service;

import java.util.List;

import com.kh.dduck.review.model.vo.Review;
import com.sun.javafx.collections.MappingChange.Map;

public interface ReviewService {
	
	
	List<Map<String,String>> selectReviewList(int cPage,int numPerPage);
	int selectReviewCount();
	int insertReview(Review r);
	int deleteReview(Review r);
	int updateReview(Review r);
}
