package com.kh.dduck.review.service;

import java.util.List;
import java.util.Map;

import com.kh.dduck.adminboard.model.vo.SaleBoardFile;
import com.kh.dduck.review.model.vo.Review;


public interface ReviewService {
	
	
	List<Map<String,String>> selectReviewList(int cPage,int numPerPage,int pCode);
	int selectReviewCount(int pCode);
	int insertReview(Review r);
	int deleteReview(Review r);
	int updateReview(Review r);
	Map<String,Object> selectSale(int pCode);
	List<SaleBoardFile> selectAttachList(int pCode);
	List<Map<String,Object>> selectPayment(int pCode);
}
