/**
 * 유저 입력값 검증 정규식 패턴 
 * 버전 : 1.0
 * << 개정이력(Modification Information) >>
 * 수정일        수정자      수정내용   
 * =======      =======     ===================== 
 * 2017.10.24.  전인호       최초작성   
 * Copyright (c) 2017 by DDIT  All right reserved  
 */
// "a001".validationID();
String.prototype.validationID = function(){
	// "a001" == this
	// 문자열에서 해당 패턴에 일치하는 문자 또는 문자열 추출이 가능하면 true,
	// 추출 불가능시 false
	return /^[a-zA-Z0-9]{4,15}$/.test(this);
};

// "asdfasdf".validationPWD();
String.prototype.validationPWD = function(){
	return /^[a-z0-9]{4,10}$/.test(this);
};

// "김훈".validationNM();
String.prototype.validationNM = function(){
	return /^[가-힣]{2,3}$/.test(this);
};

String.prototype.validationREGNO = function(){
	// ? ? ? ? ? ? - ? ? ? ? ? ?         ?(매직넘버) = 111111-1111118
	// * * * * * *   * * * * * *
	// 2+3+4+5+6+7 + 8+9+2+3+4+5  = 값1
	// (11-(값1%11))%10 = 값2
	// (값2 == 매직넘버) ? 유효(true) : 무효(false)
	var moto = this.replace('-', '');
	var magicNum = this.substr(13, 1);
	var sum = 0;
	var checkSum = '234567892345';
	
	for(var i=0; i<12; i++){
		sum += moto.charAt(i)*checkSum.charAt(i);
	}
	var finalValue = (11-(sum%11))%10;
	
	if(finalValue == parseInt(magicNum)){
		return true;
	}else{
		return false;
	}
};

String.prototype.validationBIR = function(){
	return /^(19|20)\d{2}-(0|1)[1-9]{1}-\d{2}$/.test(this);
};

String.prototype.validationBIRINCLUDETIME = function(){
	return /^(19|20)\d{2}-(0|1)[1-9]{1}-\d{2} ([0-1]?\d|[2][0-3]):([0-5]\d):([0-5]\d)$/.test(this);
};

String.prototype.validationHOMETEL = function(){
	return /^0[1-9]{1,2}-\d{3,4}-\d{4}$/.test(this);
};

String.prototype.validationCOMTEL = function(){
	return /^0[1-9]{1,2}-\d{3,4}-\d{4}$/.test(this);
};

String.prototype.validationHP = function(){
	return /^01(0|1|6|7|8|9)-\d{3,4}-\d{4}$/.test(this);
};

String.prototype.validationMAIL = function(){
	return /\w+@[a-z]+(\.[a-z]+){1,2}$/.test(this);
};















String.prototype.regexURL = function(){
	return /^(?:http(s)?:\/\/)?[\w.-]+(?:\.[\w\.-]+)+[\w\-\._~:/?#[\]@!\$&'\(\)\*\+,;=.]+$/.text(this);
}
