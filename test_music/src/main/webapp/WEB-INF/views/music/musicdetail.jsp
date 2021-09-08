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
  <script>
  $(function(){
	  $("#btn_purchase").on('click', purchase);
  });
  
  function purchase() {
	  
	  let cdnum = $(this).attr('data-num');
	 // 어떤책(code)을 얼만큼(count), 어떤사용자(userid)
	 let quantity = $("#quantity").val();
	
	 if(quantity.trim().length == 0) {
		alert("구매 수량을 입력해 주세요");
		$("#quantity").focus();
			
		return;
	 }
	 
	 let data = "orderlist?cdnum="+cdnum+"&quantity="+quantity;
	 location.href = data;
  }
  
  </script>
  
</head>
<body>
<div class="container">
	<h2>[상품 상세 정보]</h2>
	<table class="table">
			<tr>
				<th>상품번호</th>
				<td>${music.cdnum}</td>
			</tr>
			<tr> 
				<th>아티스트</th>
				<td>${music.artist}</td>
			</tr>
			<tr>
				<th>음반 제목</th>
				<td>${music.title}</td>
			</tr>
			<tr>
				<th>가격</th>
				<td>${music.price}</td>
			</tr>
			<tr>
				<th colspan="2">
					<label for="count">구매수량</label>
					<input type="number" id="quantity" name="quantity">
					<input type="button" id="btn_purchase" value="구입하기" data-num="${music.cdnum}">
				</th>
			</tr>
	</table>
	<p><a href="${pageContext.request.contextPath}/musiclist"><input type="button" value="이전화면"></a></p>
</div>
</body>
</html>



