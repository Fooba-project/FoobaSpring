<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/fooba.css" rel="stylesheet">
<style type="text/css">
body {position:relative; margin:0;}
#bimageForm {position:absolute; margin-left:30px; top:400px;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#fileupload').change( function(){
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
					$("#previewimage").html("<br><img src='images/"+data.FILENAME+"' height='170' width='400'/>");
				}
			},
			error: function() {alert("실패");}
		});
	});
});
</script>
</head>
<body>

<div id="idcheck_box">
	<div id="idcheck_text">
		<form method="post" action="admin_bannerUpdate">
			<input type="hidden" name="OLDBIMAGE" value="${vo.BIMAGE}">
			<input type="hidden" name="BSEQ" value="${vo.BSEQ }">
			<h1 id="idcheckline">배너 수정</h1>
			배너 이름 : <input type="text" name="BNAME" style="font-size: 20px;" value="${vo.BNAME}"><br><br>
			기존 이미지<br>
			<img src="images/${vo.BIMAGE}" style="border-radius:5px; width:400px; height:170px"/>
			<br><br>
			<label for="fileupload" style="cursor:pointer">이미지 등록 </label><br>
			<input type="hidden" name="BIMAGE" id="BIMAGE" value="${NEWBIMAGE }">
	   		<div id="previewimage">
	   			<c:if test="${not empty NEWBIMAGE}">
	   				<br><img src='images/${NEWBIMAGE }' height='170' width='400'/>
	   			</c:if>
	   		</div><br><br>
			<input type="submit" value="수정" style="cursor:pointer; font-size: 17px; background:blue; color:white; border:none; width:400px; height:30px;">
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