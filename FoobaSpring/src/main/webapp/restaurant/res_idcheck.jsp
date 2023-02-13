<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/fooba.css" rel="stylesheet"> 
<script type="text/javascript">

function idok( rid ){
	opener.res_join_send_form.rid.value = rid;
	opener.res_join_send_form.reid.value = rid;
	self.close();
}

</script>
</head>
<body>
<div id="idcheck_box">
    <div id="idcheck_text">
        <h1>ID 중복 확인</h1>
        <form method="post" name="res_idCheckForm" action="res_idCheckForm">
    	아이디 : <input type="text" name="RID" value="${RID}" id="rid">
	    <input type="submit" value="검색" class="submit"><br><br><br>
	
		<c:if test="${result == 1}">
			<script type="text/javascript">
				opener.document.res_join_send_form.rid.value="";
				opener.document.res_join_send_form.reid.value="";
			</script>
			${RID}는 이미 사용중인 아이디입니다.
		</c:if>
		<c:if test="${result == -1}">
			${RID}는 사용 가능한 ID입니다.    
			<input type="button" value="사용" class="cancel" onclick="idok('${RID}');">
        </c:if>
        
		</form>
    </div>
</div>
</body>
</html>