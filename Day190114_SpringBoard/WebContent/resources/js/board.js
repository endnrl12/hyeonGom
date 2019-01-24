/**
 * board.js
 */
//필수 입력요소 검사하기 
function boardCheck(formid){
//	alert("입력요소 검사입니다. ");
	//입력폼에 요소들이 비었는지 비어있지 않은지 검사
	//요소 들이 제대로입력되었을 경우에만 return true;
	var form = $("#"+formid);
	//form.find('input[name="title"]') 특정 요소 선택 후, 하위 요소 중 선택 
	//javascript에서 null, undefine,false 빼고 다 true
	if(!(form.find('input[name="name"]').val().trim())){
		alert("이름을 입력하세요");
		return false;
	}
	var email = form.find('input[name="email"]').val();
	if(!(email.trim())){
		alert("이메일을 입력하세요");
		return false;
	}else{
		//이메일이 비어있지 않으면 유효성 검사
		var result = verifyEmail(email);
		if(!result){
			alert("이메일 형식에 맞지 않습니다.");
			return false;
		}
	}
	if(!(form.find('input[name="pass"]').val().trim())){
		alert("비밀번호를 입력하세요");
		return false;
	}
	return true;
}
function verifyEmail(email){
	var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
	if(email.match(regExp) != null){
		return true;
	}else{
		return false;
	}
}
function getOriginFilename(fileName){
	//fileName에서 uuid를 제외한 원래 파일명을 반환
	if(fileName == null){
		return;
	}
	var idx = fileName.indexOf("_")+1;
	return fileName.substr(idx);
}
/*function fileCheck(fileName){
	if(fileName==null){
		return false;
	}else{
		return true;
	}
}*/







