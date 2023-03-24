package com.web.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.mapper.BoardMapper;
import com.web.vo.BoardVo;

@Service
public class BoardService {
	
	@Autowired
	private BoardMapper boardMapper;
	
	//리스트 불러오기 + 검색(페이징)
	public Map<String, Object> paging(int currentPageNo) {

		//////////////////////////////////////////////
		//                 리스트 가져오기              //
		//////////////////////////////////////////////
		
		//페이지당 글 갯수
		int listCnt = 10;
		
		//현재 페이지
		//           		  조건문       		   true일 때 : false일 때
		currentPageNo = (currentPageNo > 0) ? currentPageNo : (currentPageNo = 1);
		
		//시작글 번호
		int startRnum = (currentPageNo-1)*listCnt + 1;
		
		//끝글 번호
		int endRnum = (startRnum + listCnt) - 1;
		
		List<BoardVo> bList = boardMapper.paging(startRnum, endRnum);

		//////////////////////////////////////////////
		//                  페이징 계산                //
		//////////////////////////////////////////////
		
		//전체 글갯수
		int totalCnt = boardMapper.selectTotalCnt();
		
		//페이지당 버튼 갯수
		int pageBtnCount = 5;
		
		//마지막 버튼 번호
		int endPageBtnNo = (int)Math.ceil(currentPageNo/(double)pageBtnCount)*pageBtnCount;
		
		//시작 버튼 번호
		int startPageBtnNo = (endPageBtnNo-pageBtnCount)+1;
		
		//다음 페이지 화살표 유무
		boolean next = false;
		
		if((listCnt*endPageBtnNo) < totalCnt) {
			next = true;
		}else {
			endPageBtnNo = (int)Math.ceil(totalCnt/(double)listCnt);
		}
		
		//이전 페이지 화살표 유무
		boolean prev = false;
		
		if(startPageBtnNo != 1) {
			prev = true;
		}

		Map<String, Object> pMap = new HashMap<String, Object>();
		pMap.put("bList", bList);
		pMap.put("prev", prev);
		pMap.put("next", next);
		pMap.put("endPageBtnNo", endPageBtnNo);
		pMap.put("startPageBtnNo", startPageBtnNo);
		
		return pMap;
		
	}
	
	//게시판 메인(리스트) + 검색
	public List<BoardVo> getList(String keyword) throws Exception {
		
		return boardMapper.getList(keyword);
		
	}
	
	//게시판 읽기
    public BoardVo read(int boardNo) throws Exception {
    	
    	//조회수 올리기
		boardMapper.boardHit(boardNo);
    	
		return boardMapper.read(boardNo);
		
    }
    
	//게시판 삭제
  	public void delete(int boardNo) throws Exception {

  		boardMapper.delete(boardNo);
  		
  	}

	
	//게시판 글쓰기
	public boolean write(BoardVo boardVo) {

		return boardMapper.write(boardVo);
		
	}
	
	//게시글 수정
    public void modify(BoardVo boardVo) throws Exception {
    	
    	boardMapper.modify(boardVo);
           
    }


}
