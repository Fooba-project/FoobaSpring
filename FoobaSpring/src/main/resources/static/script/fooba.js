function autoHypenPhone(str){ 
   str = str.replace(/[^0-9]/g, '');
   var tmp = '';
   if( str.length < 4){
      return str;
   }else if(str.length < 7){
      tmp += str.substr(0, 3);
      tmp += '-';
      tmp += str.substr(3);
      return tmp;
   }else if(str.length < 11){
      tmp += str.substr(0, 3);
      tmp += '-';
      tmp += str.substr(3, 3);
      tmp += '-';
      tmp += str.substr(6);
      return tmp;
   }else{ 
       tmp += str.substr(0, 3);
      tmp += '-';
      tmp += str.substr(3, 4);
      tmp += '-';
      tmp += str.substr(7);
      return tmp;
   }
   return str;
}


$( function(){
	$("#userpwdchk").keyup( function(event){
		event.target.value = event.target.value.trim();
		let pass1 = $("#userpwd").val();
		let pass2 = $("#userpwdchk").val();
		if (pass1 != "" || pass2 != ""){
			if (pass1 == pass2){
				$("#error1").html('');
			} else {
				$("#error1").html('비밀번호가 일치하지 않습니다.');
				$("#error1").css('color','red');
			}
		}
	})

	$("#userpwd").keyup( function(event){ 
		event.target.value = event.target.value.trim();
		let pass1 = $("#userpwd").val();
		let pass2 = $("#userpwdchk").val();
		if (pass1 != '' && pass2 != ''){
			if (pass1 == pass2){
				$("#error1").html('');
			} else {
				$("#error1").html('비밀번호가 일치하지 않습니다.');
				$("#error1").css('color','red');
			}
		}
	})

	$("#useremail").keyup( function(event){
		const regExp = /[ㄱ-ㅎㅏ-ㅣ가-힣]/g;
		event.target.value = event.target.value.trim();
		if (regExp.test(event.target.value)) {
			event.target.value = event.target.value.replace(regExp, '');
		}
		let email = $("#useremail").val();
		var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
		if (!reg_email.test(email)){
			$("#error2").html('이메일 형식이 잘못되었습니다.');
			$("#error2").css('color','red');
		} else {
			$("#error2").html('');
		}
	})
})

function chkIdCode(event) {
   const regExp = /[^0-9a-zA-Z]/g;
   if (regExp.test(event.target.value)) {
      event.target.value = event.target.value.replace(regExp, '');
   }
}

function chkPhoneCode(event){
   const regExp1 = /[^0-9a-zA-Z]/g;
   if (regExp1.test(event.target.value)) {
      event.target.value = event.target.value.replace(regExp1, '');
   }

   const regExp2 = /[0-9]/g;
   if (regExp2.test(event.target.value)) {
      var _val = event.target.value.trim();
      event.target.value = autoHypenPhone(_val);
   }

   const regExp3 = /^[a-zA-Z]*$/;
      if (regExp3.test(event.target.value)) {
      event.target.value = event.target.value.replace(regExp3, '');
   }
}

 

function joincheck() {
   if(document.member_join_send_form.ID.value.length==0){
      alert("아이디를 입력하세요");
      document.member_join_send_form.ID.focus();
   }else if(document.member_join_send_form.REID.value.length==0){
      alert("아이디 중복확인을 하지 않았습니다.");
      document.member_join_send_form.ID.focus();      
   }else if(document.member_join_send_form.REID.value != document.member_join_send_form.ID.value){
      alert("아이디 중복확인을 하지 않았습니다.");
      document.member_join_send_form.ID.focus();   
   }else if(document.member_join_send_form.PWD.value.length==0){
      alert("비밀번호를 입력하세요.");
      document.member_join_send_form.PWD.focus();
   }else if(document.member_join_send_form.PWD.value != document.member_join_send_form.USERPWDCHK.value){
      alert("비밀번호 확인이 일치하지 않습니다.");
      document.member_join_send_form.USERPWDCHK.focus();
   }else if(document.member_join_send_form.NAME.length==0){
      alert("이름을 입력하세요.");
      document.member_join_send_form.NAME.focus();
   }else if(document.member_join_send_form.PHONE.value.length==0){
      alert("전화번호를 입력하세요.");
      document.member_join_send_form.PHONE.focus();
   }else if(document.member_join_send_form.EMAIL.value.length==0){
      alert("이메일을 입력하세요.");
      document.member_join_send_form.EMAIL.focus();
   }else if(document.member_join_send_form.ADDRESS1.value.length==0){
      alert("주소를 입력하세요.");
      post_zip();
   }else if(document.member_join_send_form.ADDRESS2.value.length==0){
      alert("주소를 입력하세요.");
      document.member_join_send_form.ADDRESS2.focus();
   }else if( document.member_join_send_form.useragree.checked==false){
      alert("약관에 동의하셔야 회원가입이 가능합니다.");
      document.member_join_send_form.useragree.focus();
   } else document.member_join_send_form.submit();
}

function idcheck(){
   if( document.member_join_send_form.ID.value=="" ){
      alert("아이디를 입력하고 중복체크를 진행하세요" );
      documnet.member_join_send_form.ID.focus();
      return;
   }
   var ID = document.member_join_send_form.ID.value;
   var opt = "toolbar=no, menubar=no, resizable=no, width=500, height=250, scrollbars=no";
   window.open("memberIdCheck?ID=" + ID, "Id check", opt);   
}


function loginCheck(){
   if(document.loginForm.ID.value==""){
      alert("아이디는 필수입력사항입니다");
      document.loginForm.ID.focus();
      return false;
   }else if(document.loginForm.PWD.value==""){
      alert("비밀번호는 필수입력사항입니다");
      document.loginForm.PWD.focus();
      return false;
   }else{
      return true;   
   }   
}

function idok( ID ){
   opener.member_join_send_form.ID.value = ID;
   opener.member_join_send_form.REID.value = ID;
   self.close();
}

function post_zip(){
   var url = document.memberFindZipNum;
   var opt = "toolbar=no, menubar=no, scrollbars=no, resizable=no, width=550, height=500, top=100, left=700";
   window.open( url, "우편번호 찾기", opt);
}

function result( zip_num, sido, gugun, dong){
   // 함수 호출 형태 - result( '123-123', '서울시', '서대문구', '대현동')
   opener.document.member_join_send_form.zip_num.value=zip_num;
   opener.document.member_join_send_form.address1.value=sido+" "+gugun+" "+dong;
   self.close();
}


function go_update(){
   if ((document.member_update_form.PWD.value != document.member_update_form.USERPWDCHK.value)) {
      alert("비밀번호가 일치하지 않습니다.");
      document.member_update_form.PWD.focus();
   } else {
      document.member_update_form.action = "memberUpdate";
      document.member_update_form.submit();
   }
}

var menunumm=0;

function menumove(x){
   if(x==-1&&menunumm==0)return;
   if(x==1&&menunumm==1)return;
   if(x==-1){ 
      menunumm--;
      document.getElementById("menutabb").style.background='#fa6146';
      document.getElementById("menutabb").style.border='1px solid #fa6146';
      document.getElementById("jengbotabb").style.background='#ffb6a9';
      document.getElementById("jengbotabb").style.border='1px solid #ffb6a9';
      document.getElementById('menujengbo').scrollTop = 0;
      document.getElementById('tul').scrollTop = 0;
   }
   if(x==1){
      menunumm++;
      document.getElementById("menutabb").style.background='#ffb6a9';
      document.getElementById("menutabb").style.border='1px solid #ffb6a9';
      document.getElementById("jengbotabb").style.background='#fa6146';
      document.getElementById("jengbotabb").style.border='1px solid #fa6146';
      document.getElementById('menujengbo').scrollTop = 0;
      document.getElementById('tul').scrollTop = 0;
   }
   var dist=menunumm*700*-1;
   document.getElementById("tul").style.left=dist+'px';
}

function go_search2(){
   document.search.submit();
}

function go_search(HASH){
   var url = "search?HASH="+ HASH; 
   document.search.action = url;
   document.search.submit();
} 

function withdrawalMember(){
   var ok=confirm("정말 탈퇴하겠습니까?");
   if(ok){
      location.href="withdrawalMember";
   }
}

function menupopup(FSEQ){
   var popupX = (window.screen.width / 2) - 230;
   window.open("menupopup?FSEQ="+FSEQ,"메뉴 상세","width=462, height=786, menubar=no, status=no, toolbar=no, top=100 , left="+ popupX);
} 
 
function deleteejb(CSEQ,RSEQ){
   var ok=confirm("장바구니에서 삭제하시겠습니까?");
   if(ok) location.href="deleteCartmenu?CSEQ="+CSEQ+"&RSEQ="+RSEQ;
else return;
}
 
var nummx=0;

function jusomove(x){
   if(x==-1&&nummx==0)return;
   if(x==1&&nummx==1)return;
   if(x==-1){
      nummx--;
      document.getElementById("jusotabb").style.background='#fa6146';
      document.getElementById("jusotabb").style.border='1px solid #fa6146';
      document.getElementById("newjusotabb").style.background='#ffb6a9';
      document.getElementById("newjusotabb").style.border='1px solid #ffb6a9';
      document.getElementById("bdjs").value=0;
   }
   if(x==1){
      nummx++;
      document.getElementById("jusotabb").style.background='#ffb6a9';
      document.getElementById("jusotabb").style.border='1px solid #ffb6a9';
      document.getElementById("newjusotabb").style.background='#fa6146';
      document.getElementById("newjusotabb").style.border='1px solid #fa6146';
      document.getElementById("bdjs").value=1;
   }
   var dist=nummx*600*-1;
   document.getElementById("tul2").style.left=dist+'px';
}

var kk=0;
function pojang(a){
   if(kk==0){
      document.getElementById("badal").value='포장 ';
      document.getElementById("jbtotalprice").value=document.getElementById("jbtotalprice").value-a;
      kk=1;
   }
}

function baedal(a){
   if(kk==1){
      document.getElementById("badal").value='배달요금 : '+a+'원 별도 ';
      document.getElementById("jbtotalprice").value=parseInt(a)+parseInt(document.getElementById("jbtotalprice").value);
      kk=0;
   }
}

function goPay(){
	var1 = document.frm.carttotalprice.value;
	var2 = document.frm.RTIP.value;
	var3 = document.frm.ID.value;
	if ( var3==''){
		location.href="loginForm";
		return false;
	}else if(var1 == var2){
		alert('음식을 주문표에 담으세요.');
		return false;
	}else{ return true;}
}
 
function jusochoice(){
	if(document.getElementById("bdjs").value==1){
		if(document.member_join_send_form.ZIP_NUM.value.length==0){
			alert("주소를 입력하세요.");
			sample6_execDaumPostcode();
			return false;
		}else if(document.member_join_send_form.ADDRESS2.value.length==0){
			alert("상세 주소를 입력하세요.");
			document.member_join_send_form.ADDRESS2.focus();
			return false;			
		}else if(document.member_join_send_form.PHONE.value.length==0){
			alert("전화번호를 입력하세요.");
			document.member_join_send_form.PHONE.focus();
			return false;
		} 
	}
	var ok=confirm("결제하시겠습니까?");
	return ok;
}

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