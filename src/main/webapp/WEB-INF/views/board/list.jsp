<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 리스트</title>
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
					<div id="list">
						<div id="board_t"><a href="/board">게시판</a></div>
						<form action="/board" method="get">
							<div class="form-group text-right">
								<input type="text" name="keyword">
								<button type="submit" id="btn_search">검색</button>
							</div>
						</form>
						
						<table>
							<thead>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>글쓴이</th>
									<th>조회수</th>
									<th>작성일</th>
									<th>관리</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${bList}" var="bList">
									<tr>
										<td>${bList.boardNo}</td>
										<td class="text-left"><a href="/read?boardNo=${bList.boardNo}">${bList.title}</a></td>
										<td>${bList.name}</td>
										<td>${bList.hit}</td>
										<td>${bList.regDate}</td>
										<c:if test="${authUser.no eq bList.userNo}">
											<td><a href="/delete?boardNo=${bList.boardNo}">[삭제]</a></td>
										</c:if>
									</tr>
								</c:forEach>
							</tbody>
						</table>
			
						<div id="paging">
							<ul>
								<c:if test="${pMap.prev}">
									<li><a href="/paging?currentPageNo=${pMap.startPageBtnNo-1}">◀</a></li>
								</c:if>
								
								<c:forEach begin="${pMap.startPageBtnNo}" end="${pMap.endPageBtnNo}" step="1" var="page">
									<c:choose>
										<c:when test="${param.currentPageNo==page}">
											<li class="active"><a href="paging?currentPageNo=${page}">${page}</a></li>
										</c:when>
										<c:otherwise>
											<li><a href="/paging?currentPageNo=${page}">${page}</a></li>
										</c:otherwise>
									</c:choose>
		                        </c:forEach>
								
								<c:if test="${pMap.next}">
									<li><a href="/paging?currentPageNo=${pMap.endPageBtnNo+1}">▶</a></li>
								</c:if>	
							</ul>
						</div><!-- //paging -->
						
						
						<!-- 글쓰기 버튼 -->
						<div class="btn_w">
							<c:if test="${authUser != null}">
								<a id="btn_write" href="/writeForm">글쓰기</a>
							</c:if>
						</div>
					
					</div>
					<!-- //list -->
				</div>
				<!-- //board -->
				
			</div>
			<!-- //content -->

		</div>
		<!-- //container -->
		
	</div>
	<!-- //wrap -->

</body>
</html>
