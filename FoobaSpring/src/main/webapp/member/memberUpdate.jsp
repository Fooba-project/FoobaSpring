<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="memberMypageSub.jsp"%>
<script type="text/javascript" src="/code.jquery.com/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="script/jquery-3.6.1.js"></script>
<script type="text/javascript" src="script/fooba.js"></script>
 
    <div class="member_join">
        <div class="member_join_title">회원정보수정</div>
        <div style="border-top: 2px solid #fa6146; margin-top:15px;"></div>
        <form name="member_update_form" id="member_join_send_form" method="post" action="memberUpdate">
            <table class="member_join_table">
                <div class="join_list" >
                    <input type="text" class="input_text" name="ID" value="id : ${loginUser.ID} (수정 불가)" style="color:black" readonly/>
                </div>

                <div class="join_list">
                    <input type="password" class="input_text" name="PWD" 
                    id="userpwd" placeholder="비밀번호" style="color:red;"/>
                </div>
				<div class="join_list">
                  <input type="password" class="input_text" name="USERPWDCHK" id="userpwdchk" placeholder="비밀번호 확인" style="color:red;"/>
                </div>
			
                <p class="error_text" id="error1"></p>
    
                <div class="join_list">
                    <input type="text" class="input_text" name="NAME" value="이름 : ${loginUser.NAME} (수정 불가)" style="color:black" readonly/>
                </div>

                <div class="join_list">
                    <input type="text" id="userphone" class="input_text" name="PHONE" maxlength="13" placeholder="전화번호 : ${loginUser.PHONE}" onkeyup="chkPhoneCode(event)" style="color:red;"/>
                </div>

                <div class="join_list">
                    <input type="text" class="input_text" name="EMAIL"  id="useremail" placeholder="이메일 : ${loginUser.EMAIL}" style="color:red;"/>
                </div>

                <p class="error_text" id="error2"></p>

                <div class="join_list">
                    <input type="text" class="input_text" style="width: 490px; color:red;" name="ZIP_NUM"  placeholder="우편번호  : ${loginUser.ZIP_NUM}"   id="sample6_postcode" readonly />
                    <input type="button" id="id_btn" value="우편번호 검색" onclick="sample6_execDaumPostcode()"> 
                </div>

                <div class="join_list">
                    <input type="text" class="input_text" name="ADDRESS1" placeholder="주소 : ${loginUser.ADDRESS1}" style="color:red;"  id="sample6_address" readonly/>
                </div>

                <div class="join_list">
                    <input type="text" class="input_text" name="ADDRESS2" placeholder="상세 주소1 : ${loginUser.ADDRESS2}" style="color:red;" id="sample6_detailAddress"  />
                </div>
				
				 <div class="join_list">
                    <input type="text" class="input_text" name="ADDRESS3" placeholder="상세 주소2 : ${loginUser.ADDRESS3}" style="color:red;" id="sample6_extraAddress" />
                </div>
				
                <div class="join_list" margin="20px">
                    <input type="text" class="input_text" name="NICK" placeholder="닉네임 : ${loginUser.NICK}" style="color:red;"/><br>
                    ${ message}               		
                </div>
                

                <br>
                
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
            </table>
            <br><br>
            <div id="join_btn">
            <input class="join_btn" type="submit" value="정보수정" class="submit" onclick="go_update();"> 
			<input class="join_btn" type="reset" value="취소" class="cancel" onclick="location.href='index'"></div>
            </div>
        </form>
    </div>
<%@ include file="../footer.jsp"%>