package com.test.project01.review.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.test.project01.review.dto.ReviewCommentDto;
import com.test.project01.review.dto.ReviewDto;

public interface ReviewService {
	public void list(HttpServletRequest request);
	public void list2(HttpServletRequest request);
	public void insertform(HttpServletRequest request);
	public void insert(HttpServletRequest request,ReviewDto dto);
	public void getReviewData(HttpServletRequest request);
	public void getUpdateData(ModelAndView mView,int reviewNum);
	public void update(HttpServletRequest request,ReviewDto dto);
	public void delete(HttpServletRequest request,int reviewNum);
	public void deleteComment(int num);
	public void saveComment(HttpServletRequest request);
	public void updateComment(ReviewCommentDto dto);
	
}
