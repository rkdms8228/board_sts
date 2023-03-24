<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 로그인 화면</title>
<link href="/static/css/main.css" rel="stylesheet" type="text/css">
<link href="/static/css/loginForm.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="wrap">
	
		<div id="center" class="clearfix">
				
			<h1><!-- 메인 로고 -->	
				<a href="/main">MyBoard</a>
			</h1>
			
		</div><!-- center -->
		
		
		
		<div id="user">

			<div id="loginForm">
			
				<h2><a href="/loginForm" class="log">로그인</a></h2>
				
			
				<form action="/login" method="post">
				
					<!-- 로그인 입력 정보 -->
					<div class="id"><!-- 아이디 -->
						<label class="form-text" for="input-uid">ID</label>
						<input type="text" id="input-uid" name="id" placeholder="아이디를 입력하세요.">
					</div>
					<div class="pw"><!-- 비번 -->
						<label class="form-text" for="input-pass">PW</label>
						<input type="password" id="input-pass" name="password" placeholder="비밀번호를 입력하세요.">
					</div>
										
					<!-- 버튼 영역 -->
					<div class="button-area">
						<button type="submit" id="btn-submit">LOGIN</button>
					</div>
				
				</form>	
			</div><!-- loginForm -->
			
		</div><!-- user -->
		
	</div><!-- wrap -->
</body>
</html>