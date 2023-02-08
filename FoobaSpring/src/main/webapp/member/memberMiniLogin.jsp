<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<fmt:setLocale value="ko_KR"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fooba</title>
<link href="css/fooba.css" rel="stylesheet">
<script type="text/javascript" src="/code.jquery.com/jquery-2.1.3.min.js"></script>
<script src = "script/jquery-3.6.1.js"></script>
<script src="script/fooba.js"></script>
</head>
<body>
<form method="post" action="fooba.do?command=miniLogin" name="loginForm">
	<div class="login_form">
			<div id="logspace"></div>
	        <div id="loginmain_logo">
	            <img src="images/mainlogo1.png">
	        </div>
	    
	        <div id="login_box" style="width:450px;">
	            <div id="text_button_box" style="right:20px;">
	                <div id="login_idpw_box">
	                    <input type="text" id="login_id" name="userid" placeholder="아이디" title="아이디"
	                maxlength="30" value="">
	    
	                    <input type="password" id="login_pw" name="userpw" placeholder="비밀번호" title="비밀번호"
	                maxlength="16" value="">
	                </div>
	    			<input type="hidden" name="fseq" value="${param.fseq}" >
	                <div id="log_buttonbox">
	                    <button type="submit" id="log_button" >
	                        <span class="btn_text">로그인</span>
	                    </button>
	                </div>
	            </div>

	    </div>
	    <input type="hidden" name="check" value="">
	    <div id="loginmessage">${message}</div>
	</div>

</form>
</body>
</html>