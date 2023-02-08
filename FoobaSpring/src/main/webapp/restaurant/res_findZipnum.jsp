<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/fooba.css" rel="stylesheet">
<script type="text/javascript" src="/code.jquery.com/jquery-2.1.3.min.js"></script>
<script src = "script/jquery-3.6.1.js"></script>
<script type="text/javascript">
function result( zip_num, sido, gugun, dong){
	//  함수 호출 형태 - result( '123-123', '서울시', '서대문구',  '대현동')
	opener.document.res_join_send_form.zip_num.value=zip_num;
	opener.document.res_join_send_form.raddress1.value=sido+" "+gugun+" "+dong;
	self.close();
}
</script>
</head>
<body>
<div id="popup">
    <div id="popup_text">
		<h1>우편번호 검색</h1>
		<form method="post" name="formm" action="fooba.do">
			<input type="hidden"  name="command" value="res_findZipNum">
				<input name="dong" id="dongtext" type="text" placeholder="주소를 입력하세요.">
                 <input type="submit" value=" " class="submit" id="eheqhrl">
		</form> 
		<table id="zipcodee">
			<tr><th width="100">우편번호</th><th>주소</th></tr>
			<c:forEach items="${addressList }" var="add">
				<tr>
					<td>
						<a class="zipa" href="#" onClick="result('${add.zip_num}','${add.sido }','${add.gugun }','${add.dong }');">
							${add.zip_num }
						</a>
					</td>
					<td>
					<a class="zipa" href="#" onClick="result('${add.zip_num}','${add.sido }','${add.gugun }','${add.dong }');">
							${add.sido } ${add.gugun } ${add.dong }
						 </a>
					</td>
				</tr>	
			</c:forEach>
		 </table>
    </div>
</div>
</body>
</html>