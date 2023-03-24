package com.web.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.web.vo.BoardVo;

@Mapper
public interface BoardMapper {
	
	public List<BoardVo> getList(String keyword) throws Exception;			//리스트 불러오기
	public List<BoardVo> paging(int startRnum, int endRnum);				//
	public int selectTotalCnt();											//
	public BoardVo read(int boardNo) throws Exception;						//글읽기
	public int boardHit(int boardNo);										//조회수 올리기
	public void delete(int boardNo) throws Exception;						//게시물 삭제
	public boolean write(BoardVo boardVo);									//글쓰기
	public void modify(BoardVo boardVo) throws Exception;					//글수정

}
