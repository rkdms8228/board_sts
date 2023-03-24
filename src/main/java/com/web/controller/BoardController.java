package com.web.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.service.BoardService;
import com.web.vo.BoardVo;
import com.web.vo.UserVo;

import jakarta.servlet.http.HttpSession;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	//게시판 메인(리스트)+ 페이징
	@GetMapping("/paging")
	public String paging(Model model
						 , @RequestParam(value="currentPageNo", required = false, defaultValue = "1")int currentPageNo)
						 throws Exception {

		Map<String, Object> pMap = boardService.paging(currentPageNo);
		model.addAttribute("pMap", pMap);
		
		return "redirect:/board";
		
	}
	
	//게시판 메인(리스트) + 검색
	@GetMapping("/board")
	public String list(Model model, String keyword) throws Exception {
		  
		 List<BoardVo> bList = boardService.getList(keyword);
		 model.addAttribute("bList", bList);
		 
		 return "/board/list";
		  
	}
	
	//게시판 내용 읽기 + 조회수
	@GetMapping("/read")
	public String read(@RequestParam("boardNo")int boardNo, Model model) throws Exception {

		//내용 읽기
		BoardVo bList = boardService.read(boardNo);
		model.addAttribute("bList", bList);
		
		return "/board/read";
		
	}
	
	//게시판 삭제
	@GetMapping(value="/delete")
	public String delete(@RequestParam("boardNo")int boardNo) throws Exception {
		
		boardService.delete(boardNo);
		
		return "redirect:/board";
		
	}
	
	//게시판 글쓰기폼
	@GetMapping("/writeForm")
	public String writeForm() {
		
		return "/board/writeForm";
		
	}
	
	//게시판 글쓰기
	@PostMapping("/write")
	public String write(BoardVo boardVo, HttpSession session) {
		
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		boardVo.setUserNo(authUser.getNo());
		
		//줄바꿈
		boardVo.setContent(boardVo.getContent().replace("\n", "<br>"));
		
		boardService.write(boardVo);
		
		return "redirect:/board";
		
	}
	
	//게시글 수정폼
	@PostMapping("/modifyForm")
    public String modifyForm(@RequestParam("boardNo") int boardNo, Model model) throws Exception {
		
        BoardVo bList = boardService.read(boardNo);

        //줄바꿈
        String replace = ((String)bList.getContent()).replace("<br>", "\n");
        bList.setContent(replace);
		
        model.addAttribute("bList", bList);  
        
        return "/board/modifyForm";
    }

	//게시글 수정폼
	@GetMapping("/modify")
    public String modify(BoardVo boardVo) throws Exception {
		
		//줄바꿈
		boardVo.setContent(boardVo.getContent().replace("\n", "<br>"));
		
		boardService.modify(boardVo);
        
        return "redirect:/board";
    }

}
