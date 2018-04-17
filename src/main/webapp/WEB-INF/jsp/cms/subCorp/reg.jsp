<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  trimDirectiveWhitespaces="true" %>
<%@include file="/WEB-INF/jsp/include/taglib.jsp" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko">
    <common:head>
        <title>ParkingOn Admin</title>
    </common:head>
    <common:body>
    <script>mixpanel.track("cms-svc reg");</script>
<!-- begin #content -->
        <div id="content" class="content">

            <!-- begin breadcrumb -->
    <ol class="breadcrumb pull-right">
        <li class="active"><a href="/cms/corp/list?mainmenu=m1&submenu=s1">HOME</a></li>
        <li class="active"><a href="/cms/corp/list?mainmenu=m1&submenu=s1">법인관리</a></li>
        <li class="active"><a href="/cms/subCorp/list?mainmenu=m1&submenu=s2">서비스 공급업체 목록</a></li>
        <li class="active"><a href="/cms/subCorp/reg?mainmenu=m1&submenu=s2">서비스 공급업체 등록</a></li>
    </ol>

    <h1 class="page-header">서비스 공급업체 등록</h1>
            <!-- begin row -->
            <div class="row">
                <form id="ADD_FORM" action="#">
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
                                    <label class="col-md-2 control-label">* ID</label>
                                    <div class="col-md-4 form-inline">
                                        <input id="login_id" type="text" class="form-control"/>
                                        <button type="button" id="BTN_DUPLICATE_CHK" class="btn btn-primary disabled" >중복체크</button>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">* PW</label>
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
                <a id="BTN_CANCEL" class="btn btn-primary">취소</a>
                <button type="submit" id="BTN_SAVE" class="btn btn-primary">저장</button>
            </div>
            </form>
            <div id="__GRID" style="position: relative; z-index: 0;"></div>
        </div>

    </common:body>
<script type="text/javascript">

// 로그인 아이디 항목이 비어있거나 
// 서버로부터 사용 가능한 아이디 여부를 확인받은 상태인지 확인 
var isDuplicateChkComplete = function()
{
    return  jQuery('#login_id').val().replace(/[ \t]/gi , "") === "" || jQuery('#login_id').val() === jQuery('#login_id').data('checkedLoginId');
}
var isDuplicatedLoginId = function ( ) 
{
     var _loginId = jQuery('#login_id').val().replace(/[ \t]/gi , "");
     if (_loginId === '')
     {
         // 아이디 항목은 필수항목이 아니기 때문에 값이 있을때에만 중복확인 필요..  
         alert('아이디를 입력하세요.');
         jQuery('#login_id').focus();
         return;
     }
    
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

jQuery(document).ready(function(){

    // 아이디 중복체크 버튼 
    jQuery('#BTN_DUPLICATE_CHK').click(function(){
        isDuplicatedLoginId();
    });
    
     jQuery('#login_id').keyup(function(evt)
     {
        var _loginId = jQuery('#login_id').val().replace(/[ \t]/gi , "");
        if (_loginId !== '' && evt.target.value.length >= 2)
        {
            jQuery('#BTN_DUPLICATE_CHK').removeClass('disabled');
        }
        else
        {
            jQuery('#BTN_DUPLICATE_CHK').addClass('disabled');
        }
    }); 
    
    validate.addElement(jQuery('#name'), {kor: true, number: true, eng: true, space: true, special: true, required: true});
    validate.addElement(jQuery('#manager_name'), {kor: true, number:true, eng: true, space: true});
    validate.addElement(jQuery('#manager_phone'), {number: true, minLength: 9, maxLength: 11});
    validate.addElement(
        [jQuery('#manager_dept'), jQuery('#manager_position')],
        {kor: true, number: true, eng: true, space: true, special: true}
    );
    validate.addElement(jQuery('#login_id'), {eng: true, number: true, myReg: '\\-&_@\\(\\)\\.,', min: 2, maxLength: 20});
    validate.addElement(jQuery('#pwd'), {kor: true, eng: true, special: true, number: true, maxLength: 50, required:true});

    jQuery("#ADD_FORM").submit(function(e) {
            e.preventDefault();
        if (isDuplicateChkComplete ())
        {
            var submitObj = { "loginId":"${loginId}",   
                              "name": jQuery('#name').val(),
                              "service_type": jQuery('input[type=radio][name=service_type]:checked').val(),
                              "manager_name": jQuery('#manager_name').val(),
                              "manager_phone": jQuery('#manager_phone').val(),
                              "manager_email": jQuery('#manager_email').val(),
                              "manager_dept":  jQuery('#manager_dept').val(),
                              "manager_position": jQuery('#manager_position').val(),
                              "login_id": jQuery('#login_id').val(),
                              "pwd": jQuery('#pwd').val() };
            PKOAjax.request (
                     '//${cms_api_domain}/1.0/subcorporation/insert'
                    ,'POST'
                    , submitObj
                    , function(result)
                       {
                           if (result.status == 200)
                           {
                               alert(result.messageDesc);
                               document.location.href="//${cms_ui_domain}${pageContext.request.contextPath}/cms/subCorp/list?mainmenu=m1&submenu=s2";
                           }
                       }
            );
        }
        else
        {
            alert('아이디 중복체크를 먼저 해주시기 바랍니다.');
        }       

        
        
    })

    jQuery('#BTN_CANCEL').click(function(){
        document.location.href="//${cms_ui_domain}${pageContext.request.contextPath}/cms/subCorp/list?mainmenu=m1&submenu=s2";
    });
});

</script>
</html>  
