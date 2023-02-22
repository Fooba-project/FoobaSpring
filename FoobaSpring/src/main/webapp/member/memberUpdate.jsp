<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="memberMypageSub.jsp"%>

<style type="text/css">
	.join_list {position:relative;}
	.input_text {position:absolute; color:black; width:550px; color:black; right:0}
	.input_text_title {float:left; font-size:100%; line-height:40px}
</style>

<c:if test="${success=='1'}">
	<script type="text/javascript">
		alert('수정이 완료되었습니다.');
		location.href="index";
	</script>
</c:if>

<div class="member_join">
	<div class="member_join_title">회원정보수정 <span style="color:red;font-size:18px; ">${message }</span></div>
	<div style="border-top: 2px solid #fa6146; margin-top:15px;"></div>
	<form name="member_update_form" id="member_join_send_form" method="post" action="memberUpdate">
		<table class="member_join_table">
			<div class="join_list" >
				<span class="input_text_title">아이디(수정불가)</span>
				<input type="text" class="input_text" name="ID" value="${loginUser.ID}" readonly/>
			</div>
			<div class="join_list">
				<span class="input_text_title">비밀번호</span>
				<input type="password" class="input_text" name="PWD" id="userpwd" value="${loginUser.PWD}"/>
			</div>
			<div class="join_list">
				<span class="input_text_title">비밀번호확인</span>
				<input type="password" class="input_text" name="USERPWDCHK" id="userpwdchk" value="${loginUser.USERPWDCHK}"/>
			</div>
			<p class="error_text" id="error1"></p>
			<div class="join_list">
				<span class="input_text_title">이름(수정불가)</span>
				<input type="text" class="input_text" name="NAME" value="${loginUser.NAME}" readonly/>
			</div>
			<div class="join_list">
				<span class="input_text_title">전화번호</span>
				<input type="text" id="userphone" class="input_text" name="PHONE" maxlength="13" value="${loginUser.PHONE}" onkeyup="chkPhoneCode(event)"/>
			</div>
			<div class="join_list">
				<span class="input_text_title">이메일</span>
				<input type="text" class="input_text" name="EMAIL"  id="useremail" value="${loginUser.EMAIL}" />
			</div>
			<p class="error_text" id="error2"></p>
			<div class="join_list">
				<span class="input_text_title">우편번호</span>
				<input type="text" class="input_text" style="width: 350px; right:200px;" name="ZIP_NUM"  value="${loginUser.ZIP_NUM}" id="sample6_postcode" readonly />
				<input type="button" id="id_btn" style="position:absolute; right:0" value="우편번호 검색" onclick="sample6_execDaumPostcode()"> 
			</div>
			<div class="join_list">
				<span class="input_text_title">도로명 주소</span>
				<input type="text" class="input_text" name="ADDRESS1" value="${loginUser.ADDRESS1}"  id="sample6_address" readonly/>
			</div>
			<div class="join_list">
				<span class="input_text_title">상세 주소</span>
				<input type="text" class="input_text" name="ADDRESS2" value="${loginUser.ADDRESS2}" id="sample6_detailAddress"  />
			</div>
			<div class="join_list">
				<span class="input_text_title">(구주소)</span>
				<input type="text" class="input_text" name="ADDRESS3" value="${loginUser.ADDRESS3}" id="sample6_extraAddress" />
			</div>
			<div class="join_list" margin="20px">
				<span class="input_text_title">닉네임</span>
				<input type="text" class="input_text" name="NICK" value="${loginUser.NICK}"/><br>    		
			</div>
			<br>
            </table>
            <br><br>
			<div id="join_btn">
				<input class="join_btn" type="submit" value="정보수정" class="submit">			 
				<input class="join_btn" type="button" value="돌아가기" class="cancel" onclick="location.href='index'">
			</div>
		</div>
	</form>
</div>



    
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode({
			oncomplete: function(data) {
				var addr = ''; 
				var extraAddr = ''; 
				if (data.userSelectedType === 'R') {
					addr = data.roadAddress;
				} else { 
					addr = data.jibunAddress;
				}
				if(data.userSelectedType === 'R'){
					if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
						extraAddr += data.bname;
					}
					if(data.buildingName !== '' && data.apartment === 'Y'){
						extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
					}
					if(extraAddr !== ''){
						extraAddr = ' (' + extraAddr + ')';
					}
					document.getElementById("sample6_extraAddress").value = extraAddr;
				} else {
					document.getElementById("sample6_extraAddress").value = '';
				}
				document.getElementById('sample6_postcode').value = data.zonecode;
				document.getElementById("sample6_address").value = addr;
				document.getElementById("sample6_detailAddress").focus();
			}
		}).open();
	}
</script>
<%@ include file="../footer.jsp"%>