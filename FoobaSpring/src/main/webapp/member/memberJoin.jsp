<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

    <div class="member_join">
        <div class="member_join_title">회원가입</div>
        <div style="border-top: 2px solid #fa6146; margin-top:15px;"></div>
        <form name="member_join_send_form" id="member_join_send_form" method="post" action="fooba.do?command=memberJoin">
            <table class="member_join_table">
                <div class="join_list">
                    <input type="text" class="input_text" style="width: 490px;" name="userid" placeholder="아이디" onkeyup="chkIdCode(event)" value="${dto.id}"/>
                    <input type="hidden" name="userreid" value="${dto.userreid}"/>
                    <input type="button" id="id_btn" value="중복 확인" onclick="idcheck()">
                </div>

                <div class="join_list">
                    <input type="password" class="input_text" name="userpwd" 
                    id="userpwd"
                    placeholder="비밀번호"/>
                </div>

                <div class="join_list">
                    <input type="password" class="input_text" name="userpwdchk" id="userpwdchk" placeholder="비밀번호 확인"/>
                </div>

                <p class="error_text" id="error1"></p>
    
                <div class="join_list">
                    <input type="text" class="input_text" name="username" placeholder="이름" value="${dto.name}"/>
                </div>

                <div class="join_list">
                    <input type="text" id="userphone" class="input_text" name="userphone" placeholder="전화번호" maxlength="13"  
                    value="${dto.phone}" onkeyup="chkPhoneCode(event)"/>
                </div>

                <div class="join_list">
                    <input type="text" class="input_text" name="useremail"
                    id="useremail"
                    placeholder="이메일" value="${dto.email}"/>
                </div>

                <p class="error_text" id="error2"></p>

                <div class="join_list">
                    <input type="text" class="input_text" style="width: 490px;" name="userzip_num" placeholder="우편번호"  value="${dto.zip_num}" id="sample6_postcode" readonly />
                    <input type="button" id="id_btn" value="우편번호 검색" onclick="sample6_execDaumPostcode()"> 
                </div>

                <div class="join_list">
                    <input type="text" class="input_text" name="useraddress1" placeholder="주소"  value="${dto.address1}" id="sample6_detailAddress"  readonly />
                </div>

                <div class="join_list">
                    <input type="text" class="input_text" name="useraddress2" placeholder="상세 주소"  value="${dto.address2}"  id="sample6_extraAddress" />
                </div>

                <div class="join_list" margin="20px">
                    <input type="text" class="input_text" name="usernick" placeholder="닉네임(별명)" value="${dto.nick}"/>
                </div>

                <p class="error_text">* 입력하지 않을 시 이름으로 사용됩니다.</p>

                <br>
                <div id="join_agree_btn">
                    <input type="checkbox" name="useragree" id="join_agree" value="Y">
                    <label for="join_agree">이용약관</label>
                </div>
                <div id="join_agree_text">
                    <h3 style="text-align: center;">제1장 총칙</h3>
                    <h5>제1조 [목 적]</h5>
                    <p>본 서비스 약관은 주식회사 푸바에서 제공하는 서비스의 이용에 관련하여 회원과 푸바 간의 권리, 의무, 책임 및 기타 필요한 사항을 규정함을 목적으로 합니다.</p>
                </div>
  
         <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
			<script>
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
			 </table>
            <br><br>
            <div id="join_btn">
                <input class="join_btn" type="button" value="가입" onclick="joincheck()">
                <input class="join_btn" type="button" value="홈으로" onclick="location.href='fooba.do?command=index'">
            </div>
        </form>
    </div>
<%@ include file="../footer.jsp"%>