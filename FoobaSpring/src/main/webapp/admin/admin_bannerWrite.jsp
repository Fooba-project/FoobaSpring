<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/fooba.css" rel="stylesheet">

</head>
<body>

<div id="idcheck_box">
	<div id="idcheck_text">
		<form method="post" action="admin_bannerWrite" enctype="multipart/form-data">
			<h1 id="idcheckline">배너 등록</h1>
			배너 이름 : <input type="text" name="BNAME" style="font-size: 20px;" value="${BNAME }">
			<br><br>
			<input type="file" name="BIMAGE">
			<input type="submit" id="bannersubmit" style="display:none">
			<label for="bannersubmit" style="cursor:pointer; font-size: 17px;">등록</label>
			<h3>${message }</h3>
		</form>
	</div>
</div>

<c:if test="${result == 1}">
	<script type="text/javascript">
		opener.location.href="adminList?table=b&first=y";
		self.close();
	</script>
</c:if>
</body>
</html>