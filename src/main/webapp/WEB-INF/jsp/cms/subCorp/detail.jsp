<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  trimDirectiveWhitespaces="true" %>
<%@include file="/WEB-INF/jsp/include/taglib.jsp" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko">
    <common:head>
        <title>ParkingOn Admin</title>
    </common:head>
    <common:body>
    <script>mixpanel.track("cms-svc detail");</script>
<!-- begin #content -->
		<div id="content" class="content">

			<!-- begin breadcrumb -->

    <ol class="breadcrumb pull-right">
        <li class="active"><a href="/cms/corp/list?mainmenu=m1&submenu=s1">HOME</a></li>
        <li class="active"><a href="/cms/corp/list?mainmenu=m1&submenu=s1">법인관리</a></li>
        <li class="active"><a href="/cms/subCorp/list?mainmenu=m1&submenu=s2">서비스 공급업체 목록</a></li>
        <li class="active"><a href="javascript:window.location.reload(true)">서비스 공급업체 상세</a></li>
    </ol>

	<h1 class="page-header">서비스 공급업체 상세정보</h1>
			<!-- begin row -->
            <form id="ADD_FORM" action="#">
			<div class="row">
				<div class="col-md-9">
					<div class="panel panel-inverse" data-sortable-id="form-plugins-1">
						<div class="panel-heading"><h4 class="panel-title">기본 정보</h4> </div>
						<div class="panel-body panel-form">
							<div class="form-horizontal form-bordered">
								<div class="form-group">
									<label class="col-md-2 control-label">* 회사명(업체명)</label>
									<div class="col-md-3"><input id="name" type="text" class="form-control"/></div>
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label">* 서비스구분</label>
									<div class="col-md- 6 form-inline">
										<div class="input-group">
											<span>&nbsp;&nbsp;&nbsp;</span>
										</div>
										<div class="input-group">
											<span class="input-group-addon"><input type="radio" name="service_type" checked="checked" value="0"></input></span>
											<span class="form-control">법인대리운전</span>
										</div>
										<div class="input-group">
											<span class="input-group-addon"><input type="radio" name="service_type" value="1"></input></span>
											<span class="form-control">모범택시</span>
										</div>
										<div class="input-group">
											<span class="input-group-addon"><input type="radio" name="service_type" value="2"></input></span>
											<span class="form-control">퀵서비스</span>
										</div>
									</div>
								</div>
                    <div class="form-group">
                        <label class="col-md-2 control-label">담당자명</label>
                        <div class="col-md-2"> <input type="text" class="form-control" id="manager_name"  placeholder="담당자명"/></div>
                        <label class="col-md-2 control-label">부서</label>
                        <div class="col-md-2"> <input type="text" class="form-control" id="manager_dept"  placeholder="부서"/></div>
                        <label class="col-md-2 control-label">직급</label>
                        <div class="col-md-2"> <input type="text" class="form-control" id="manager_position"  placeholder="직급"/></div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label">연락처(TEL)</label>
                        <div class="col-md-2"> <input type="text" class="form-control" id="manager_phone"  placeholder="연락처(TEL)"/></div>
                        <label class="col-md-2 control-label">연락처(E-Mail)</label>
                        <div class="col-md-2"> <input type="text" class="form-control" id="manager_email"  placeholder="연락처(E-Mail)"/></div>
                    </div>
							</div>
						</div>
					</div>
				</div>
				<!-- 설정 START -->
				<div class="col-md-9">
					<div class="panel panel-inverse" data-sortable-id="form-plugins-1">
						<div class="panel-heading"><h4 class="panel-title">계정</h4></div>
						<div class="panel-body panel-form">
							<div class="form-horizontal form-bordered">
								<div class="form-group">
									<label class="col-md-2 control-label">ID</label>
									<div class="col-md-4 form-inline">
                                        <input id="login_id" type="text" class="form-control"/>
                                        <button type="button" id="BTN_DUPLICATE_CHK" class="btn btn-primary disabled" >중복체크</button>
                                    </div>
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label">PW</label>
									<div class="col-md-4"><input id="pwd" type="password" class="form-control"/></div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 설정   END -->
			</div>
			<!-- end row -->
			<div>
				<a id="BTN_MODIFY" class="btn btn-primary">수정</a>
				<a id="BTN_CANCEL" class="btn btn-primary" style="display:none;">취소</a>
				<button type="submit" id="BTN_SAVE" class="btn btn-primary" style="display:none;">저장</button>
			</div>
			</form>
			<div id="__GRID" style="position: relative; z-index: 0;"></div>
		</div>

    </common:body>
<script type="text/javascript">

var setting= { kor: true, eng: true, space: true, special: true, number: true, minLength: 3, maxLength: 10, required: true, type: "type", max: "max", myReg: "reg" };
validate.addElement(jQuery('#name'), {kor: true, number: true, eng: true, space: true, special: true, required: true});
validate.addElement(jQuery('#manager_name'), {kor: true, number:true, eng: true, space: true});
validate.addElement(jQuery('#manager_phone'), {number: true, minLength: 9, maxLength: 11});
validate.addElement( jQuery('#manager_email'), {kor: true, number: true, eng: true, space: true, special: true, maxLength:50});
validate.addElement(
    [jQuery('#manager_dept'), jQuery('#manager_position')],
    {kor: true, number: true, eng: true, space: true, special: true}
);
validate.addElement(jQuery('#login_id'), {eng: true, number: true, myReg: '\\-&_@\\(\\)\\.,', min: 2, maxLength: 20});
validate.addElement(jQuery('#pwd'), {kor: true, eng: true, special: true, number: true, maxLength: 50, required:true});

var isDuplicateChkComplete = function()
{
    return  jQuery('#login_id').val().replace(/[ \t]/gi , "") === "" 
         || jQuery('#login_id').val() === jQuery('#login_id').data('pre-login-id')
         || jQuery('#login_id').val() === jQuery('#login_id').data('checkedLoginId') ;
}

var isDuplicatedLoginId = function ( ) 
{
    var _loginId = jQuery('#login_id').val().replace(/[ \t]/gi , "");
   
    PKOAjax.request (
     /* URL      */ "//${cms_api_domain}/1.0/cms/corp/"+ _loginId +"/isDuplicate"
    ,/* METHOD   */ "post"
    ,/* DATA     */ new Object()
    , function(data) /* CALLBACK */ 
    {
        if (data.status == 200)
        {
            if (data.body === true) 
            {
                alert('이미 사용중인 아이디입니다.');
            }
            else
            {
                alert('사용 가능한 아이디입니다.');
                jQuery('#login_id').data('checkedLoginId', jQuery('#login_id').val());
            }
        }
    });
}


    var toReadonly = function()
    {
    	jQuery('#ADD_FORM').find('input').prop('disabled',true);
    	jQuery('#BTN_MODIFY').show();
    	jQuery('#BTN_CANCEL').hide();
    	jQuery('#BTN_SAVE').hide();
    	jQuery('#BTN_DUPLICATE_CHK').hide();
    }
    
    var toModify = function()
    {
    	jQuery('#ADD_FORM').find('input').prop('disabled',false);
    	jQuery('#BTN_MODIFY').hide();
    	jQuery('#BTN_CANCEL').show();
    	jQuery('#BTN_SAVE').show();
    	jQuery('#BTN_DUPLICATE_CHK').show();
    }

    var loadSubCorpInfo = function()
    {
        $.ajax({
            "url": '//${cms_api_domain}/1.0/subcorporations/${param.subCorIdx}',
            "type": 'get',
            "dataType": 'json',
            "beforeSend": function(jqXHR, setting) {
                    jqXHR.setRequestHeader('x-api-key', 'SpammerGoHome');
            },
            "success": function(data, textStatus, jqXHR) {
                if (data.status == 200)
                {
                	jQuery('#name').val(data.body.name);
                	jQuery('[name=service_type][value='+data.body.service_type+']').prop('checked', true);
                	jQuery('#manager_name').val(data.body.manager_name);
                	jQuery('#manager_phone').val(data.body.manager_phone);
                	jQuery('#manager_dept').val(data.body.manager_dept);
                	jQuery('#manager_position').val(data.body.manager_position);
                	jQuery('#manager_email').val(data.body.manager_email);
                	jQuery('#login_id').val(data.body.login_id);
                	jQuery('#login_id').data("pre-login-id", data.body.login_id);
                	jQuery('#pwd').val(data.body.pwd);
                	jQuery('#pwd').data("pre-pwd", data.body.pwd);
                }
                else
                {
                    alert('정보 조회에 실패했습니다. 잠시 후 다시 reload 해주시기 바랍니다.');
                }
             }
        });
    };
    
    var isLoginIdChanged = function()
    {
        var loginId = jQuery('#login_id').val();
        var preLoginId = jQuery('#login_id').data('pre-login-id');
        return loginId != preLoginId;
    }
    
    var isPwdChanged = function()
    {
    	var pwd = jQuery('#pwd').val();
    	var prePwd = jQuery('#pwd').data('pre-pwd');
    	
    	return pwd != prePwd;
    }
    
    jQuery(document).ready(function(){
    	
        jQuery('#login_id').keyup(function(evt)
        {
            var _loginId = jQuery('#login_id').val().replace(/[ \t]/gi , "");
            var preLoginId = jQuery('#login_id').data('pre-login-id');
            if (_loginId !== '' && preLoginId !== _loginId && evt.target.value.length >= 2)
            {
                jQuery('#BTN_DUPLICATE_CHK').removeClass('disabled');
            }
            else
            {
                jQuery('#BTN_DUPLICATE_CHK').addClass('disabled');
            }
        }); 
        jQuery('#pwd').focusin(function(){
            jQuery(this).val('');
        });
        jQuery('#pwd').focusout(function(){
            var pwdValue = jQuery('#pwd').val();
            var prePwd = jQuery('#pwd').data('pre-pwd');
            if (PK_COMN.isEmptyString(pwdValue))
            {
                jQuery('#pwd').val(prePwd);
            }
        });

    	loadSubCorpInfo();
    	toReadonly();   

    	$('#BTN_MODIFY').click(toModify);
    	$('#BTN_CANCEL').click(function() {
            toReadonly();
            loadSubCorpInfo()

        });
        jQuery('#BTN_DUPLICATE_CHK').click(isDuplicatedLoginId);
    	
        jQuery("#ADD_FORM").submit(function(e) {
            e.preventDefault();  
            
            if (!isDuplicateChkComplete ())
            {
                alert('아이디 중복체크를 먼저 해주시기 바랍니다.');
                return;
            }
            
            var pwdChanged = isPwdChanged() ? "1" : "0";
            var loginIdChanged = isLoginIdChanged() ? "1" : "0";
            
            var submitObj = { 
            	"sub_cor_idx" : "${param.subCorIdx}",
            	"loginId":"${loginId}",   
                "name": jQuery('#name').val(),
                "service_type": jQuery('input[type=radio][name=service_type]:checked').val(),
                "manager_name": jQuery('#manager_name').val(),
                "manager_phone": jQuery('#manager_phone').val(),
                "manager_dept":  jQuery('#manager_dept').val(),
                "manager_email":  jQuery('#manager_email').val(),
                "manager_position": jQuery('#manager_position').val(),
                "login_id": jQuery('#login_id').val(),
                "pwd": jQuery('#pwd').val() ,
                "is_login_id_changed": loginIdChanged,
                "is_pwd_changed" : pwdChanged
            };
            
            
            console.log(submitObj);
            
            $.ajax({
                'url': '//${cms_api_domain}/1.0/subcorporations/update',
                'type': 'post',
                'dataType': 'json',
                'cache' : false,
                'contentType': 'application/json',
                'beforeSend': function(jqXHR, setting) {
                        jqXHR.setRequestHeader('x-api-key', 'SpammerGoHome');
                }
                ,
                'data':JSON.stringify(submitObj) ,
                'success': function(data)
                {
                    toReadonly();
                    loadSubCorpInfo();
                }
                ,
                "error" : function(jqXHR, textStatus, errorThrown)
                {
                    if (jqXHR.responseJSON && jqXHR.responseJSON.messageDesc )
                    {
                        alert(jqXHR.responseJSON.messageDesc);
                    }
                    else
                    {
                        alert('수정에 실패했습니다. 잠시 후 다시 시도해 주시기 바랍니다.');
                    }
                }
            });
            
        });
    	   
    });

</script>
</html>  
