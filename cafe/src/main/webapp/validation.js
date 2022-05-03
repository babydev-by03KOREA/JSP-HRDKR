function validate1(){
	let id = document.getElementById('saleno');
	let pcode = document.getElementById('pcode');
	let saledate = document.getElementById('saledate');
	let scode = document.getElementById('scode');
	let amount = document.getElementById('amount');
	
	if (id.value === ""){
		alert("판매번호가 입력되지 않았습니다.");
		id.focus();
		return false;
	}
	
	if (pcode.value === "null"){
		alert("상품코드를 선택하세요.");
		pcode.focus();
		return false;
	}
	
	if (saledate.value === ""){
		alert("판매날짜를 입력하세요.");
		saledate.focus();
		return false;
	}
	
	if (scode.value === "null"){
		alert("매장코드를 선택하세요.");
		scode.focus();
		return false;
	}
	
	if (amount.value === ""){
		alert("판매수량을 입력하세요.");
		amount.focus();
		return false;
	}
	
	validateok();
	return true;
}
function validateok(){
	alert("입력이 완료되었습니다!");
}