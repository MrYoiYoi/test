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
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
</head>
<body>
<div class="container">
	<h2>[가장 많이 팔린 책]</h2>
	<table class="table">
		<thead>
			<tr>
				<th>아티스트</th>
				<th>제목</th>
				<th>총 판매 수량</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="SalesVO" items="${sales}">
			<tr>
				<td>${SalesVO.artist}</td>
				<td>${SalesVO.title}</td>
				<td>${SalesVO.totalQuantity}</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	
	
	<p><a href="${pageContext.request.contextPath}/musiclist"><input type="button" value="이전화면"></a></p>
</div>
</body>
</html>
