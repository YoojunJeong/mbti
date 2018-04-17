<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  trimDirectiveWhitespaces="true" %>
<%@include file="/WEB-INF/jsp/include/taglib.jsp" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko">
	<common:head>
		<link rel="stylesheet" href="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/jqwidget/styles/jqx.base.css" type="text/css" />
		<link rel="stylesheet" href="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/jqwidget/styles/jqx.arctic.css" type="text/css" />
		<title>ParkingOn ___Admin</title>
	</common:head>
	<common:body>
	<script>mixpanel.track("svc password");</script>
<!-- begin #content -->
<div id="content" class="content">
	<!-- begin breadcrumb -->
	<ol class="breadcrumb pull-right">
    	<li class="active"><a href="/svc/history/sub_period?mainmenu=m5&submenu=s1">HOME</a></li>
    	<li class="active"><a href="/svc/account/sub_password?mainmenu=m5&submenu=s5">비밀번호 변경</a></li>
	</ol> 
	<h1 class="page-header">비밀번호 변경</h1>
	<!-- begin row -->
	<div class="row">
		<!-- begin col-12 -->
		<div class="col-md-12">
			<div class="panel panel-inverse">
                <div class="panel-heading">
                    <h4 class="panel-title">비밀번호 변경</h4>
                </div>
				<div class="panel-body">
					<div class="col-md-2">현재 비밀번호 :</div>
					<div class="col-md-3"><input type="password" class="form-control" name="cpw" id="cpw"></div>
				</div>
				<div class="panel-body">
					<div class="col-md-2">새 비밀번호 :</div>
					<div class="col-md-3"><input type="password" class="form-control" name="npw" id="npw"></div>
				</div>
				<div class="panel-body">
					<div class="col-md-2">새 비밀번호 확인 :</div>
					<div class="col-md-3"><input type="password" class="form-control" name="npwr" id="npwr"></div>
				</div>
				<div class="panel-body">
					<div class="col-md-3"><button class="btn btn-primary" id="submit">변경</button></div>
				</div>
            </div>
		</div>
		<!-- end col-12 -->
	</div>
	<!-- end row -->
</div>

	</common:body>

<script>
var checked_pw = "";
function check(pw) {
	$.ajax({
	    url: '//${cms_api_domain}/1.0/svc/account/check_pw',
	    type: 'post',
	    dataType: 'json',
	    async: false,
	    contentType: 'application/json',
	    beforeSend: function(jqXHR, setting) {
	            jqXHR.setRequestHeader('x-api-key', 'SpammerGoHome');
	    },
	    data:JSON.stringify({'svc_idx': '${corIdx}', pw:pw}),
	    //data:JSON.stringify({'cor_idx': '1', pw:pw}),
	    success: function(data) {
	    	if(data.body.success == true) {
		    	checked_pw = pw;
	    	}
	    	else {
	    		alert("비밀번호가 일치하지 않습니다.");
	    	}
	    	console.log(data);
	    }
	})
}
function change(pw) {
	$.ajax({
	    url: '//${cms_api_domain}/1.0/svc/account/change_pw',
	    type: 'post',
	    dataType: 'json',
	    async: false,
	    contentType: 'application/json',
	    beforeSend: function(jqXHR, setting) {
	            jqXHR.setRequestHeader('x-api-key', 'SpammerGoHome');
	    },
	    data:JSON.stringify({'svc_idx': '${corIdx}', pw:pw}),
	    //data:JSON.stringify({login_id: 'as', cor_idx: '1', pw:pw}),
	    success: function(data) {
	    	if(data.body.success == false) { alert("실패!"); }
	    	else { alert("비밀번호 변경 완료!"); location.reload(); }
	    	console.log(data);
	    }
	})
}
$(function() {
	validate.addElement(
		[$('#cpw'), $('#npw'), $('#npwr')],
		{kor: true, eng: true, special: true, number:true, maxLength: 50}
	);
	$('#change').on('click', function(e) {
		e.preventDefault();
		
		var pw = $('#pw').val();
		
		check(pw);	
	});
	
	$('#cancle').on('click', function(e) {
		e.preventDefault();
		
		$('#normal').css("display", "block");
		$('#checked').css("display", "none");
	})
	$('#submit').on('click', function() {
		var npw = $('#npw').val();
		var npwr = $('#npwr').val();
		if(checked_pw == "" && $('#cpw').val().length >= 1) {
			check($('#cpw').val());
			if(checked_pw == "") {
				return;
			}
		}
		else if($('#cpw').val().length == 0) {
			alert("비밀번호를 입력해주세요.");
			return
		}
		else  {
			if($('#cpw').val() != checked_pw) {
				alert("비밀번호를 확인해주세요.");
				return;
			}			
		}
	    
		
		if(npw == "" || npwr == "") {
			alert("새 비밀번호를 입력해주세요");
			return;
		}
		else if(npw != npwr) {
			alert("새 비밀번호가 일치하지 않습니다.");
			return;
		}
		
		if(checked_pw == npw) {
			alert("새 비밀번호가 현재 비밀번호와 같습니다.");
			return;
		}
		change(npw);
	})
})
</script>

</html>  