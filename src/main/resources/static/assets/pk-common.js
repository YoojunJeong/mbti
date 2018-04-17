
var PK_COMN = {
	'LOG_LEVEL' : 'TRACE', /*INFO, DEBUG */
	'isEmptyString' : function(value)
	{
		return value.replace(/[ \t]/gi , "") === "";
	},
	'addComma' : function(data_value) // 출처 : http://ooz.co.kr/231
	{
		var txtNumber = '' + data_value;    // 입력된 값을 문자열 변수에 저장합니다.
		
		if (isNaN(txtNumber) || txtNumber == "") {    // 숫자 형태의 값이 정상적으로 입력되었는지 확인합니다.
			return;
		}
		else {
			var rxSplit = new RegExp('([0-9])([0-9][0-9][0-9][,.])');    // 정규식 형태 생성
			var arrNumber = txtNumber.split('.');    // 입력받은 숫자를 . 기준으로 나눔. (정수부와 소수부분으로 분리)
			arrNumber[0] += '.'; // 정수부 끝에 소수점 추가
		
			do {
				arrNumber[0] = arrNumber[0].replace(rxSplit, '$1,$2'); // 정수부에서 rxSplit 패턴과 일치하는 부분을 찾아 replace 처리
			} while (rxSplit.test(arrNumber[0])); // 정규식 패턴 rxSplit 가 정수부 내에 있는지 확인하고 있다면 true 반환. 루프 반복.
		
			if (arrNumber.length > 1) { // txtNumber를 마침표(.)로 분리한 부분이 2개 이상이라면 (즉 소수점 부분도 있다면)
				return arrNumber.join(''); // 배열을 그대로 합칩. (join 함수에 인자가 있으면 인자를 구분값으로 두고 합침)
			}
			else { // txtNumber 길이가 1이라면 정수부만 있다는 의미.
				return arrNumber[0].split('.')[0]; // 위에서 정수부 끝에 붙여준 마침표(.)를 그대로 제거함.
			}
		}
	}, 
	'toPhoneNumber' : function(num, type) // 출처 : http://6developer.com/15
	{
	    var formatNum = '';
	    
	    if(num.length==11){
	        if(type==0){
	            formatNum = num.replace(/(\d{3})(\d{4})(\d{4})/, '$1-****-$3');
	        }else{
	            formatNum = num.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
	        }
	    }else if(num.length==8){
	        formatNum = num.replace(/(\d{4})(\d{4})/, '$1-$2');
	    }else{
	        if(num.indexOf('02')==0){
	            if(type==0){
	                formatNum = num.replace(/(\d{2})(\d{4})(\d{4})/, '$1-****-$3');
	            }else{
	                formatNum = num.replace(/(\d{2})(\d{4})(\d{4})/, '$1-$2-$3');
	            }
	        }else{
	            if(type==0){
	                formatNum = num.replace(/(\d{3})(\d{3})(\d{4})/, '$1-***-$3');
	            }else{
	                formatNum = num.replace(/(\d{3})(\d{3})(\d{4})/, '$1-$2-$3');
	            }
	        }
	    }
	    return formatNum;
	},
	'toDatePicker' : function ( domObjects ) 
	{
		jQuery(domObjects).each(function(domIdx, domObject){
			jQuery( domObject ).datepicker( {    format: 'yyyy-mm-dd'});	
			jQuery('input[type=text]', domObject ).each(function(idx , elem){
				jQuery(elem).attr('maxlength', 10);
				PK_COMN.makeNumberWithHipenForm(elem);

			});
			
		});
	}
	,
	'makeNumberForm' : function( formField )
	{
		jQuery(formField).bind('keydown', PK_COMN.numberChecker);
		jQuery(formField).bind('keyup', PK_COMN.eraseWithoutNumber);
	}
	, 
	'makeNumberWithHipenForm' : function( formField )
	{
		jQuery(formField).bind('keydown', PK_COMN.numberWithHipenChecker);
		jQuery(formField).bind('keyup', PK_COMN.eraseWithoutNumberAndHipen);
	}
	,
	'numberChecker' : function(event)
	{
		 event = event || window.event;
		 var keyID = (event.which) ? event.which : event.keyCode;
		 if ((keyID >= 48 && keyID <= 57) // 0-9
			 || (keyID >= 96 && keyID <= 105) // number pad 0 - 9
			 || keyID == 8    // backspace
			 || keyID == 46   // delete
			 || keyID == 37   // 방향키 <-
			 || keyID == 39   // 방향키  ->
		     || keyID == 109  // number pad "-"
			 || keyID == 9)   // tab
			 return;
		 else
			 return false;
	}
	,
	'numberWithHipenChecker' : function(event) 
	{
		 event = event || window.event;
		 var keyID = (event.which) ? event.which : event.keyCode;
		 if ((keyID >= 48 && keyID <= 57) // 0-9
			 || (keyID >= 96 && keyID <= 105) // number pad 0 - 9
			 || keyID == 8    // backspace
			 || keyID == 46   // delete
			 || keyID == 37   // 방향키 <-
			 || keyID == 39   // 방향키  ->
		     || keyID == 189  // -
		     || keyID == 109  // number pad "-"
			 || keyID == 9)   // tab
			 return;
		 else
			 return false;
	}
	,
	'eraseWithoutNumber' : function(event)
	{
		 event = event || window.event;
		 var keyID = (event.which) ? event.which : event.keyCode;
		 if (keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39)
			 return;
		 else
			 event.target.value = event.target.value.replace(/[^0-9]/g, "");
	}
	,
	'eraseWithoutNumberAndHipen' : function(event) 
	{
		 event = event || window.event;
		 var keyID = (event.which) ? event.which : event.keyCode;
		 if (keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39)
			 return;
		 else
			 event.target.value = event.target.value.replace(/[^0-9\-]/g, "");
		
	}
	,
	'log' : function()
	{
		// TODO scyun : console.log 스크립트를 코드에 넣어야 하나? 문제발생하지 않을까??
		
	}
	,
	'ajax' : function(req)
	{
		if (PK_COMN.LOG_LEVEL === 'TRACE')
		{
			console.log("#== REQUEST OBJECT")
			console.log(req);
		}

		if (req['contentType'] === undefined)
		{
			req['contentType']  = 'application/json';		
		}
		if (req['beforeSend'] === undefined)
		{
			req['beforeSend'] = function(jqXHR, setting)
			{
				jqXHR.setRequestHeader('x-api-key', 'SpammerGoHome');
			}
		}
		if (req['error'] === undefined)
		{
			req['error'] = function(jqXHR, textStatus, errorThrown)
			{
				if (PK_COMN.LOG_LEVEL === 'TRACE')
				{
					console.log("#== TRACE ajax ERROR logging");
					console.log("#=== responseText \n" + jqXHR.responseText);
				}
				if (jqXHR.responseJSON && jqXHR.responseJSON.messageDesc )
				{
					alert(jqXHR.responseJSON.messageDesc);
				}
				else
				{
					alert('오류가 발생했습니다. 잠시 후 다시 시도해 주시기 바랍니다.');
				}
			}	
		}
		
		jQuery.ajax(req);
	}
}


var PKOAjax = {
		/**
		 * Ajax 통신을 담당하는 함수
		 *
		 * @param URL -
		 *            *.do 형태
		 * @param inObj -
		 *            Object 형태의 데이터
		 * @param callback -
		 *            이벤트 발생시 호출 할 function
		 */
		// jQuery의 Ajax
		request : function(URL, method, inObj, callback, errorCallback) {
			var jsonData = JSON.stringify(inObj);
			$.ajax({
				url :  URL,
				method : method,
				cache : false,
				//timeout: 10000,
				dataType : 'json',
				data : jsonData,
				contentType : "application/json; charset=UTF-8",
				jsonp : 'callback',
				beforeSend : function(xmlHttpRequest) {
					xmlHttpRequest.setRequestHeader("AJAX", "true"); // ajax
					// 호출이라고 헤더에
					// 기록한다.
					xmlHttpRequest.setRequestHeader("x-api-key", "SpammerGoHome"); // API
					// KEY
					// 고정이라
					// 걱정됨
				},
				success : function(response, statusText, data) {
					callback(data.responseJSON);
					// callback(data.responseText);
				},
				error : function(request, status, error) {
					var readyState = request.readyState;
					if(readyState == 0)
					{
						//showErrDialog("uninitialized", "API 서버가 응답하지 않습니다.");
						alert("API 서버가 응답하지 않습니다.");
					}
					else
					{
						if (errorCallback !== undefined)
						{
							var errorBody = request.responseJSON;
							errorCallback(errorBody);
						}
						else
						{
							var errorBody = request.responseJSON;
							if (errorBody.messageDesc !== undefined)
							{
								alert(errorBody.messageDesc);
							}
							else 
							{
								console.log(errorBody);
							}
						}
					}
				},
				complete : function(data) {
				}

			});
		}
	};

var setting= { kor: true, eng: true, space: true, special: true, number: true, minLength: 3, maxLength: 10, required: true }
var VALIDATE = function() {
    this.regArray = {
        kor: "ㄱ-ㅎ가-힣ㅏ-ㅣ",
        eng: "a-zA-Z",
        allowChars: "\\-&_#@\\(\\)\\.,",
        space: "\\x20\\t\\r\\n\\f",
        number: "0-9"
    }
    this.isValidSetting = function(settingType) {
        if(!(typeof settingType == "undefined")) {
            return settingType;
        }
        return false;
    }
    this.dateToToday = function(element) {
    	var date = new Date();
    	var year = date.getFullYear();
    	var month = (date.getMonth()+1) < 10 ? '0' + (date.getMonth()+1) : (date.getMonth()+1);
    	var day = date.getDate() < 10 ? "0"+date.getDate() : date.getDate();
		element.attr("value", year + '-' + month + '-' + day);
	}
    this.dateToFirstDay = function(element) {
    	var date = new Date();
		var firstDay = new Date(date.getFullYear(), date.getMonth(), 1);
    	element.attr("value", firstDay.getFullYear() + "-" + (firstDay.getMonth()+1) + "-" + (firstDay.getDate() < 10 ? "0"+firstDay.getDate() : firstDay.getDate()));
    }
    this.dateToLastDay = function(element) {
    	var date = new Date();
		var lastDay = new Date(date.getFullYear(), date.getMonth() + 1, 0);
    	element.attr("value", lastDay.getFullYear() + "-" + (lastDay.getMonth()+1) + "-" + (lastDay.getDate() < 10 ? "0"+lastDay.getDate() : lastDay.getDate()));
    }
    this.toDatePicker = function(element) {
    	element.attr("type", "date");
    	element.attr("min", "1000-01-01");
    	element.attr("max", "2999-12-31");
    }
    this.addPhoneNumber = function(element) {
    	element.attr("pattern", "(010-{3}-[0-9]{4}-[0-9]{4})|([0-9]{3}-[0-9]{3}-[0-9]{4})|([0-9]{2}-[0-9]{3}-[0-9]{4})|([0-9]{4}-[0-9]{4})");
    }
   	this.addEmail = function(element) {
   		element.attr("pattern", "[0-9a-zA-Z]([-_\\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\\.]?[0-9a-zA-Z])*\\.[a-zA-Z]{2,3}$")
   	}
    this.addElement = function(element, setting) {
        var result = "";
        var reg = "";

        if(this.isValidSetting(setting.kor)) {
            reg += this.regArray.kor;
        }
        if(this.isValidSetting(setting.eng)) {
            reg += this.regArray.eng;
        }
        if(this.isValidSetting(setting.space)) {
            reg += this.regArray.space;
        }
        if(this.isValidSetting(setting.special)) {
            reg += this.regArray.allowChars;
        }
        if(this.isValidSetting(setting.number)) {
            reg += this.regArray.number;
        }
        if(this.isValidSetting(setting.myReg)) {
        	reg += setting.myReg;
        }

        if(reg == "") {
        	result = new RegExp(".*");
        }
        else {
	        result = new RegExp("^[" + reg + "]*$");
        	
        }

        console.log(result);
        if(Array.isArray(element)) {
	        for(var i in element) {
	        	if(this.isValidSetting(setting.required)) {
		        	element[i].attr("required", "true");
		        	jQuery(element[i]).on("invalid", function(event) {
		        		var offset = jQuery(event.srcElement).offset();
		        		window.scrollTo(0,offset.top-200);
						jQuery(event.srcElement).focus();
		        	});
		        }
		        if(this.isValidSetting(setting.minLength)) {
		            element[i].attr("pattern", ".{" + setting.minLength + ",}");
		        }
		        if(this.isValidSetting(setting.maxLength)) {
		            element[i].attr("maxlength", setting.maxLength)
		        }
		        if(this.isValidSetting(setting.type)) {
		        	element[i].attr("type", setting.type);
		        }
		        if(this.isValidSetting(setting.max)) {
		        	element[i].attr("max", setting.max);
		        }
		        if(this.isValidSetting(setting.pattern)) {
		        	element[i].attr("pattern", setting.pattern);
		        }
		        element[i].on('keydown keypress', function(e) {
		            if(e.keyCode >= 32 && e.keyCode <= 132 && e.ctrlKey == false) {
		                var text = $(this).val() + e.key;
		                if(result.test(text) == false) {
		                    e.preventDefault();
		                    return false;
		                }
		            }
		        });
		        element[i].on('keyup', function(e) {
		        	var reg_not = new RegExp("[^" + reg + "]", "g");
		        	var val = e.target.value;
		        	var replace = val.replace(reg_not, "");

		        	console.log(val+"!", replace+"!");

		        	if(val != replace)
			        	e.target.value = e.target.value.replace(reg_not, "");
		        });
		        element[i].on('paste' ,function(e) {
		            var text = e.originalEvent.clipboardData.getData('Text');;
		            if(result.test(text) == false) {
		                e.preventDefault();
		                return false;
		            }
		        });
	        }
        }
        else {
        	if(this.isValidSetting(setting.required)) {
	        	element.attr("required", "true");
				jQuery(element).on("invalid", function(event) {
					var offset = jQuery(event.srcElement).offset();
					window.scrollTo(0,offset.top-200);
					jQuery(event.srcElement).focus();
				});
	        }
        	if(this.isValidSetting(setting.minLength)) {
	            element.attr("pattern", ".{" + setting.minLength + ",}");
	        }
	        if(this.isValidSetting(setting.maxLength)) {
	            element.attr("maxlength", setting.maxLength)
	        }
	        if(this.isValidSetting(setting.type)) {
	        	element.attr("type", setting.type);
	        }
	        if(this.isValidSetting(setting.max)) {
	        	element.attr("max", setting.max);
	        }
	        if(this.isValidSetting(setting.pattern)) {
	        	element.attr("pattern", setting.pattern);
	        }
	        element.on('keydown keypress', function(e) {
	            if(e.keyCode >= 32 && e.keyCode <= 132 && e.ctrlKey == false) {
	                var text = $(this).val() + e.key;
	                if(result.test(text) == false) {
	                    e.preventDefault();
	                    return false;
	                }
	            }
	        });
	        element.on('keyup', function(e) {
	        	if(reg == "") return;
	        	var reg_not = new RegExp("[^" + reg + "]", "g");
	        	var val = e.target.value;
	        	var replace = val.replace(reg_not, "");

	        	if(val != replace)
		        	e.target.value = e.target.value.replace(reg_not, "");
	        });
	        element.on('paste' ,function(e) {
	            var text = e.originalEvent.clipboardData.getData('Text');;
	            if(result.test(text) == false) {
	                e.preventDefault();
	                return false;
	            }
	        });
        }
    }
    this.makeToForm = function(element) {

    }
}

var validate = new VALIDATE();



// Chauffeur Const                          
var STATE_FIND_DRIVER 		= 1000;	//대기
var STATE_CONNECTED_DRIVER 	= 1005;	//기사연결
var STATE_CHANGE_DRIVER 	= 1006;	//기사변경
var STATE_START_DRIVING 	= 1008;	//기사연결
var STATE_END_DRIVING 		= 1009;	//기사연결
var STATE_COMPLETE 			= 1015;	//완료
var STATE_CANCEL 			= 1050;	//취소
var STATE_CANCEL_BY_ADMIN 	= 1060;	//취소
var STATE_CANCEL_BY_DRIVER 	= 1070;	//취소
var STATE_CHANGE_INFO 		= 31;
