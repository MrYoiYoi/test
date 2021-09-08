<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
  <title>로그인</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <style>
  	span {
  		color : red;
  		font-size : 0.8em;
  	}
  </style>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

  <script>
  	$(function() {
  		$("#joinBtn").on('click',joinSubmit);
  		$('.id_input').on('click',idCheck2);
  	});
  	
	
  	function joinSubmit() {
  		let userid = $("#userid").val();
  		let userpwd  = $("#userpwd").val(); // R, W
  		let username = $("#username").val(); // R, W
  		
  		if(userid.trim().length == 0){
  			alert("아이디를 입력해주세요");
  			return;
  			}
  		else if(userid.trim().length < 3 || userid.trim().length >10 ) {
  			alert("아이디는 3~10글자 사이로 입력해주세요");
  			return;
  		}
  		
  		if(userpwd.trim().length < 3 || userpwd.trim().length >10 ) {
  			alert("비밀번호는 3~10글자 사이로 입력해주세요");
  			return;
  		}

  		if(username.trim().length == 0 ) {
  			alert("이름을 입력해주세요");
  			return;
  		}
  	
  		
  		$("#joinForm").submit();
  	}
  //아이디 중복검사
    function idCheck2(){
    	let userid = $("#userid").val();			// .id_input에 입력되는 값
    	var data = {userid : userid}				// '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
    	
    	if(userid.trim().length ==0) {
  			$("#id_input_re_1").text("아이디를 입력해주세요.");
			return;
  		}
    	
    	
    	$.ajax({
    		type : "post",
    		url : 'idchek',
    		data : data,
    		success : function(result){
   			 //console.log("성공 여부" + result);
    			if(result != 'fail'){
    				$('#id_input_re_1').css("color", "blue");
  					$("#id_input_re_1").text("사용가능한 아이디입니다.");
    			} else {
    				$("#id_input_re_1").css("color", "red");
  					$("#id_input_re_1").text("중복된 아이디입니다.");			
    			}
    		}
    	}); // ajax 종료
  }
  	
 
 </script>

</head>
<body>

<div class="container">
  <h2>회원가입</h2>
  <form id="joinForm" action="join" method="POST">
    <div class="form-group">
      <label for="userid">ID:</label>
      <input type="text" class="form-control" id="userid" name="userid" placeholder="Enter userid">
      <span id="id_input_re_1"></span>
      <input type="button" id = "id_input "class="id_input" value="중복검사">
    </div>
    <div class="form-group">
      <label for="userpwd">Password:</label>
      <input type="password" class="form-control" id="userpwd" name="userpwd" placeholder="Enter password">
    </div>
    <div class="form-group">
      <label for="username">Name:</label>
      <input type="text" class="form-control" id="username" name="username" placeholder="Enter your name">
    </div>
    <button id="joinBtn" type="submit" class="btn btn-primary" >가입</button>
  </form>
</div>

</body>
</html>
