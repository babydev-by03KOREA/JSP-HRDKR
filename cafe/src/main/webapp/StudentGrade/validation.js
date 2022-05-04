function validate(){
	var id = document.getElementById("id");
	var name = document.getElementById("name");
	var gender1 = document.getElementById("gender1").checked;
	var gender2 = document.getElementById("gender2").checked;
	
	if (id.value === ""){
		alert("학번을 입력하세요.");
		id.focus();
		return false;
	}
	
	if (id.value.length < 5){
		alert("학번은 5글자여야 합니다.");
		id.focus();
		return false;
	}
	
	if (id.value.length >= 6){
		alert("학생의 학번은 6글자를 초과 할 수 없습니다.");
		id.focus();
		return false;
	}
	
	if(name.value === ""){
		alert("이름을 입력하세요.");
		name.focus();
		return false;
	}
	
	if(gender1 === false && gender2 === false){
		alert("성별을 선택해주세요.");
		name.focus();
		return false;
	}
	return true;	
}


function validate2(){
	var id = document.getElementById("id");
	var korean = document.getElementById("korean");
	var math = document.getElementById("math");
	var english = document.getElementById("english");
	var his = document.getElementById("history");
	// history는 JS 객체명과 겹침.
	
	if(id.value === ""){
		alert("학번을 입력하세요.");
		id.focus();
		return false;
	}
	
	if(id.value.length >= 6){
		alert("학번은 5글자를 초과할 수 없습니다.");
		id.focus();
		return false;
	}
	
	if(id.value.length < 5){
		alert("학번은 5글자여야 합니다.")
		id.focus();
		return false;
	}
	
	if(korean.value === ""){
		alert("국어시험 점수를 입력하세요.");
		korean.focus();
		return false;
	}
	
	if(korean.value > 100){
		alert("성적은 100점을 초과할 수 없습니다.");
		korean.focus();
		return false;
	}
	
	if(english.value === ""){
		alert("영어시험 점수를 입력하세요.");
		english.focus();
		return false;
	}
	
	if(english.value > 100){
		alert("성적은 100점을 초과할 수 없습니다.");
		english.focus();
		return false;
	}
	
	if(math.value === ""){
		alert("수학시험 점수를 입력하세요.");
		math.focus();
		return false;
	}
	
	if(math.value > 100){
		alert("성적은 100점을 초과할 수 없습니다.");
		math.focus();
		return false;
	}
	
	if(his.value === ""){
		alert("역사시험 점수를 입력하세요.");
		his.focus();
		return false;
	}
	
	if(his.value > 100){
		alert("성적은 100점을 초과할 수 없습니다.");
		his.focus();
		return false;
	}
	okok();
	return true;
}
function okok(){
	alert("성공.");
}
