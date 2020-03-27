package com.test.project01.review.dao;

import java.util.List;

import com.test.project01.review.dto.ReviewDto;
import com.test.project01.review.dto.ReviewJoinDto;

public interface ReviewDao {
	//모든 리뷰
	public int getCount(ReviewJoinDto dto);
	public List<ReviewJoinDto> getList(ReviewJoinDto dto);
	//해당아이템의 리뷰
	public int getCount2(ReviewJoinDto dto);
	public List<ReviewJoinDto> getList2(ReviewJoinDto dto);
	//리뷰 추가
	public void insert(ReviewDto dto);
	//리뷰의 정보 얻기
	public ReviewDto getData(int reviewNum);
	//리뷰 업데이트
	public void update(ReviewDto dto);
	//리뷰 삭제
	public void delete(int reviewNum);
	
	//해당 아이템의 별점 구하기
	public List<Integer> likeCount(int itemNum);
	//해당 아이템에 대한 리뷰가 있는지 여부
	public boolean isExist(ReviewDto dto);

}
