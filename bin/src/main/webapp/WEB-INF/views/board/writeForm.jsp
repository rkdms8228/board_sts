<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글쓰기폼</title>
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
				
					<div id="writeForm">
					
						<form action="/write" method="get">
						
							<!-- 글쓴이 -->
							<input type="hidden" name="userNo" value="${authUser.no}">
							
							<!-- 제목 -->
							<div class="form-group write">
								<label class="form-text" for="txt-title">제목</label>
								<input type="text" id="txt-title" name="title" value="" placeholder="제목을 입력해 주세요.">
							</div>
						
							<!-- 내용 -->
							<div class="form-group write">
								<textarea id="txt-content" name="content" value=""></textarea>
							</div>
							
							<div class="writeCS_btn">
								<a id="btn_cancel" href="/board">취소</a>
								<button id="btn_add" type="submit">등록</button>
							</div>
							
						</form><!-- //form -->
						
					</div><!-- //writeForm -->
					
				</div><!-- //board -->
				
			</div><!-- //content  -->

		</div><!-- //container  -->
		
	</div>
	<!-- //wrap -->
	
</body>
</html>
