function validateJoin(){
	let userid = document.getElementById('USERID');
	let usernm = document.getElementById('USERNM');
	let passwd = document.getElementById('PASSWD');
	let repasswd = document.getElementById('REPASSWD');
	let jumin1 = document.getElementById('JUMIN1');
	let jumin2 = document.getElementById('JUMIN2');
	let gender1 = document.getElementById('GENDER1').checked;
	let gender2 = document.getElementById('GENDER2').checked;
	let address = document.getElementById('ADDRESS');
	let jobcd = document.getElementById('JOBCD');
	
	if(userid.value === ""){
		alert('아이디가 입력되지 않았습니다!');
		userid.focus();
		return false;
	}
	
	if(userid.value.length < 4 || userid.value.length > 12){
		alert('아이디는 4~12자 이내로 입력가능합니다.');
		userid.focus();
		return false;
	}
	
	if(usernm.value === ""){
		alert('이름이 입력되지 않았습니다!');
		usernm.focus();
		return false;
	}
	if(passwd.value === ""){
		alert('비밀번호가 입력되지 않았습니다!');
		passwd.focus();
		return false;
	}
	if(passwd.value.length < 4){
		alert('비밀번호는 4자리 이상이여야만 합니다!');
		passwd.focus();
		return false;
	}
	if(passwd.value != repasswd.value){
		alert('비밀번호가 일치하지 않습니다!');
		repasswd.focus();
		return false;
	}
	if(jumin1.value.length < 6 || jumin1.value.length > 6){
		alert('주민등록번호 첫째자리는 6자리여야만 합니다!');
		jumin1.focus();
		return false;
	}
	if(jumin2.value.length < 7 || jumin2.value.length > 7){
		alert('주민등록번호 뒷자리는 7자리여야만 합니다!');;
		jumin2.focus();
		return false;
	}
	if(gender1 === false && gender2 === false){
		alert('성별을 선택해주세요!');
		jumin2.focus();
		return false;
	}
	if(address.value === ""){
		alert('주소를 입력해주세요!');
		address.focus();
		return false;
	}
	if(jobcd.value === "null"){
		alert('직업을 선택해주세요!');
		jobcd.focus();
		return false;
	}
	MansaOK();
	return true;
}
function MansaOK(){
	alert('회원가입에 성공하였습니다!');		
}
