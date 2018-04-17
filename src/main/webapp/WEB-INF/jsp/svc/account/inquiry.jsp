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
	<script>mixpanel.track("svc inquery");</script>
<!-- begin #content -->
<div id="content" class="content">
	<!-- begin breadcrumb -->
	<ol class="breadcrumb pull-right">
    	<li class="active"><a href="/svc/history/sub_period?mainmenu=m5&submenu=s1">HOME</a></li>
    	<li class="active"><a href="/svc/account/sub_inquiry?mainmenu=m5&submenu=s4">기본정보</a></li>
	</ol> 
	<h1 class="page-header">기본정보</h1>
	<!-- begin row -->
	<div class="row">
		<!-- begin col-12 -->
		<div class="col-md-12">
			<div class="panel panel-inverse">
                <div class="panel-heading">
                    <h4 class="panel-title">기본정보</h4>
                </div>
				<div class="panel-body">
					<div class="col-md-2">아이디 : <span id="id"></span></div>
				</div>
				<div class="panel-body">
					<div class="col-md-4">회원구분 : <span id="type"></span></div>
				</div>
				<div class="panel-body">
					<div class="col-md-2">법인명 : <span id="c_name"></span></div>
				</div>
            </div>
		</div>
		<!-- end col-12 -->
	</div>
	<div class="row">
		<!-- begin col-12 -->
		<div class="col-md-12">
			<div class="panel panel-inverse">
                <div class="panel-heading">
                    <h4 class="panel-title">담당자 정보</h4>
                </div>
				<div id="normal_f">
					<div class="panel-body">
						<div class="col-md-3">담당자 : <span id="name"></span></div>
					</div>
					<div class="panel-body">
						<div class="col-md-3">부서 : <span id="dept"></span></div>
					</div>
					<div class="panel-body">
						<div class="col-md-3">직급 : <span id="position"></span></div>
					</div>
					<div class="panel-body">
						<div class="col-md-3">휴대폰번호 : <span id="phone"></span></div>
					</div>
					<div class="panel-body">
						<div class="col-md-3">마지막 로그인 : <span id="last_login"></span></div>
					</div>
					<div class="panel-body">
						<button class="btn btn-primary" id="modify">수정</button>
					</div>
				</div>
				<form id="modify_f" style="display:none">
					<div class="panel-body">
						<div class="col-md-2">*담당자 :</div>
						<div class="col-md-3"><input type="text" class="form-control" name="name" id="i_name"></div>
					</div>
					<div class="panel-body">
						<div class="col-md-2">*부서 :</div>
						<div class="col-md-3"><input type="text" class="form-control" name="dept" id="i_dept"></div>
					</div>
					<div class="panel-body">
						<div class="col-md-2">*직급 :</div>
						<div class="col-md-3"><input type="text" class="form-control" name="dept" id="i_position"></div>
					</div>
					<div class="panel-body">
						<div class="col-md-2">*휴대폰번호 :</div>
						<div class="col-md-3"><input type="text" class="form-control" name="phone" id="i_phone"></div>
					</div>
					<div class="panel-body">
						<button class="btn btn-primary" type="button" id="cancle">취소</button>
						<button class="btn btn-primary" type="submit" id="submit">저장</button>
					</div>
				</form>
            </div>
		</div>
		<!-- end col-12 -->
	</div>
	<!-- end row -->
</div>

	</common:body>

<script>
function modifyData() {
	var name =$('#i_name').val();
	var dept = $('#i_dept').val();
	var position = $('#i_position').val();
	var phone = $('#i_phone').val();
	$.ajax({
	    url: '//${cms_api_domain}/1.0/svc/account/modify',
	    type: 'post',
	    dataType: 'json',
	    contentType: 'application/json',
	    beforeSend: function(jqXHR, setting) {
	            jqXHR.setRequestHeader('x-api-key', 'SpammerGoHome');
	    },
	    // data:JSON.stringify({name : name, dept: dept, position:position, phone: phone, 'cor_idx': '${corIdx}'}),
	    data:JSON.stringify({name : name, dept: dept, position:position, phone: phone, 'svc_idx': '${corIdx}', login_id: '${loginId}'}),
	    success: function(data) {
	            console.log(data);
	        //insertList(data.body.list[0]);
	        location.reload();
	    }
	})
}
function loadData() {
	$.ajax({
	    url: '//${cms_api_domain}/1.0/svc/account/inquiry',
	    type: 'post',
	    dataType: 'json',
	    contentType: 'application/json',
	    beforeSend: function(jqXHR, setting) {
	            jqXHR.setRequestHeader('x-api-key', 'SpammerGoHome');
	    },
	    data:JSON.stringify({svc_idx: '${corIdx}'}),
	    //data:JSON.stringify({cor_idx: '1'}),
	    success: function(data) {
	            console.log(data);
	        insertList(data.body.list[0]);
	    }
	})
}
function insertList(data) {
	
	var service_type;
	
	switch(data.service_type) {
	case "0" : service_type="법인대리"; break;
	case "1" : service_type="모범택시"; break;
	case "2" : service_type="퀵서비스"; break;
	}
	
	var id = $('#id').text(data.login_id);
	var type = $('#type').text("복수업체>" + service_type);
	var c_name = $('#c_name').text(data.name);
	
	var name = $('#name').text(data.manager_name);
	var dept = $('#dept').text(data.manager_dept);
	var position = $('#position').text(data.manager_position);
	var phone = $('#phone').text(data.manager_phone);
	var last_login = $('#last_login').text(data.created_at)
	
	var i_name = $('#i_name').val(data.manager_name);
	var i_dept = $('#i_dept').val(data.manager_dept);
	var i_position = $('#i_position').val(data.manager_position);
	var i_phone = $('#i_phone').val(data.manager_phone);
}

$(function() {

	validate.addElement($('#i_name'), {kor: true, number: true, eng: true, space: true, special: false, required: true});
	validate.addElement(
		[$('#i_dept'), $('#i_position')], 
		{kor: true, number: true, eng: true, psace: true, special: true, required: true}
	);
	validate.addElement($('#i_phone'), {pattern: '[0-9]{7,11}'})

	loadData();
	$('#modify').on('click', function(e) {
		e.preventDefault();
		$('#normal_f').css("display", "none");
		$('#modify_f').css("display", "block");
	})
	$('#cancle').on('click', function(e) {
		e.preventDefault();
		$('#normal_f').css("display", "block");
		$('#modify_f').css("display", "none");
	})
	$('#modify_f').on('submit', function(e) {
		e.preventDefault();

		// 전화번호가 9자 이하일 시
		if($('#i_phone').val().length < 9) {
			alert("유효하지 않은 전화번호입니다.");
			return false;
		}

		modifyData();
	})
});
</script>

</html>  