<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<form method="post" action="bannerWrite" enctype="multipart/form-data">
			<h1 id="idcheckline">배너 등록</h1>
			배너 이름 : <input type="text" name="BNAME" style="font-size: 20px;">
			<br><br>
			<input type="file" name="BIMAGE" value="배너 이미지">
			<input type="submit" id="bannersubmit" style="display:none">
			<label for="bannersubmit" style="cursor:pointer; font-size: 17px;">등록</label>
		</form>
	</div>
</div>

</body>
</html>