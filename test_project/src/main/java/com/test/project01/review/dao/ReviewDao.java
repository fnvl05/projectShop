package com.test.project01.review.dao;

import java.util.List;

import com.test.project01.review.dto.ReviewDto;
import com.test.project01.review.dto.ReviewJoinDto;

public interface ReviewDao {
	public int getCount(ReviewJoinDto dto);
	public List<ReviewJoinDto> getList(ReviewJoinDto dto);
	public int getCount2(ReviewJoinDto dto);
	public List<ReviewJoinDto> getList2(ReviewJoinDto dto);
	
	public void insert(ReviewDto dto);
	public ReviewDto getData(int reviewNum);
	public void update(ReviewDto dto);
	public void delete(int reviewNum);
	
}
