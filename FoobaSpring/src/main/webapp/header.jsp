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
<script type="text/javascript" src="script/jquery-3.6.1.js"></script>
<script type="text/javascript" src="script/fooba.js"></script>
</head>
<body>
    <div class="headback">
        <div id="mainlogo">
            <a href="fooba.do?command=index"><img src="images/mainlogo1.png"></a>
        </div>
    </div>
    <div class="headbuttons">
    	<c:choose>
    		<c:when test="${empty loginUser}">
	    		<input type="button" value="로그인" class="headbutton" onclick="location.href='fooba.do?command=loginForm'">
	    		<input type="button" value="회원가입" class="headbutton" onclick="location.href='fooba.do?command=memberJoinForm'">
    		</c:when>
    		<c:otherwise>
    			<input type="button" value="로그아웃" class="headbutton" onclick="location.href='fooba.do?command=logout'">
	    		<input type="button" value="마이페이지" class="headbutton" onclick="location.href='fooba.do?command=memberOrderList&&page=1'">
    		</c:otherwise>
    	</c:choose>
    </div>