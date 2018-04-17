$.fn.serializeObject = function() {
    var o = {};
    var a = this.serializeArray();
    $.each(a, function() {
        if (o[this.name] !== undefined) {
            if (!o[this.name].push) {
                o[this.name] = [o[this.name]];
            }
            o[this.name].push(this.value || '');
        } else {
            o[this.name] = this.value || '';
        }
    });
    return o;
};

var submitCall = function (obj ,check) {
	var $form = $(obj), 
				api_url = $form.attr('action'),
				sobject = $form.serializeObject(),
	 			params = JSON.stringify( sobject ) ;
	if(check) {
		if( sobject.pwd != sobject.pwd2 ) {
			alert ('입력하신 비밀번호가 일치 하지 않습니다.');
			return true;
		}
	}
	$.post( api_url, { 'params' : params }, function(data, result) {
		var resultObj = JSON.parse(data);
		if( resultObj.result ) {
			alert( '성공하였습니다. ');
			location.reload();
		} else {
			alert( data ) ;
			alert('error : 관리자에게 문의하세요.');
		}
	} );
	return true;
}