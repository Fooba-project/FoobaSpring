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
                var _val =  event.target.value.trim();
                event.target.value = autoHypenPhone(_val);
            }

            const regExp3 = /^[a-zA-Z]*$/;
            if (regExp3.test(event.target.value)) {
                event.target.value = event.target.value.replace(regExp3, '');
            }
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
        } )
        
        
 function joincheck() {
		if(document.member_join_send_form.userid.value.length==0){
			alert("아이디를 입력하세요");
			document.member_join_send_form.userid.focus();
		}
		else if(document.member_join_send_form.userreid.value.length==0){
			alert("아이디 중복확인을 하지 않았습니다.");
			document.member_join_send_form.userid.focus();		
		}
		else if(document.member_join_send_form.userreid.value != document.member_join_send_form.userid.value){
			alert("아이디 중복확인을 하지 않았습니다.");
			document.member_join_send_form.userid.focus();	
		}
		else if(document.member_join_send_form.userpwd.value.length==0){
			alert("비밀번호를 입력하세요.");
			document.member_join_send_form.userpwd.focus();
		}
		else if(document.member_join_send_form.userpwd.value != document.member_join_send_form.userpwdchk.value){
			alert("비밀번호 확인이 일치하지 않습니다.");
			document.member_join_send_form.userpwdchk.focus();
		}
		else if(document.member_join_send_form.username.length==0){
			alert("이름을 입력하세요.");
			document.member_join_send_form.username.focus();
		}
		else if(document.member_join_send_form.userphone.value.length==0){
			alert("전화번호를 입력하세요.");
			document.member_join_send_form.userphone.focus();
		} 
		else if(document.member_join_send_form.useremail.value.length==0){
			alert("이메일을 입력하세요.");
			document.member_join_send_form.useremail.focus();
		}
		else if(document.member_join_send_form.useraddress1.value.length==0){
			alert("주소를 입력하세요.");
			post_zip();
		}
		else if(document.member_join_send_form.useraddress2.value.length==0){
			alert("주소를 입력하세요.");
			document.member_join_send_form.useraddress2.focus();
		}
		else if( document.member_join_send_form.useragree.checked==false){
			alert("약관에 동의하셔야 회원가입이 가능합니다.");
			document.member_join_send_form.useragree.focus();
		}
		else {
			document.member_join_send_form.submit();
		}
}

function idcheck(){
	if( document.member_join_send_form.userid.value=="" ){
		alert("아이디를 입력하고 중복체크를 진행하세요" );
		documnet.member_join_send_form.userid.focus();
		return;
	}
	var url = "fooba.do?command=memberIdCheckForm&userid=" + document.member_join_send_form.userid.value;
	var opt = "toolbar=no, menubar=no, resizable=no, width=500, height=250, scrollbars=no";
	window.open(url, "IdCheck", opt);	
}


function loginCheck(){
	if(document.loginForm.userid.value==""){
		alert("아이디는 필수입력사항입니다");
		document.loginForm.userid.focus();
		return false;
	}else if(document.loginForm.userpw.value==""){
		alert("비밀번호는 필수입력사항입니다");
		document.loginForm.userpw.focus();
		return false;
	}else{
		return true;	
	}	
}

function idok( userid ){
	opener.member_join_send_form.userid.value = userid;
	opener.member_join_send_form.userreid.value = userid;
	self.close();
}



function post_zip(){
	var url = "fooba.do?command=memberFindZipNum";
	var opt = "toolbar=no, menubar=no, scrollbars=no, resizable=no, width=550, height=500, top=100, left=700";
	window.open( url, "우편번호 찾기", opt);
}




function result( zip_num, sido, gugun, dong){
	//  함수 호출 형태 - result( '123-123', '서울시', '서대문구',  '대현동')
	opener.document.member_join_send_form.userzip_num.value=zip_num;
	opener.document.member_join_send_form.useraddress1.value=sido+" "+gugun+" "+dong;
	self.close();
}


function go_update(){
	if ((document.member_update_form.userpwd.value != document.member_update_form.userpwdchk.value)) {
	    alert("비밀번호가 일치하지 않습니다.");
	    document.member_update_form.userpwd.focus();
	}
	else {
	    document.member_update_form.action = "fooba.do?command=memberUpdate";
	    document.member_update_form.submit();
	}
}

var menunumm=0;

function menumove(x){
    if(x==-1&&menunumm==0)return;
    if(x==1&&menunumm==1)return;

    if(x==-1){menunumm--;
                document.getElementById("menutabb").style.background='#fa6146';
                document.getElementById("menutabb").style.border='1px solid #fa6146';
                document.getElementById("jengbotabb").style.background='#ffb6a9';
                document.getElementById("jengbotabb").style.border='1px solid #ffb6a9';
				document.getElementById('menujengbo').scrollTop = 0;
				document.getElementById('tul').scrollTop = 0;
            }
            if(x==1){menunumm++;
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

function go_search(hash){
	var url = "fooba.do?command=search&hash="+ hash;  
	document.search.action = url;
	document.search.submit();
}       


  
 function withdrawalMember(){
 	var ok=confirm("정말 탈퇴하겠습니까?");
 	if(ok){
		location.href="fooba.do?command=memberWithdrawal";
	}
}

 function menupopup(fseq){
  
	var popupX = (window.screen.width / 2) - 230;
     window.open("fooba.do?command=menupopup&fseq="+fseq,"메뉴 상세","width=462, height=786, menubar=no, status=no, toolbar=no, top=100 , left="+ popupX);
 } 
  
  function deleteejb(cseq,rseq){
	var ok=confirm("장바구니에서 삭제하시겠습니까?");
	if(ok) location.href="fooba.do?command=deleteCartmenu&cseq="+cseq+"&rseq="+rseq;
    else return;
   }
   
   
    
    var nummx=0;
     function jusomove(x){
        if(x==-1&&nummx==0)return;
        if(x==1&&nummx==1)return;

        if(x==-1){nummx--;
            document.getElementById("jusotabb").style.background='#fa6146';
            document.getElementById("jusotabb").style.border='1px solid #fa6146';
            document.getElementById("newjusotabb").style.background='#ffb6a9';
            document.getElementById("newjusotabb").style.border='1px solid #ffb6a9';
            document.getElementById("bdjs").value=0;

        }
        if(x==1){nummx++;
            document.getElementById("jusotabb").style.background='#ffb6a9';
            document.getElementById("jusotabb").style.border='1px solid #ffb6a9';
            document.getElementById("newjusotabb").style.background='#fa6146';
            document.getElementById("newjusotabb").style.border='1px solid #fa6146';
            document.getElementById("bdjs").value=1;
            
        }
        var dist=nummx*600*-1;
        document.getElementById("tul2").style.left=dist+'px';
    }
    
 function goPay(a,b){
 	
	if (a==b){
 	alert('음식을 주문표에 담으세요.');
 	return false;
 	}
 	else  { return true;}
 }
 
var kk=0;
function pojang(a){
    if(kk==0){
        document.getElementById("badal").value='포장   ';
        document.getElementById("jbtotalprice").value=document.getElementById("jbtotalprice").value-a;
        kk=1;
    }
}
function baedal(a){
    if(kk==1){
        document.getElementById("badal").value='배달요금 : '+a+'원 별도   ';
        document.getElementById("jbtotalprice").value=parseInt(a)+parseInt(document.getElementById("jbtotalprice").value);
        kk=0;
    }
}

function jusochoice(){
	if(document.getElementById("bdjs").value==1){
		if(document.member_join_send_form.useraddress1.value.length==0){
			alert("주소를 입력하세요.");
			post_zip();
			return false;
		}else if(document.member_join_send_form.useraddress2.value.length==0){
			alert("상세 주소를 입력하세요.");
			document.member_join_send_form.useraddress2.focus();
			return false;			
		}else if(document.member_join_send_form.phone.value.length==0){
			alert("전화번호를 입력하세요.");
			document.member_join_send_form.phone.focus();
			return false;
		} 
	}
	var ok=confirm("결제하시겠습니까?");
	return ok;
}
 