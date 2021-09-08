<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품목록</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script>
  function wishlistDelete() {
	let code = '${book.code}';
	let answer = confirm('게시글을 삭제하시겠습니까?');
	
	if(answer) {
		location.href="deletewishlist?code=" + code;
	}
	
}
  
  </script>
</head>
<body>
<div class="container">
	<h2>[${sessionScope.loginName}(${sessionScope.loginId})님의 관심 상품]</h2>
	<table class="table">
		<thead>
			<tr>
				<th>상품코드</th>
				<th>제목</th>
				<th>가격</th>
				<th>관심상품 삭제하기</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="book" items="${list}">
			<tr>
				<td>${book.code}</td>
				<td><a href="detailbook?code=${book.code}">${book.title}</a></td>
				<td>${book.price}</td>
				<td><input type="button" id="btn_delete" value="삭제" onclick="wishlistDelete();"></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<p><a href="${pageContext.request.contextPath}/"><input type="button" value="이전화면"></a></p>
</div>
</body>
</html>