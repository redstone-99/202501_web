<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>webapp/food/insertform.jsp</title>
</head>
<body>
	<div class="container">
		<h1>맛집 추가폼</h1>
		<form action="${pageContext.request.contextPath }/food/insert.jsp" method="post">
		<div>
			<label for="type">종류</label>
			<select name="type" id="type">
				<option value="">선택</option>
				<option value="한식">한식</option>
				<option>중식</option>
				<option>일식</option>
				<option>양식</option>
				<option>기타</option>
			</select>
		</div>
		<div>
			<label for="name">맛집이름</label>
			<input type="text" name="name" id="name" placeholder="맛집 이름 입력..."/>
		</div>
		<div>
			<label for="price">가격</label>
			<input type="number" name="price" id="price" step="100" max="100000" min="1000" placeholder="가격 입력..."/>
		</div>
		<button type="submit">저장</button>
		</form>
	</div>
</body>
</html>