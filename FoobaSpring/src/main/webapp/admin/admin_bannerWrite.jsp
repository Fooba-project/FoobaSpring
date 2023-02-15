<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/fooba.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#fileupload').change( function(){
		alert
		var formselect = $("#bimageForm")[0];   // 지목된 폼을 변수에 저장
		var formdata = new FormData(formselect);   // 전송용 폼객에 다시 저장
		$.ajax({    // 웹페이지 이동 또는 새로고침이 필요없는 request요청
			url:"<%=request.getContextPath() %>/bannerFileup", // 해당 컨트롤러의 requestMapping 목적지 설정
			type:"POST",
			enctype:"multipart/form-data",
			async: false,
			data: formdata,
	    	timeout: 10000,
	    	contentType : false,
	        processData : false,
	        success : function(data){
				if(data.STATUS == 1){
					$("#BIMAGE").val(data.FILENAME);
					$("#previewimage").html("<img src='images/"+data.FILENAME+"' height='170' width='400'/>");
				}
			},
			error: function() {
			}
		});
	});
});
</script>
</head>
<body>

<div id="idcheck_box">
	<div id="idcheck_text">
		<form method="post" action="admin_bannerWrite">
			<h1 id="idcheckline">배너 등록</h1>
			배너 이름 : <input type="text" name="BNAME" style="font-size: 20px;" value="${vo.BNAME}"><br><br>
			<label for="fileupload" style="cursor:pointer">이미지 등록 </label><br>
			<input type="hidden" name="BIMAGE" id="BIMAGE" value="${vo.BIMAGE }">
	   		<div id="previewimage">
	   			<c:if test="${not empty vo.BIMAGE}">
	   				<img src='images/${vo.BIMAGE }' height='170' width='400'/>
	   			</c:if>
	   		</div><br><br>
			<input type="submit" value="등록" style="cursor:pointer; font-size: 17px; background:blue; color:white; border:none; width:400px; height:30px;">
			<h3>${message }</h3>
		</form>
	</div>
	<form id="bimageForm" method="post" enctype="multipart/form-data">
		<input type="file" name="bannerImage" id="fileupload" style="display:none">
	</form>
</div>

<c:if test="${result == 1}">
	<script type="text/javascript">
		opener.location.href="adminList?table=b&first=y";
		self.close();
	</script>
</c:if>
</body>
</html>