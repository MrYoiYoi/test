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
 
  
  
</head>
<body>
<div class="container">
	<h2>[내 구매 내역]</h2>
	<table class="table">
		<thead>
			<tr>
				<th>날짜</th>
				<th>아티스트</th>
				<th>제목</th>
				<th>수량</th>
				<th>금액</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="SalesVO" items="${list}">
			<tr>
				<td>${SalesVO.saledate}</td>
				<td>${SalesVO.artist}</td>
				<td><a href="detailmusic?code=${SalesVO.cdnum}">${SalesVO.title}</a></td>
				<td>${SalesVO.quantity}</td>
				<td>${SalesVO.amount}</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<p><a href="${pageContext.request.contextPath}/"><input type="button" value="이전화면"></a></p>
</div>
</body>
</html>