<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/fooba.css" rel="stylesheet"> 
<script src="script/fooba.js"></script>
</head>
<body>
<div id="idcheck_box">
	<div id="idcheck_text">
		<form method="post" name="idCheckForm" action="fooba.do">
			<h1 id="idcheckline">ID 중복 확인</h1>
            <input type="hidden" name="command" value="memberIdCheckForm" />
            아이디 : <input type="text" name="userid" value="${userid}" style="font-size: 17px;">
            <input type="submit" value="검색" class="submit" id="idcheckbutton1"><label for="idcheckbutton1" id="idcheckbutton1_1">검색</label><br><br><br>
			<c:if test="${result == 1}">
				<script type="text/javascript">
	                    opener.document.member_join_send_form.userid.value="";
	                    opener.document.member_join_send_form.userreid.value="";
				</script>
	                ${userid}는 이미 사용중인 아이디입니다.
			</c:if>
            <c:if test="${result == -1}">
                ${userid}는 사용 가능한 ID입니다.    
                <input type="button" value="사용" class="cancel" id="idcheckbutton2" onclick="idok('${userid}');">
            </c:if>
		</form>
	</div>
</div>
</body>
</html>