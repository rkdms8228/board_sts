<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글읽기</title>
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

		<div id="content">

			<div id="board">
				<div id="read">
					<form action="#" method="get">
						
						<div id="content-info">
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
								<span class="form-text">제 목</span>
								<span class="form-value">${bList.title}</span>
							</div>
						</div><!-- //content-info -->
					
						<!-- 내용 -->
						<div id="txt-content">
							<span class="form-value">${bList.content}</span>
						</div>

						<c:if test="${authUser.no eq bList.userNo}">
							<a id="btn_modify" href="/modifyForm?boardNo=${bList.boardNo}">수정</a>
						</c:if>
						<a id="btn_modify" href="/board">목록</a>
						
					</form>
					<!-- //form -->
				</div>
				<!-- //read -->
			</div>
			<!-- //board -->
			
		</div>
		<!-- //content  -->

	</div>
	<!-- //wrap -->

</body>
</html>