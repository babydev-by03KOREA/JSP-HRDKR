function Vote_Validate1() {
	// getElementByName은 배열로 해당 값을 받아옵니다.
	// 즉, ID값을 해당 document항목에 작성해서 가져오세요.
	// 자료형'var'은 요즘 JS에서는 사용하지 않는다고 생각해도 무방합니다.
	// checked & false
	let p_no = document.getElementById('P_NO');
	let p_name = document.getElementById('P_NAME');
	let p_birth = document.getElementById('P_BIRTH');
	let p_gender = document.getElementById('P_GENDER');
	let p_tel1 = document.getElementById('P_TEL1');
	let p_tel2 = document.getElementById('P_TEL2');
	let p_tel3 = document.getElementById('P_TEL3');
	let p_city1 = document.getElementById('P_CITY1').checked;
	let p_city2 = document.getElementById('P_CITY2').checked;
	let p_city3 = document.getElementById('P_CITY3').checked;
	let p_city4 = document.getElementById('P_CITY4').checked;
	
	if (p_no.value === ""){
		alert('환자코드를 입력하세요.');
		p_no.focus();
		return false;
	}
	
	if (p_no.value <= 5 && p_no.value <= 3){
		alert('환자코드는 4자리를 초과하거나, 작을 수 없습니다.');
		p_no.focus();
		return false;
	}
	
	if (p_name.value === ""){
		alert('환자 성명을 입력하세요.');
		p_name.focus();
		return false;
	}
	
	if (p_birth.value === ""){
		alert('환자 생년월일을 입력하세요.');
		p_birth.focus();
		return false;
	}
	
	if (p_birth.value <= 9){
		alert('주민등록상의 환자 생년월일 8자리를 입력해주세요.');
		p_birth.focus();
		return false;
	}
	
	if (p_gender.value === "null"){
		alert('환자 성별을 선택하세요.');
		p_gender.focus();
		return false;
	}
	
	if (p_tel1.value === ""){
		alert('전화번호 첫번째칸을 입력하세요(ex 010)');
		p_tel1.focus();
		return false;
	}
	
	if (p_tel1.value <= 4){
		alert('전화번호 첫번째칸은 3자리를 넘어갈 수 없습니다(+82,ROK)');
		p_tel1.focus();
		return false;
	}
	
	if (p_tel2.value === ""){
		alert('전화번호 두번째칸을 입력하세요(ex 010-해당번호-****)');
		p_tel2.focus();
		return false;
	}
	
	if (p_tel2.value <= 5){
		alert('전화번호 두번째칸은 4자리를 넘어갈 수 없습니다(+82,ROK)');
		p_tel2.focus();
		return false;
	}
	
	if (p_tel3.value === ""){
		alert('전화번호 세번째칸을 입력하세요(ex 010-****-해당번호)');
		p_tel3.focus();
		return false;
	}
	
	// p_tel3.value <=5 Error
/*	if (p_tel3.value <= 5){
		alert('전화번호 세번째칸은 4자리를 넘어갈 수 없습니다.');
		p_tel3.focus();
		return false;
	}*/
	
	if (p_city1 === false && p_city2 === false && p_city3 === false && p_city4 === false){
		alert('지역코드를 선택해주세요.');
		p_tel1.focus();
		return false;
	}
	ok();
	return true;
}
function ok(){
	alert('환자 DATA가 정상적으로 저장되었습니다.');
}