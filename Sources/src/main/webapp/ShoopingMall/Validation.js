function validate(){
	// 자동발생은 validation하지 않습니다.
	let custname = document.getElementById('custname');
	let phone = document.getElementById('phone');
	let address = document.getElementById('address');
	let joindate = document.getElementById('joindate');
	let grade = document.getElementById('grade');
	let city = document.getElementById('city');
	
	if(custname === ""){
		alert('회원성명이 입력되지 않았습니다.');
		custname.focus();
		return false;
	}
	
	if(phone === ""){
		alert('회원전화가 입력되지 않았습니다.');
		phone.focus();
		return false;
	}
	
	if(address === ""){
		alert('회원주소가 입력되지 않았습니다.');
		address.focus();
		return false;
	}
	
	if(joindate === ""){
		alert('가입일자가 입력되지 않았습니다.');
		joindate.focus();
		return false;
	}
	
	if(grade === ""){
		alert('고객등급이 입력되지 않았습니다.');
		grade.focus();
		return false;
	}
	
	if(city === ""){
		alert('도시코드가 입력되지 않았습니다.');
		city.focus();
		return false;
	}
	AllOk();
	return true;
}
function AllOk(){
	alert('회원등록이 완료 되었습니다!')
}