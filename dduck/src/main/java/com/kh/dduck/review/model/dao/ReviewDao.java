package com.kh.dduck.review.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.dduck.adminboard.model.vo.SaleBoardFile;
import com.kh.dduck.payment.model.vo.Payment;
import com.kh.dduck.review.model.vo.Review;

public interface ReviewDao {
	
	List<Map<String,String>> selectReviewList(SqlSessionTemplate session,int cPage,int numPerPage,int pCode);
	int selectReviewCount(SqlSessionTemplate session, int pCode);

	int insertReview(SqlSessionTemplate session, Review r);
	int deleteReview(SqlSessionTemplate session, Review r);
	int updateReview(SqlSessionTemplate session, Review r);
	Map<String,Object> selectSale(SqlSessionTemplate session, int pCode);
	List<SaleBoardFile> selectAttachList(SqlSessionTemplate session, int pCode);
	int selectReviewCount1(SqlSessionTemplate session, Payment p);
}
