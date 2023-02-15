<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/fooba.css" rel="stylesheet">
<script type="text/javascript">
function abab(){
	alert('b');
}

$(function(){
	$('#myButton').click( function(){
		alert('aa');
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
				if(data.STATUS == 1){  	//동적으로 div태그 달아주기.
					$("#previewimage").html("<div>"+data.FILENAME+"</div>");
					$("#BIMAGE").val(data.FILENAME);
					$("#previewimage").html("<img src='images/"+data.FILENAME+"' height='85' width='200'/>");
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
		<form method="post" action="admin_bannerUpdate" enctype="multipart/form-data">
			<input type="hidden" name="OLDIMAGE" value="${vo.BIMAGE}">
			<input type="hidden" name="BSEQ" value="${vo.BSEQ }">
			<h1 id="idcheckline">배너 수정</h1>
			배너 이름 : <input type="text" name="BNAME" style="font-size: 20px;" value="${vo.BNAME }"><br><br>
			기존 이미지<br>
			<img src="images/${vo.BIMAGE}" style="border-radius:5px; width:200px; height:85px"/>
			<br><br>
			<input type="hidden" name="BIMAGE" id="BIMAGE" value="">
	   		<div id="previewimage"></div>
			<input type="submit" id="bannersubmit" style="display:none">&nbsp;&nbsp;&nbsp;
			<label for="bannersubmit" style="cursor:pointer; font-size: 17px;">수정</label>
			<h3>${message }</h3>
		</form>
	</div>
	<form id="bimageForm" method="post" enctype="multipart/form-data">
		<input type="file" name="bannerImage"><input type="button" id="myButton" value="추가">
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