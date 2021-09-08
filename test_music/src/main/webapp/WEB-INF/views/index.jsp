<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
  <title>SE Music</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <style>
  .jumbotron {
  	background-image : url('images/background.jpg');
  	background-size: cover;
  	text-shadow : #888.2em 0.2em 0.2em;
  	color : white;
  }
  </style>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script>
function orderitemList(id){
   let targetPlace = 'orderitemList?userid=' + id;
   location.href = targetPlace;
}
</script>
</head>
<body>

<div class="container">
  <div class="jumbotron">
    <h1>SE Music</h1>      
  </div>

  <ul class="nav nav-pills" role="tablist">
  	<c:if test="${sessionScope.loginId == null}">
	    <li class="active"><a href="join">회원가입</a></li>
	    <li><a href="login">로그인</a></li>
    </c:if>
    
    <c:if test="${sessionScope.loginId != null}">
	    <li><a href="logout">${sessionScope.loginName}님, 로그아웃</a></li>
	    <li><a href="javascript:orderitemList('${sessionScope.loginId}');">내 구매내역</a></li>
    </c:if>
    
    <li><a href="musiclist">상품 목록</a></li>
    <li><a href="rank">판매 순위</a></li>        
  </ul>
</div>
</body>
</html>
