function validate1(){
	let resvno = document.getElementById('RESVNO');
	let jumin = document.getElementById('JUMIN');
	let vcode = document.getElementById('VCODE');
	let hospcode = document.getElementById('HOSPCODE');
	let resvdate = document.getElementById('RESVDATE');
	let resvtime = document.getElementById('RESVTIME');
	
	if (resvno.value === ""){
		alert('접종 예약번호가 입력되지 않았습니다.');
		resvno.focus();
		return false;
	}
	
	if (jumin.value === ""){
		alert('주민번호가 입력되지 않았습니다.');
		jumin.focus();
		return false;
	}
	
	if (vcode.value === ""){
		alert('백신 코드가 입력되지 않았습니다.');
		vcode.focus();
		return false;
	}
	
	if (hospcode.value === ""){
		alert('백신 코드가 입력되지 않았습니다.');
		hospcode.focus();
		return false;
	}
	
	if (resvdate.value === ""){
		alert('예약일자가 입력되지 않았습니다.');
		resvdate.focus();
		return false;
	}
	
	if (resvtime.value === ""){
		alert('예약시간이 입력되지 않았습니다.');
		resvtime.focus();
		return false;
	}
	MansaOK();
	return true;
}
function MansaOK(){
	alert('접종 예약 정보가 등록 되었습니다!');
}
function restart(){
	alert('정보를 지우고 처음부터 다시 입력합니다!');
	return true;
}