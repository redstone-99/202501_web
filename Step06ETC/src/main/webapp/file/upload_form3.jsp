<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/upload_form3.jsp</title>
</head>
<body>
	<div class="container">
		<h3>이미지 업로드 폼</h3>
		<form action="${pageContext.request.contextPath }/file/upload3.jsp" method="post"
		 	enctype="multipart/form-data" id="myForm">
			<input type="text" name="title" placeholder="설명 입력"/><br />
			이미지 <input type="file" name="myImage" accept="image/*"/><br />
			<button type="submit">업로드</button>
		</form>
		<img id="image" width="500"/>
	</div>
	<script>
		//"submit"발생한 이벤트에 대한 정보를 담고 있는 object가 매개변수에 전달된다~
		document.querySelector("#myForm").addEventListener("submit", (event)=>{
			//기본동작(폼제출)을 막기
			event.preventDefault();
			//event.target은 해당 이벤트가 발생한 바로 그 요소의 참조값 (현재는 form 의 참조값)
			//document.querySelector("#myForm") == event.target
			const data = new FormData(event.target);
			//fetch 함수를 이용해서 FormData 전송하기
			fetch("${pageContext.request.contextPath }/file/upload3", {
				method:"post",
				body:data
			})
			.then(res=>res.json())
			.then(data=>{
				console.log(data);
				//data.saveFileName 은 upload 폴더에 저장된 파일명이다.
				//서버에서 반환된 이미지 파일 이름을 사용하여 이미지 표시
				const requestPath = "${pageContext.request.contextPath}/upload/" + data.saveFileName;
				
				//업로드된 이미지를 페이지에서 표시
				//img 요소에 src 속성 추가하기
                document.querySelector("#image").setAttribute("src", requestPath);
            })
		});
	</script>
</body>
</html>