<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ include file="res_header.jsp"%>
<script type="text/javascript" src="/code.jquery.com/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="script/jquery-3.6.1.js"></script>
<script type="text/javascript">


$( function(){
    $("#respwdchk").keyup( function(event){
    	
        event.target.value = event.target.value.trim();
        let pass1 = $("#rpwd").val();
        let pass2 = $("#respwdchk").val();
        if (pass1 != "" || pass2 != ""){
            if (pass1 == pass2){
                $("#error1").html('');
                
            } else {
                $("#error1").html('비밀번호가 일치하지 않습니다.');
                $("#error1").css('color','red');
            }
        }
    })

    $("#rpwd").keyup( function(event){
        event.target.value = event.target.value.trim();
        let pass1 = $("#rpwd").val();
        let pass2 = $("#respwdchk").val();
        if (pass1 != '' && pass2 != ''){
            if (pass1 == pass2){
                $("#error1").html('');
            } else {
                $("#error1").html('비밀번호가 일치하지 않습니다.');
                $("#error1").css('color','red');
            }
        }
    })
} )





function chkIdCode(event) {
    const regExp = /[^0-9a-zA-Z]/g;
    if (regExp.test(event.target.value)) {
        event.target.value = event.target.value.replace(regExp, '');
    }
}


   
</script>
<div class="res_join">
    <div class="res_join_title">사업자 회원가입 <span style="color:blue;font-size:18px; ">${message }</span></div>
    <div style="border-top: 2px solid  rgb(255,204,0); margin-top:15px;"></div>
    <form name="res_join_send_form" id="res_join_send_form" method="post" action="res_join" >
        <table class="member_join_table">
            <div class="join_list">
                <input type="text" class="input_text" style="width: 490px;" id="rid" name="RID" placeholder="아이디" onkeyup="chkIdCode(event)" value="${vo.RID}"/>
                <input type="hidden" name="reid" value="${reid}" id="reid"/>
                <input type="button" id="id_btn" value="중복 확인" onclick="res_idcheck()">
            </div>

            <div class="join_list">
                <input type="password" class="input_text" name="RPWD" 
                id="rpwd" value="${vo.RPWD }"
                placeholder="비밀번호"/>
            </div>

            <div class="join_list">
                <input type="password" class="input_text" name="respwdchk" id="respwdchk" placeholder="비밀번호 확인"/>
            </div>

            <p class="error_text" id="error1"></p>
    
            <div class="join_list">
                <input type="text" class="input_text" name="OWNERNAME" placeholder="사업자 이름" value="${vo.OWNERNAME}"/>
            </div>

            <div class="join_list">
                <input type="text" class="input_text" name="RNAME" placeholder="가게 이름"  value="${vo.RNAME }"/>
            </div>

            <div class="join_list">
                <input type="text" id="rbiznum" class="input_text" name="RBIZNUM" value="${vo.RBIZNUM}" maxlength="12" placeholder="사업자 등록번호" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
            </div>

            <div class="join_list">
                <input type="text" class="input_text" name="RPHONE"
                maxlength="13" id="rphone" value="${vo.RPHONE}"
                 placeholder="가게 전화번호" onkeyup="chkPhoneCode(event)"/>
            </div>

            <div class="join_list">
                <input type="text"  id="sample6_postcode" class="input_text" style="width: 490px;" name="ZIP_NUM" placeholder="우편번호" value="${vo.ZIP_NUM}" readonly/>
                <input type="button" id="id_btn"  onclick="sample6_execDaumPostcode()" class="dup" value="우편번호 찾기"> 
            </div>
			
			<div class="join_list">
               <input type="text" class="input_text" name="RADDRESS"
                id="sample6_address"   value="${vo.RADDRESS}"
                 placeholder="사업장 주소" readonly/>
            </div>
            
			<div class="join_list">
                <input type="text" class="input_text" name="RADDRESS2"
                  id="sample6_detailAddress"   value="${vo.RADDRESS2}"
                 placeholder="상세 주소"/>
            </div>
            
            <div class="join_list">
                <input type="text" class="input_text" name="RADDRESS3"
                 id="sample6_extraAddress" value="${vo.RADDRESS3}"
                 readonly/>
            </div>
            
            
     
		 
                <div class="member_join_title">
                    사업장 정보 입력
                </div>
                <div style="border-top:2px solid  rgb(255,204,0); margin-top:15px;">
                </div>
                
                
            
               
                   
                <div class="res_text_boxs">
                    사업장 업종 분류 &nbsp;&nbsp;&nbsp;
                
                    <select style="width:60px;" name="KIND" >
                        <option value="1">한식</option>
                        <option value="2">중식</option>
                        <option value="3">양식</option>
                        <option value="4">일식</option>
                        <option value="5">피자</option>
                        <option value="6">치킨</option>
                        <option value="7">분식</option>
                        <option value="8">디저트</option>
                    </select>
                </div>
                 
                <div id="textarea_box">
                    <textarea placeholder="사업장 소개글을 작성해주세요(100자 이내)" name="CONTENT" maxlength="100" style="resize:none; font-weight: 900;" >${vo.CONTENT }</textarea>
                </div>
                <div class="join_list">
                    <input type="text" class="input_text" name="RTIP" maxlength="4" placeholder="기본배달료를 입력하세요" value="${vo.RTIP }" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" >
                </div>
                <div class="join_list">
                    <input type="text" class="input_text" name="HASH" value="${vo.HASH }" placeholder="해시태그 예시) &nbsp; 국물음식, 건강한, 가성비">
                </div>
                
                 <div class="res_text_boxs">
                     가게 대표이미지
                </div> 
                    <div id="images_upload_box" style="height:200px">
                         <input type="hidden" class="input_text" name="RIMAGE" id="fileimage" value="${vo.RIMAGE }">
                         <div id="filename">
                         	<c:if test="${not empty vo.RIMAGE}">
				   				<img src='images/title/${vo.RIMAGE }' height='170' width='400'/>
				   			</c:if>
                    	</div>
                
                </div>
                <div id="join_agree_btn">
                    <input type="checkbox" name="res_agree" id="join_agree" value="Y">
                    <label for="join_agree">이용약관</label>
                </div>
                <div id="join_agree_text">
                     <h3 style="text-align: center;">제1장 총칙</h3>
                    <h5>제1조 [목 적]</h5>
                    <p>본 서비스 약관은 주식회사 푸바에서 제공하는 서비스의 이용에 관련하여 회원과 푸바 간의 권리, 의무, 책임 및 기타 필요한 사항을 규정함을 목적으로 합니다.</p>
                </div>
            
            
        </table>
            <div id="join_btn"  style="position:absolute; bottom:100px;">
                <input class="join_btn" type="submit" value="가입" >
                <input class="join_btn" type="button" value="홈으로" onclick="location.href='res_login'">
            </div>
    </form>
    
    <div style="position:absolute; bottom:400px;">
		<form name="fromm" id="fileupForm2" method="post" enctype="multipart/form-data">
					&nbsp;&nbsp;<input type="file" name="fileimage"><input type="button" id="myButton2" value="추가">
		</form>
	
	</div>
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J) 
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("sample6_extraAddress").value = extraAddr;
                
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}
</script>
<%@ include file="res_footer.jsp"%>