<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/user/signup_form.jsp</title>
<style>
	.invalid-feedback{
		display: none;
		color: red;
	}
</style>
</head>
<body>
	<div class="container">
		<h1>회원가입 폼 입니다</h1>
		<form action="signup.jsp" method="post" id="signupForm" novalidate>
			<div>
				<label for="id">아이디</label>
				<input type="text" name="id" id="id"/>
				<small>영문자 소문자로 시작하고 5~10 글자 이내로 입력하세요</small>
				<div class="invalid-feedback">사용할수 없는 아이디 입니다</div>
			</div>
			
			<button type="submit">가입</button>
		</form>
	</div>
	<script>
		/*
			폼에 submit 이벤트가 발생하면 입력한 내용을 검증해서 조건을 만족하지 못하면
			폼 제출을 막는 예제
			
			hint => event.preventDeafult()
		*/
		
		//폼안에 있는 submit 버튼을 누르면 form 이 제출되는 기본 동작을 한다.
		document.querySelector("#signupForm").addEventListener("submit", function(event){
			// 폼의 아이디 값 가져오기
			const inputId = document.querySelector("#id").value;
			
			// 아이디를 검증할 정규 표현식
			const reg_id = /^[a-z].{4,9}$/;
			
			// 아이디가 정규 표현식과 일치하지 않으면 제출을 막고 오류 메시지를 표시
			if (!reg_id.test(inputId)) {
				// 폼 제출 막기
				event.preventDefault();
				// 오류 메시지 표시
				document.querySelector(".invalid-feedback").style.display = "block";
			} else {
				// 오류 메시지를 숨김
				document.querySelector(".invalid-feedback").style.display = "none";
			}
		});
	</script>
</body>
</html>