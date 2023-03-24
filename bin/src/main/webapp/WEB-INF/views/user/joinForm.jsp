<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 회원가입 화면</title>
<link href="/static/css/main.css" rel="stylesheet" type="text/css">
<link href="/static/css/loginForm.css" rel="stylesheet" type="text/css">
</head>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>

<body>
	<div id="wrap">
	
		<div id="center" class="clearfix">
				
			<h1><!-- 메인 로고 -->	
				<a href="/main">MyBoard</a>
			</h1>
			
		</div><!-- center -->
		
		<div id="content">
	
			<div id="user">
				<div id="joinForm">
				
					<h2><a href="joinForm" class="log">회원가입</a></h2>
					
					<form id="join-form" action="/join" method="get">

						<!-- 아이디 -->
						<div class="form-group idBox">
							<label class="form-text" for="input-uid">아이디</label> 
							<input type="text" id="input-uid" name="id" value="" placeholder="아이디를 입력하세요">
							<button type="button" id="idCheck">중복체크</button>
						</div>

						<!-- 비밀번호 -->
						<div class="form-group">
							<label class="form-text" for="input-pass">패스워드</label> 
							<input type="password" id="input-pass" name="password" value="" placeholder="비밀번호를 입력하세요"	>
						</div>

						<!-- 이름 -->
						<div class="form-group">
							<label class="form-text" for="input-name">이름</label> 
							<input type="text" id="input-name" name="name" value="" placeholder="이름을 입력하세요">
						</div>

						<!-- 약관동의 -->
						<div class="form-group">
							<span class="form-text">약관동의</span> 
							
							<input type="checkbox" id="chk-agree" value="" name="">
							<label for="chk-agree">서비스 약관에 동의합니다.</label> 
						</div>
						
						<!-- 버튼영역 -->
						<div class="button-area">
							<button type="submit" id="btn-submit">회원가입</button>
						</div>
						
					</form>
				</div>
				<!-- //joinForm -->
			</div>
			<!-- //user -->

		</div>
		<!-- //content  -->
		
	</div><!-- wrap -->
</body>

<script type="text/javascript">
	

	//아이디 중복 무조건 체크 (아이디 중복일 때 = 0 , 중복이 아닐 때 = 1 )
	var idcheck = 0;
	
	//회원가입 버튼을 클릭했을 때 
	$("#join-form").on("submit", function() {
	    
		var joinId =  $("#input-uid").val();
		var joinPw =  $("#input-pass").val();
		var joinName =  $("#input-name").val();
		
		//원래의 submit기능을 못하게 하는 장치(다른 html기능 포함)
		//event.preventDefault();
		
		if (joinId == "" || joinId == null) {		    
		    alert("아이디를 입력해 주세요.");
		    return false;
		}
		if (joinPw == "" || joinPw == null) {		    
		    alert("패스워드를 체크해 주세요.");
		    return false;
		}
		if (joinName == "" || joinName == null) {		    
		    alert("이름을 입력해 주세요.");
		    return false;
		}
		
		//약관동의
		var agree = $("#chk-agree").is(":checked");
		if(agree == false) {
			alert("약관에 동의해 주세요.");
		    return false;
		}
		
	});
	
	//idCheck 버튼을 클릭했을 때 
	$("#idCheck").on("click", function() {
		
		var id = $("#input-uid").val();
		console.log(id);
		
		$.ajax({
			 
			//보낼 때
			url : "/idCheck",
			type : "post",
			contentType: "application/json",
			data: JSON.stringify(id),
			 
			//받을 때
			//dataType : "json",
			success : function(result) {
				
				if (id == null || id == "") {
					
				    alert("아이디를 입력해 주세요.");
				    
				}else if (result == "fail") {
					
					 alert("이미 존재하는 아이디 입니다. 다른 아이디를 입력해 주세요.");
					 
				}else {
					
				    alert("사용 가능한 아이디입니다.");
				    
				    //아이디가 중복되지 않으면  idcheck = 1 
				    idcheck = 1;
				    
				}
			       
			},
			 error : function(error) { 
			     alert("error : " + error);
			}
		     
		});
		
	});
</script>

</html>