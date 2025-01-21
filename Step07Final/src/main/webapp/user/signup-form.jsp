<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/user/signup-form.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" />
</head>
<body>
	<div class="container" id="app">
		<h1>회원가입 폼 입니다 (vuejs 이용)</h1>
		<form action="signup.jsp" method="post" id="signupForm" novalidate>
			<div class="mb-2">
				<label class="form-label" for="userName">아이디</label>
				
				<input :class="{'is-valid':isIdValid ,'is-invalid':!isIdValid && isIdDirty}"
					@input="onIdInput"
					class="form-control" type="text" name="userName" id="userName"/>
					
				<small class="form-text">영문자 소문자로 시작하고 5~10 글자 이네로 입력하세요</small>
				<div class="valid-feedback">사용 가능한 아이디 입니다</div>
				<div class="invalid-feedback">사용할수 없는 아이디 입니다</div>
			</div>
			<div class="mb-2">
				<label class="form-label" for="password">비밀번호</label>
				<input v-model="password"
					@input="onPwdInput"
					:class="{'is-valid': isPwdValid, 'is-invalid': !isPwdValid && isPwdDirty}"
					class="form-control" type="password" name="password" id="password"/>
				<small class="form-text">특수 문자를 하나 이상 조합하세요.</small>
				<div class="invalid-feedback">비밀 번호를 확인 하세요</div>
			</div>
			<div class="mb-2">
				<label class="form-label" for="password2">비밀번호 확인</label>
				<input v-model="password2"
					@input="onPwdInput"
					class="form-control" type="password" id="password2"/>
			</div>		
			<div class="mb-2">
				<label class="form-label" for="email">이메일</label>
				<input @input="onEmailInput"
					:class="{'is-valid': isEmailValid, 'is-invalid': !isEmailValid && isEmailDirty}"
					class="form-control" type="email" name="email" id="email"/>
				<div class="invalid-feedback">이메일 형식에 맞게 입력하세요.</div>
			</div>				
			<button class="btn btn-success" type="submit" v-bind:disabled="!isIdValid || !isPwdValid || !isEmailValid">가입</button>
		</form>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<script>
		new Vue({
			el:"#app",
			data:{
				isIdValid:false,
				isIdDirty:false,
				isPwdValid:false,
				isPwdDirty:false,
				isEmailValid:false,
				isEmailDirty:false,
				password:"",
				password2:""
			},
			
			methods:{
				// 비밀번호 검증 함수
				onPwdInput() {
					this.isPwdDirty=true;
					//비밀 번호를 검증할 정규 표현식(특수문자 포함여부)
					const reg_pwd=/[\W]/;
					//일단 정규표현식을 만족하는지 확인해서 만족하지 않으면 함수를 여기서 종료
					//만일 첫번째 비밀번호가 정규표현식을 통과하지 못하거나 또는 두번째 비밀번호가 정규표현식을 통과하지 못한다면
					if( !reg_pwd.test(this.password) || !reg_pwd.test(this.password2) ){
						this.isPwdValid=false;
						return;
					}
					//위를 통과 했다면 여기서는 비밀번호가 같은지 여부를 알아내서 유효성 여부에 반영한다.
					if(this.password == this.password2){
						//비밀번호가 유효 하다는 의미에서 true 를 넣어준다.
						this.isPwdValid=true;
					}else{
						//비밀번호가 유효 하지 않다는 의미에서 false 를 넣어준다.
						this.isPwdValid=false;
					}
				},
				
				onEmailInput(e){
					//이메일을 검증할 정규표현식
					const reg_email=/@/;
					this.isEmailDirty=true;
					//입력한 문자열 읽어오기 
					const email=e.target.value;
					//만일 email 을 제대로 입력 했다면 
					if(reg_email.test(email)){
						this.isEmailValid=true;
					}else{//제대로 입력하지 않았다면
						this.isEmailValid=false;
					}
				},
				
				onIdInput(e){
					this.isIdDirty=true;
					//아이디를 검증할 정규 표현식 
					const reg_id=/^[a-z].{4,9}$/;
					//e.target 은 id input 요소의 참조값 
					
					//현재까지 입력한 아이디를 읽어온다.
					let inputUserName=e.target.value;
					//만일 정규표현식을 통과하지 못했다면 
					if(!reg_id.test(inputUserName)){
						//아이디의 상태값 변경
						this.isIdValid=false;
						return;
					}
					
					//fetch() 함수를 이용해서 get 방식으로 입력한 아이디를 보내고 사용가능 여부를 json 으로 응답받는다.
					fetch("${pageContext.request.contextPath }/user/checkid.jsp?userName="+inputUserName)
					.then(res=>res.json())
					.then(data=>{		
						//만일 사용할수 있는 아이디라면
						if(data.canUse){
							//사용할수 있는 아이디라는 의미에서 true 를 넣어준다.
							this.isIdValid=true;
						}else{
							//사용할수 없는 아이디라는 의미에서 false 를 넣어준다.
							this.isIdValid=false;
						}
					});
				}
			}
		});
	</script>
</body>
</html>