<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 수정폼</title>
<link href="/static/css/main.css" rel="stylesheet" type="text/css">
<link href="/static/css/board.css" rel="stylesheet" type="text/css">
</head>
<body>

	<div id="wrap">
	
		<div id="center" class="clearfix">
				
			<h1><!-- 메인 로고 -->	
				<a href="/main">MyBoard</a>
			</h1>
			
		</div><!-- center -->

		<div id="container" class="clearfix">

			<div id="content">
	
				<div id="board">
				
					<div id="modifyForm">
						<form action="/modify" method="get">
							<input type="hidden" name="boardNo" value="${bList.boardNo}">
							<!-- 작성자 -->
							<div class="form-group">
								<span class="form-text">작성자</span>
								<span class="form-value">${bList.name}</span>
							</div>
							
							<!-- 조회수 -->
							<div class="form-group">
								<span class="form-text">조회수</span>
								<span class="form-value">${bList.hit}</span>
							</div>
							
							<!-- 작성일 -->
							<div class="form-group">
								<span class="form-text">작성일</span>
								<span class="form-value">${bList.regDate}</span>
							</div>
							
							<!-- 제목 -->
							<div class="form-group">
								<label class="form-text" for="txt-title">제목</label>
								<input type="text" id="txt-title" name="title" value="${bList.title}">
							</div>			
						
							<!-- 내용 -->
							<div class="form-group">
								<textarea id="txt-content" name="content">${bList.content}</textarea>
							</div>
							
							<div class="m_btn">
								<a id="btn_cancel" href="/board">취소</a>
								<button id="btn_modify" type="submit" >수정</button>
							</div>
							
						</form>
						<!-- //form -->
					</div>
					<!-- //modifyForm -->
					
				</div><!-- //board -->
				
			</div><!-- //content  -->

		</div><!-- //container  -->
		
	</div>
	<!-- //wrap -->
	
</body>
</html>
