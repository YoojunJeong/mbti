<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  trimDirectiveWhitespaces="true" %>
<%@include file="/WEB-INF/jsp/include/taglib.jsp" %>
<spring:message code="const.corp.login_id" var="_login_id_invalid_title_"></spring:message>
<spring:message code="const.loginPwd"      var="_login_pwd_invalid_title_"></spring:message>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko">
    <common:head>
        <link rel="stylesheet" href="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/bootstrap-fileinput-master/css/fileinput.min.css" type="text/css" />
        <link rel="stylesheet" href="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/bootstrap-fileinput-master/css/fileinput-rtl.min.css" type="text/css" />
        <title>ParkingOn ___Admin</title>
    </common:head>
    <common:body>
    <script>mixpanel.track("cms-cor detail");</script>
<!-- begin #content -->
<div id="content" class="content">
    <!-- begin breadcrumb -->

    <ol class="breadcrumb pull-right">
        <li class="active"><a href="/cms/corp/list?mainmenu=m1&submenu=s1">HOME</a></li>
        <li class="active"><a href="/cms/corp/list?mainmenu=m1&submenu=s1">법인관리</a></li>
        <li class="active"><a href="/cms/corp/list?mainmenu=m1&submenu=s1">법인목록</a></li>
        <li class="active"><a href="javascript:window.location.reload(true)">법인상세</a></li>
    </ol>

    <h1 class="page-header">법인상세</h1>
    <!-- begin row -->
    <div class="row">
    <form id="ADD_FORM" action="#">
        <button id="__HIDDEN_SUBMIT_BTN" type="submit" class="btn btn-primary" style="display:none;">저장</button>
        <div class="col-md-9">
            <div class="panel panel-inverse" data-sortable-id="form-plugins-1">
                <div class="panel-heading">
                    <h4 class="panel-title">기본 정보</h4> 
                </div>
            <div class="panel-body panel-form">
                <div class="form-horizontal form-bordered">
                    <div class="form-group">
                        <label class="col-md-2 control-label">* 회사명(업체명)</label>
                        <div class="col-md-3"><input id="name" type="text" class="form-control"/></div>
                        <div class="col-md-5 form-inline">
                            <a id="USER_LIST_ANCHOR" href="/cms/corp/c${param.corIdx}/users?mainmenu=m1&submenu=s1" class="btn btn-primary">사용자 목록</a>
                            <a id="MEMBERS_POINT_LIST_ANCHOR" href="//${cms_ui_domain}/cms/point/list?mainmenu=m2&submenu=s1" class="btn btn-primary" 
                                style="display:none;"
                               data-bluemembers-btn="true">Bluemembers 포인트 이력 조회</a>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label">* 사업자등록번호</label>
                        <div class="col-md-3"><input id="reg_number" type="text" class="form-control"/></div>
                        <div class="col-md-1">
                            <button type="button" id="BTN_REG_DUPLICATE_CHK" class="btn btn-primary disabled">중복체크</button>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label">업종</label>
                        <div class="col-md-4"><input id="biz_type" type="text" class="form-control"/></div>
                        <label class="col-md-2 control-label">종목</label>
                        <div class="col-md-4"><input id="biz_industry" type="text" class="form-control"/></div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label">대표자</label>
                        <div class="col-md-4"><input id="ceo_name" type="text" class="form-control"/></div>
                        <label class="col-md-2 control-label">대표번호</label>
                        <div class="col-md-4"><input id="phone_number" type="text" class="form-control"/></div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label">계좌</label>
                        <div class="col-md-2">
                        <!--  TEXT -->
                                <span id="__BANK_NAME_TXT" class="form-control" style="background:#e5e9ed;opacity:0.5;"></span>
                       <!--  SELECT BOX -->
                            <select  class="form-control" id="bank_cd" style="display:none;">
                                <option value="">은행(선택하세요)</option>
                                <c:forEach var="item" items="${bankCodeMap}">
                                    <option value="${item.value}"><spring:message code="${item.key}"></spring:message></option>
                                </c:forEach>
                            </select>
                        </div> 
                        <div class="col-md-3">
                            <input id="bank_account_number" type="text" class="form-control" placeholder="계좌번호" value=""/>
                        </div> 
                        <div class="col-md-5"> </div> 
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

                    <div class="form-group">
                        <label class="col-md-2 control-label">사업자 주소</label>
                        <div class="col-md-10"> 
                            <div class="row">
                                <div class="col-md-3"> 
                                    <input type="text" class="form-control" id="zip_cd" name="zip_cd" value="" readonly="readonly" placeholder="우편번호"></input>
                                </div>
                                <div class="col-md-2">
                                    <label for=""><a id="search_zip_code" class="btn btn-primary">찾기</a></label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-5"><input class="form-control" type="text" id="address" placeholder="주소" readonly="readonly"/> </div>
                                <div class="col-md-7"><input class="form-control" type="text" id="address_detail" placeholder="상세주소" /> </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div id="zip_code_wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
                                        <img src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
        </div>
        <div class="col-md-9">
            <div class="panel panel-inverse" data-sortable-id="form-plugins-1">
                <div class="panel-heading"><h4 class="panel-title">계약 정보</h4></div>
                <div class="panel-body panel-form">
                    <div  class="form-horizontal form-bordered">
                    <div class="form-group">
                        <label class="col-md-2 control-label">계약구분</label>
                        <div class="col-md-8 form-inline">
                        <!--  텍스트  -->
                            <span id="__CONTRACT_TYPE_TXT" class="form-control" style="background:#e5e9ed;opacity:0.5;width:25%;"></span>
                            <!--  RADIO 영역.. -->
                            <div class="input-group" style="display:none;">
                                <span class="input-group-addon"><input type="radio" name="contract_type" checked="checked" value="1"></input></span>
                                <span class="form-control">일반</span>
                            </div>
                            <div class="input-group" style="display:none;">
                                <span class="input-group-addon"><input type="radio" name="contract_type" value="2"></input></span>
                                <span class="form-control">블루멤버스</span>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label">계약기간</label>
                        <div class="col-md-10 form-inline">
                            <div class='input-group date datetimepicker-date'>
                                <input type='text' id="start_date" name="start_date" class="form-control"/><span class="input-group-addon datepick"><span class="glyphicon glyphicon-calendar"></span></span>
                            </div>
                            <span>~</span>
                            <div class='input-group date datetimepicker-date'>
                                <input type='text' id="end_date" name="end_date" class="form-control"/><span class="input-group-addon datepick"><span class="glyphicon glyphicon-calendar"></span></span>
                            </div>
                        </div> 
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label">정산일</label>
                        <div class="col-md-3">
                            <div class="input-group">
                                <span class="input-group-addon"><span>매월</span></span>
                                <select id="pay_date" class="form-control">
                                    <option value="">선택안함</option>
                                    <c:forEach begin="1" end="31" step="1" var="opt">
                                        <option value="${opt}">${opt}</option>
                                    </c:forEach>
                                </select>
                                <span class="input-group-addon"><span>일</span></span>
                            </div>
                        </div>
                        <label class="col-md-2 control-label">할인율</label>
                        <div class="col-md-3">
                        <!--  텍스트  -->
                            <span id="__DISCOUNT_RATE_TXT" class="form-control" style="background:#e5e9ed;opacity:0.5;"></span>
                            <!--  RADIO 영역.. -->
                            <div class="input-group"   style="display:none;">
                                <select id="discount_rate" class="form-control">
                                    <option value="0">없음</option>
                                    <c:forEach begin="5" end="100" step="5" var="opt">
                                        <option value="${opt * 0.1}">${opt * 0.1}</option>
                                    </c:forEach>
                                </select>
                                <span class="input-group-addon"><span>%</span></span>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label">사용제한</label>
                        <div class="col-md-8 form-inline">
                        <!--  텍스트  -->
                            <span id="__USE_LIMIT_TXT" class="form-control" style="background:#e5e9ed;opacity:0.5;width:25%;"></span>

                            <div class="input-group"  style="display:none;">
                                <span class="input-group-addon"><input type="radio" name="use_limit"  value="1"></input></span>
                                <span class="form-control"><spring:message code="const.use_lmiit.using"/></span>
                            </div>
                            <div class="input-group"  style="display:none;">
                                <span class="input-group-addon"><input type="radio" name="use_limit" checked="checked" value="0"></input></span>
                                <span class="form-control"><spring:message code="const.use_lmiit.none"/></span>
                            </div>
                        </div>
                    </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 설정 START -->
        <div class="col-md-9">
            <div class="panel panel-inverse" data-sortable-id="form-plugins-1">
                <div class="panel-heading"><h4 class="panel-title">설정</h4></div>
                <div class="panel-body panel-form">
                    <div class="form-horizontal form-bordered">
                    <div class="form-group">
                        <label class="col-md-2 control-label">관리자프로그램</label>
                        <div class="col-md-10 form-inline">
                        <!--  텍스트  -->
                            <span id="__MANAGE_PROG_TXT" class="form-control" style="background:#e5e9ed;opacity:0.5;width:25%;"></span>

                            <div class="input-group readonly_marker" style="display:none;">
                                <span class="input-group-addon"><input type="radio" name="manage_prog" value="0"></input></span>
                                <span class="form-control">개별설치</span>
                            </div>
                            <div class="input-group readonly_marker" style="display:none;">
                                <span class="input-group-addon"><input type="radio" name="manage_prog" checked="checked" value="1"></input></span>
                                <span class="form-control">통합</span>
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon">ID</span>
                                <input class="form-control" id="login_id" type="text"></input>
                            </div>
                            <div class="input-group">
                                <button type="button" id="BTN_DUPLICATE_CHK" class="btn btn-primary disabled"  style="display:none;" >중복체크</button>
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon">PW</span>
                                <input class="form-control" id="pwd" type="password"  autocomplete="new-password"></input>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label">가입승인 SMS </label>
                        <div class="col-md-3">
                            <!-- 개발안됨 -->
                            <input type="text" id="intro_sms_msg" class="form-control" disabled="disabled"></input>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label">복수업체 선택</label>
                        <div id="sub_cor_select_wrap" class="col-md-3" style="display:none;">
                            <select class="form-control" name="sub_cor">
                                <option value="-1">선택하세요</option>
                            </select>
                        </div>
                        <div class="col-md-7 form-inline" id="sub_cor_wrap">
                            
                        </div>
                    </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 설정   END -->
    </form>
    <form id="_FILE_UPLOAD_FORM"  method="POST" enctype="multipart/form-data">
        <!-- 설정 START -->
        <div class="col-md-9">
            <div class="panel panel-inverse" data-sortable-id="form-plugins-1">
                <div class="panel-heading"><h4 class="panel-title">CI</h4></div>
                <div class="panel-body panel-form">
                    <div class="form-horizontal form-bordered">
                    <div class="form-group">
                        <label class="col-md-2 control-label">CI 관리</label>
                        <div class="col-md-8 form-inline">
                            <input type="file" id="sourceFile" name="sourceFile" class="file"></input>
                        <img id="ci_img_url" width="100" src=""/>
                        </div>
                    </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
        
        <!-- 설정   END -->
        <div class="col-md-9">
            <button id="BTN_CANCEL" type="button" class="btn btn-primary">취소</button>
            <button id="BTN_SAVE"   type="button" class="btn btn-primary">저장</button>
            <button id="BTN_MODIFY" type="button" class="btn btn-primary">수정</button>
        </div>
    </div>
    <div>
        
    </div>
    <!-- end row -->
    <div id="__GRID" style="position: relative; z-index: 0;"></div>
</div>

    </common:body>

<script type="text/javascript" src="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/jqwidget/jqxcore.js"></script>
<script type="text/javascript" src="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/jqwidget/jqxdata.js"></script>
<script type="text/javascript" src="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/jqwidget/jqxbuttons.js"></script>
<script type="text/javascript" src="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/jqwidget/jqxscrollbar.js"></script>
<script type="text/javascript" src="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/jqwidget/jqxmenu.js"></script>
<script type="text/javascript" src="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/jqwidget/jqxlistbox.js"></script>
<script type="text/javascript" src="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/jqwidget/jqxdropdownlist.js"></script>
<script type="text/javascript" src="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/jqwidget/jqxgrid.js"></script>
<script type="text/javascript" src="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/jqwidget/jqxgrid.selection.js"></script>
<script type="text/javascript" src="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/jqwidget/jqxgrid.columnsresize.js"></script>
<script type="text/javascript" src="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/jqwidget/jqxgrid.filter.js"></script>
<script type="text/javascript" src="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/jqwidget/jqxgrid.sort.js"></script>
<script type="text/javascript" src="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/jqwidget/jqxgrid.pager.js"></script>
<script type="text/javascript" src="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/jqwidget/jqxgrid.grouping.js"></script>
<!-- //Required files for grid -->
<!-- Optional files for grid -->
<script type="text/javascript" src="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/jqwidget/jqxcheckbox.js"></script>
<script type="text/javascript" src="//${asset_static_domain}${pageContext.request.contextPath}/assets/js/jquery.form.min.js"></script>
<script type="text/javascript" src="//dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">

var bankCodeMap = {};
<c:forEach var="item" items="${bankCodeMap}">
bankCodeMap['${item.value}'] = '<spring:message code="${item.key}"></spring:message>';
</c:forEach>

//로그인 아이디 항목이 비어있거나 
// 서버로부터 사용 가능한 아이디 여부를 확인받은 상태인지 확인 
    var isDuplicateChkComplete = function()
    {
        return  jQuery('#login_id').val().replace(/[ \t]/gi , "") === "" 
             || jQuery('#login_id').val() === jQuery('#login_id').data('pre-login-id')
             || jQuery('#login_id').val() === jQuery('#login_id').data('checkedLoginId') ;
    }
    
    // 사업자 등록번호 항목이 비어있거나
   // 서버로부터 사용 가능한 아이디 여부를 확인받안 상태인지 확인
       var isDuplicateRegChkComplete = function()
       {
           return  jQuery('#reg_number').val() === "" 
             || jQuery('#reg_number').val() === jQuery('#reg_number').data('pre-reg-num')
             || jQuery('#reg_number').val() === jQuery('#reg_number').data('checkedRegNumber') ;
       }
    var isDuplicatedLoginId = function ( ) 
    {
         var _loginId = jQuery('#login_id').val().replace(/[ \t]/gi , "");
         if (_loginId === '')
         {
             // 아이디 항목은 필수항목이 아니기 때문에 값이 있을때에만 중복확인 필요..  
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
    var isDuplicatedRegNum = function (n)
   {
        var _reg_number = jQuery('#reg_number').val().replace(/[ \t]/gi , "");
        PKOAjax.request (
         /* URL      */ "//${cms_api_domain}/1.0/cms/corp/"+ _reg_number +"/isDuplicateRegNum"
        ,/* METHOD   */ "post"
        ,/* DATA     */ new Object()
        , function(data) /* CALLBACK */ 
        {
            if (data.status == 200)
            {
                if (data.body === true) 
                {
                    alert("이미 사용중인 사업자등록번호 입니다.");
                }
                else
                {
                    alert('사용 가능한 사업자등록번호 입니다.');
                    jQuery('#reg_number').data('checkedRegNumber', jQuery('#reg_number').val());
                }
            }
        });
   }
	var loadSubCorp = function()
	{
        PKOAjax.request("//${cms_api_domain}/1.0/subcorporation/list", "post", new Object(), function(data){
            if (data.body.totalCount > 0)
            {
                var list = data.body.list;
                console.log(data);
                
                jQuery(list).each(function(idx , elem){
                    jQuery('select[name=sub_cor]').append('<option value='+ elem['sub_cor_idx']+'>'+elem['name']+'</option>');
                });
            } 
        });
	}

	var clickManagerProgRadioBox = function ()
	{
		// 0 : 개별설치
		// 1 : 통합설치
		var chkedValue = jQuery(this).val();
		
		if (chkedValue == 0)
		{
			jQuery('#login_id').prop('readonly', true);
			jQuery('#pwd').prop('readonly', true);
		}
		else
		{
			jQuery('#login_id').prop('readonly', false);
			jQuery('#pwd').prop('readonly', false);
		}
		
	}

    var loadCorpInfo = function()
    {
        $.ajax({
            "url": '//${cms_api_domain}/1.0/corporations/${param.corIdx}',
            "type": 'get',
            "dataType": 'json',
            "cache" : false,
            "beforeSend": function(jqXHR, setting) {
                    jqXHR.setRequestHeader('x-api-key', 'SpammerGoHome');
            },
            "success": function(data, textStatus, jqXHR) {
            console.log(data)
                if (data.status == 200)
                {
                    jQuery('#ceo_name').val(data.body.ceo_name);         // 대표자
                    jQuery('#name').val(data.body.name);                 // 회사명
                    jQuery('#reg_number').val(data.body.reg_number);     // 사업자등록번호
                    jQuery('#reg_number').data("pre-reg-num", data.body.reg_number);//.val(data.body.login_id);//.prop('readonly', true); // 관리자 프로그램 ID
                    jQuery('#biz_type').val(data.body.biz_type);         // 업종
                    jQuery("#biz_industry").val(data.body.biz_industry); // 종목
                    jQuery('#phone_number').val(data.body.phone_number); // 대표번호
                    jQuery('#bank_account_number').val(data.body.bank_account_number);// 계좌 계좌번호
                    jQuery('#manager_name').val(data.body.manager_name);// 담당자명
                    jQuery('#manager_dept').val(data.body.manager_dept);// 담당자 부서
                    jQuery('#manager_position').val(data.body.manager_position);// 담당자 직급
                    jQuery('#manager_phone').val(data.body.manager_phone);// 담당자 연락처 (전화번호
                    jQuery('#manager_email').val(data.body.manager_email);// 담당자 연락처 (전화번호
                    jQuery('#zip_cd').val(data.body.zip_cd);// 사업자주소  (우편번호
                    jQuery('#address').val(data.body.address);//.prop('readonly', true);            // 사업자주소 (상세주소)
                    jQuery('#address_detail').val(data.body.address_detail);//.prop('readonly', true);            // 사업자주소 (상세주소)
                    jQuery('#start_date').val(data.body.start_date);//.prop('readonly', true);   // 계약기간 (start)
                    jQuery('#end_date').val(data.body.end_date);//.prop('readonly', true);       // 계약기간 (to)
                    jQuery('#pay_date').val(data.body.pay_date);//.prop('readonly', true);       // 정산일 (..)
                    jQuery('#login_id').val(data.body.login_id);//.prop('readonly', true); // 관리자 프로그램 ID
                    jQuery('#login_id').data("pre-login-id", data.body.login_id);//.val(data.body.login_id);//.prop('readonly', true); // 관리자 프로그램 ID
                    jQuery('#pwd').val(data.body.pwd);//.prop('readonly', true); // PWD
                    jQuery('#pwd').data("pre-pwd", data.body.pwd);
                    jQuery('#intro_sms_msg').val(data.body.intro_sms_msg);//.prop('readonly', true);// PWD

                    // radio, select
                    var bankCodeTxt = bankCodeMap[data.body.bank_cd];
                    if (bankCodeTxt)
                    {
                    	console.log('은행명 세팅합니다.');
                        jQuery('#bank_cd').val(data.body.bank_cd);jQuery('#__BANK_NAME_TXT').html(bankCodeTxt);
                    }

                    jQuery('[name=contract_type][value='+data.body.contract_type+']').prop('checked', true);
                    var contractTypeTxt = data.body.contract_type === 1 ? "일반"  :
                                          data.body.contract_type === 2 ? "블루멤버스" : "" ;
                    jQuery('#__CONTRACT_TYPE_TXT').html( contractTypeTxt );

                    if (data.body.discount_rate <= 0)
                    {
                        jQuery('#discount_rate').val("0");
                        jQuery('#__DISCOUNT_RATE_TXT').html('없음');
                    }
                    else
                    {
                        jQuery('#discount_rate').val(parseFloat(data.body.discount_rate).toFixed(1));
                        jQuery('#__DISCOUNT_RATE_TXT').html(parseFloat(data.body.discount_rate).toFixed(1));
                    }

                    jQuery('[name=use_limit][value='+data.body.use_limit+']').prop('checked', true);
                    var useLimitTxt = data.body.use_limit === 0 ? "없음" :
                                          data.body.use_limit === 1 ? "있음" : "";
                    jQuery('#__USE_LIMIT_TXT').html(useLimitTxt);

                    jQuery('[name=manage_prog][value='+data.body.manage_prog+']').prop('checked', true);
                    var manageProdTxt = data.body.manage_prog === 0 ? "개별설치"  :
                                        data.body.manage_prog === 1 ? "통합" : "";
                    jQuery('#__MANAGE_PROG_TXT').html(manageProdTxt);

                    jQuery('#ci_img_url').attr('src', data.body.ci_img_url);
                    
                    
                    // subCorpInfo 
                    jQuery('#sub_cor_wrap').html('');
                    jQuery(data.body.sub_cor_list).each(function(idx, elem){
                    	addSubCorp(elem['name'], elem['sub_cor_idx'], false);
                    });
                    
                    if (data.body.contract_type === 1) 
                    {
                        jQuery('[data-bluemembers-btn]').hide();
                    }
                    else if (data.body.contract_type === 2)
                    {
                        jQuery('[data-bluemembers-btn]').show();
                    }
                    
                }
                else
                {
                    alert('법인정보 조회에 실패했습니다. 잠시 후 다시 reload 해주시기 바랍니다.');
                }
            }
        });
    }

    // 우편번호 찾기 찾기 화면을 넣을 element
    var element_wrap = document.getElementById('zip_code_wrap');
    
    function foldDaumPostcode() {
         // iframe을 넣은 element를 안보이게 한다.
        element_wrap.style.display = 'none';
    }

   function execDaumPostcode() {
       // 현재 scroll 위치를 저장해놓는다.
       var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
       new daum.Postcode({
           oncomplete: function(data) {
                console.log(data);
               // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

               // 각 주소의 노출 규칙에 따라 주소를 조합한다.
               // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
               var fullAddr = data.address; // 최종 주소 변수
               var extraAddr = ''; // 조합형 주소 변수

               // 기본 주소가 도로명 타입일때 조합한다.
               if(data.addressType === 'R'){
                   //법정동명이 있을 경우 추가한다.
                   if(data.bname !== ''){
                       extraAddr += data.bname;
                   }
                   // 건물명이 있을 경우 추가한다.
                   if(data.buildingName !== ''){
                       extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                   }
                   // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                   fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
               }

               // 우편번호와 주소 정보를 해당 필드에 넣는다.
               // document.getElementById('sample3_postcode').value = data.zonecode; //5자리 새우편번호 사용
               // document.getElementById('sample3_address').value = fullAddr;
               jQuery('#zip_cd').val(data.zonecode);
               jQuery('#address').val(fullAddr);

               // iframe을 넣은 element를 안보이게 한다.
               // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
               element_wrap.style.display = 'none';

               // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
               document.body.scrollTop = currentScroll;
           },
           // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
           onresize : function(size) {
               element_wrap.style.height = size.height+'px';
           },
           width : '100%',
           height : '100%'
       }).embed(element_wrap);

       // iframe을 넣은 element를 보이게 한다.
       element_wrap.style.display = 'block';
   }
   var changeToModify = function() {
     jQuery('#ceo_name').prop('readonly', false) ;      // 대표자
    jQuery('#name').prop('readonly', false);           // 회사명
    jQuery('#reg_number').prop('readonly', false);     // 사업자등록번호
    jQuery('#biz_type').prop('readonly', false);       // 업종
    jQuery("#biz_industry").prop('readonly', false);   // 종목
    jQuery('#phone_number').prop('readonly', false);   // 대표번호
    jQuery('#bank_account_number').prop('readonly', false); // 계좌 계좌번호
    jQuery('#manager_name').prop('readonly', false); // 담당자명
    jQuery('#manager_dept').prop('readonly', false); // 담당자 부서
    jQuery('#manager_position').prop('readonly', false); // 담당자 직급
    jQuery('#manager_phone').prop('readonly',false); // 담당자 연락처 (전화번호
    jQuery('#manager_email').prop('readonly',false); // 담당자 연락처 (전화번호
    jQuery('#zip_cd').prop('readonly', false);       // 사업자주소  (우편번호
    jQuery('#address_detail').prop('readonly', false); // 사업자주소 (상세주소)
    jQuery('#start_date').prop('readonly', false);     // 계약기간 (start)
    jQuery('#start_date').prop('disabled', false);     // 계약기간 (start)
    jQuery('#end_date').prop('readonly', false);       // 계약기간 (to)
    jQuery('#end_date').prop('disabled', false);       // 계약기간 (to)
    jQuery('#pay_date').prop('disabled', false);       // 정산일 (..)
    jQuery('[name=manage_prog]:checked').prop('readonly', false); // 관리자프로그램 (개별, 통합 )

    jQuery('.datepick').css('display', "")

     // 0 : 개별설치
     // 1 : 통합설치
    var chkedValue = jQuery('[name=manage_prog]:checked').val();
    if (chkedValue == 0)
    {
        jQuery('#login_id').prop('readonly', true);
        jQuery('#pwd').prop('readonly', true);
    }
    else
    {
        jQuery('#login_id').prop('readonly', false);
        jQuery('#pwd').prop('readonly', false);
    }
    
    jQuery('#intro_sms_msg').prop('readonly', false); // PWD

    jQuery('#bank_cd').show();  jQuery('#__BANK_NAME_TXT').hide();  // 계좌 은행명
    jQuery('div.input-group', jQuery('#__CONTRACT_TYPE_TXT').parent('div')).show(); jQuery('#__CONTRACT_TYPE_TXT').hide(); // 계약구분
    jQuery('div.input-group', jQuery('#__DISCOUNT_RATE_TXT').parent('div')).show(); jQuery('#__DISCOUNT_RATE_TXT').hide(); // 할인율
    jQuery('div.input-group', jQuery('#__USE_LIMIT_TXT').parent('div')).show(); jQuery('#__USE_LIMIT_TXT').hide(); // 할인율
    jQuery('div.input-group.readonly_marker', jQuery('#__MANAGE_PROG_TXT').parent('div')).show(); jQuery('#__MANAGE_PROG_TXT').hide(); // 할인율


    // jQuery('#_FILE_UPLOAD_FORM').show();
    jQuery('#sourceFile').removeAttr("disabled");


    jQuery('#search_zip_code').css('visibility', 'visible');

    // 취소, 저장버튼 숨긴다.
    jQuery('#BTN_CANCEL').show();//.css('visibility', 'hidden');
    jQuery('#BTN_SAVE').show();//.css('visibility', 'hidden');
    // 사용자 아이디 중복체크 버튼 노출 
    jQuery('#BTN_DUPLICATE_CHK').show();
    jQuery('#sub_cor_select_wrap').show();

    // 수정버튼 노출
    jQuery('#BTN_MODIFY').hide();//.css('visibility', 'hidden');
    
    // 사용자 목록조회 페이지 이동버튼 숨김.
    jQuery('#USER_LIST_ANCHOR').hide();
    // 블루멤버스 포인트 이력조회 페이지 이동버튼 숨김. 
    jQuery('#MEMBERS_POINT_LIST_ANCHOR').hide();
    
    
    //선택된 복수업체의 style attribute 를 삭제한다. 
    //해당attribute 를 삭제해야 정상적으로 X 버튼이 노출된다. 
    $('#sub_cor_wrap').find('.input-group-addon').removeAttr('style');
    
    
    // scroll 을 최상단으로 이동한다.
    window.scrollTo(0,0);
    
    
   }
   
   var changeToReadonly = function() {
    // 상세화면 이므로 readonly 로 변경한다.
    jQuery('#ceo_name').prop('readonly', true) ;      // 대표자
    jQuery('#name').prop('readonly', true);             // 회사명
    jQuery('#reg_number').prop('readonly', true);   // 사업자등록번호
    jQuery('#biz_type').prop('readonly', true);      // 업종
    jQuery("#biz_industry").prop('readonly', true);   // 종목
    jQuery('#phone_number').prop('readonly', true);   // 대표번호
    jQuery('#bank_account_number').prop('readonly', true); // 계좌 계좌번호
    jQuery('#manager_name').prop('readonly', true); // 담당자명
    jQuery('#manager_dept').prop('readonly', true); // 담당자 부서
    jQuery('#manager_position').prop('readonly', true); // 담당자 직급
    jQuery('#manager_phone').prop('readonly', true); // 담당자 연락처 (전화번호
    jQuery('#manager_email').prop('readonly', true); // 담당자 연락처 (전화번호
    jQuery('#zip_cd').prop('readonly', true);   // 사업자주소  (우편번호
    jQuery('#address_detail').prop('readonly', true);            // 사업자주소 (상세주소)
    jQuery('#start_date').prop('readonly', true);   // 계약기간 (start)
    jQuery('#start_date').prop('disabled', true);   // 계약기간 (start)
    jQuery('#end_date').prop('readonly', true);       // 계약기간 (to)
    jQuery('#end_date').prop('disabled', true);       // 계약기간 (to)

    jQuery('#pay_date').prop('disabled', true);       // 정산일 (..)
    jQuery('[name=manage_prog]:checked').prop('readonly', true); // 관리자프로그램 (개별, 통합 )
    jQuery('#login_id').prop('readonly', true); // 관리자 프로그램 ID
    jQuery('#pwd').prop('readonly', true); // PWD
    jQuery('#intro_sms_msg').prop('readonly', true);// PWD

    jQuery('.datepick').css('display', "none")


    // radio, select
    jQuery('#bank_cd').hide();  jQuery('#__BANK_NAME_TXT').show();  // 계좌 은행명
    jQuery('div.input-group', jQuery('#__CONTRACT_TYPE_TXT').parent('div')).hide(); jQuery('#__CONTRACT_TYPE_TXT').show(); // 계약구분
    jQuery('div.input-group', jQuery('#__DISCOUNT_RATE_TXT').parent('div')).hide(); jQuery('#__DISCOUNT_RATE_TXT').show(); // 할인율
    // 사용제한
    jQuery('div.input-group', jQuery('#__USE_LIMIT_TXT').parent('div')).hide(); jQuery('#__USE_LIMIT_TXT').show(); 
    // 관리자 프로그램
    jQuery('div.input-group.readonly_marker', jQuery('#__MANAGE_PROG_TXT').parent('div')).hide(); jQuery('#__MANAGE_PROG_TXT').show(); 


    // jQuery('#_FILE_UPLOAD_FORM').hide();
    jQuery('#sourceFile').attr('disabled', 'disabled')

    // 주소검색 버튼 숨긴다.
    jQuery('#search_zip_code').css('visibility', 'hidden');

    // 취소, 저장버튼 숨긴다.
    jQuery('#BTN_CANCEL').hide();//.css('visibility', 'hidden');
    jQuery('#BTN_SAVE').hide();//.css('visibility', 'hidden');
    // 사용자 아이디 중복체크 버튼 노출 
    jQuery('#BTN_DUPLICATE_CHK').hide();
    jQuery('#sub_cor_select_wrap').hide();

    // 수정버튼 노출
    jQuery('#BTN_MODIFY').show();//.css('visibility', 'hidden');
    
    // 사용자 목록조회 페이지 이동버튼 숨김.
    jQuery('#USER_LIST_ANCHOR').show();
;
    
    
    // style 속성값을 추가한다. 
    $('#sub_cor_wrap').find('.input-group-addon').show();//.addAttr('style', 'display:none;');
    

   }

var addSubCorp = function(text,  value, isBtn)
{
	console.log(isBtn);
    jQuery('#sub_cor_wrap').append('<div class="input-group" data-sub-cor-idx="'+ value +'"><span class="form-control">'+text+'</span>'
                                   + '<span '
                                   + (isBtn !== true ? 'style="display:none;"' : "")
                                   +' data-tag="sub-cor-tag" class="input-group-addon">X</span>'
                                   + '</div>');
    jQuery('#sub_cor_wrap').append(' ');
}

jQuery(document).ready(function(){
	// 체크박스 선택에 따라 아이디/비밀번호 입력창 readonly, not readonly 처리 
    jQuery('input[type=radio][name=manage_prog]').click(clickManagerProgRadioBox);

    // 선택된 서비스 제공업체 삭제 이벤트 핸들러...
    jQuery(document).on('click' , function(e){
        if (jQuery(e.srcElement).data('tag') === 'sub-cor-tag')
        {
             e.preventDefault();
            jQuery(e.srcElement).parent('div[data-sub-cor-idx]').remove();
        }
    });
    
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
    jQuery('#reg_number').keyup(function(e) { 
        var reg_num = jQuery(this).val();
        var pre = jQuery('#reg_number').data('pre-reg-num');
        if(e.target.value.length >= 10) 
        {
            if(reg_num == pre) 
            {
                jQuery('#BTN_REG_DUPLICATE_CHK').addClass('disabled');
            }
            else 
            {
                jQuery('#BTN_REG_DUPLICATE_CHK').removeClass('disabled')
            }
        }
        else {
            jQuery('#BTN_REG_DUPLICATE_CHK').addClass('disabled');
        }
    })
    
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

    // 아이디 중복체크 버튼 
    jQuery('#BTN_DUPLICATE_CHK').click(function(){
        isDuplicatedLoginId();
    });
    jQuery('#BTN_REG_DUPLICATE_CHK').click(function() {
        isDuplicatedRegNum();
    })
    jQuery('select[name=sub_cor]').change(function(){
        
        var thisVal = jQuery(this).val();
        if (jQuery('div.input-group[data-sub-cor-idx='+thisVal+']', '#sub_cor_wrap').size() === 0 && thisVal > 0)
        {
        	addSubCorp( jQuery(this).find('option:selected').html() , thisVal , true );
          // jQuery('#sub_cor_wrap').append('<div class="input-group" data-sub-cor-idx="'+ thisVal +'"><span class="form-control">'+jQuery(this).find('option:selected').html()+'</span><span data-tag="sub-cor-tag" class="input-group-addon">X</span></div>');
          // jQuery('#sub_cor_wrap').append(' ');
        }
    });
    
    PK_COMN.toDatePicker('.datetimepicker-date');

    var setting= { kor: true, eng: true, space: true, special: true, number: true, minLength: 3, maxLength: 10, required: true, type: "type", max: "max", myReg: "reg" }


    validate.addElement(jQuery('#name'), {kor: true, eng: true, number: true, special: true, space: true, required: true, maxLength:100});
    validate.addElement([jQuery('#biz_type'), jQuery("#biz_industry")]
                      , {kor: true, eng: true, number: true, special: true, space: true, maxLength:20});
    validate.addElement([jQuery('#manager_dept'), jQuery('#manager_position')]
                      , {kor: true, eng: true, number: true, special: true, space: true , maxLength:30});
    validate.addElement(jQuery('#address_detail')
    		          , {kor: true, eng: true, number: true, special: true, space: true, maxLength : 200});

    validate.addElement(jQuery("#reg_number")
    		          , { number: true, required: true, minLength: 10, maxLength:10 });
    validate.addElement( [jQuery('#ceo_name'), jQuery('#manager_name')]
                      , { kor: true, eng: true, space: true, maxLength:30});
    validate.addElement(jQuery('#phone_number'), { number: true, minLength: 9, maxLength: 11});
    validate.addElement(jQuery('#bank_account_number'), { number: true, myReg: "\\-" });
    validate.addElement(jQuery('#pay_date'), { type: "number", max: 31 });

    validate.addElement(jQuery('#login_id'), {eng: true, number: true, myReg: '\\-&_@\\(\\)\\.,', maxLength: 20});
    validate.addElement(
        [jQuery('#pwd'), jQuery("#intro_sms_msg")], 
        {kor: true, eng: true, number: true, special: true, maxLength: 50}
    );
    
    changeToReadonly();

    // 각 폼에 값 설정한다.
    loadCorpInfo();

    function updateCorp(fileObject)
    {
    	
    	var subCorIdx = [];
    	jQuery('[id=sub_cor_wrap]').children('div.input-group').each(function(idx, elem)
    	{
    		subCorIdx.push(jQuery(elem).data('sub-cor-idx'));
    	});
    	
    	var loginId =  jQuery('#login_id').val();
    	var preLoginId = jQuery('#login_id').data('pre-login-id');
    	
    	var loginPwd = jQuery('#pwd').val();
    	var prePwd   = jQuery('#pwd').data('pre-pwd');
    	
    	
    	//pre-login-id
    	
        var submitObject = {
        	"loginId":"${loginId}",	
            "idx" : "${param.corIdx}",
            "ceo_name":jQuery('#ceo_name').val(),       // 대표자
            "name" : jQuery('#name').val(),             // 회사명
            "reg_number":jQuery('#reg_number').val(),   // 사업자등록번호
            "biz_type":jQuery('#biz_type').val(),       // 업종
            "biz_industry":jQuery("#biz_industry").val(),   // 종목
            "phone_number":jQuery('#phone_number').val(),   // 대표번호
            "bank_cd":jQuery('#bank_cd').val(),             // 계좌 은행명
            "bank_account_number":jQuery('#bank_account_number').val(), // 계좌 계좌번호
            "manager_name":jQuery('#manager_name').val(), // 담당자명
            "manager_dept":jQuery('#manager_dept').val(), // 담당자 부서/ 직급
            "manager_position":jQuery('#manager_position').val(), // 담당자 부서/ 직급
            "manager_phone":jQuery('#manager_phone').val(), // 담당자 연락처 (전화번호
            "manager_email":jQuery('#manager_email').val(), // 담당자 연락처 (전화번호
            "zip_cd":jQuery('#zip_cd').val(),   // 사업자주소  (우편번호
            "address":jQuery('#address').val(), // 사업자주소 (주소)
            "address_detail":jQuery('#address_detail').val(),            // 사업자주소 (상세주소)
            "contract_type":jQuery('[name=contract_type]:checked').val(),  // 계약구분 0:일반 , 1: 블루멤버스
            "start_date":jQuery('#start_date').val(),   // 계약기간 (start)
            "end_date":jQuery('#end_date').val(),       // 계약기간 (to)
            "pay_date":jQuery('#pay_date').val(),       // 정산일 (..)
            "discount_rate":jQuery('#discount_rate').val(),       // 할인율
            "use_limit":jQuery('[name=use_limit]:checked').val(), // 사용제한여부
            "manage_prog":jQuery('[name=manage_prog]:checked').val(), // 관리자프로그램 (개별, 통합 )
            "login_id" :  loginId, 
            "pwd" : loginPwd,
            "intro_sms_msg": jQuery('#intro_sms_msg').val(), // 가입승인 SMS (템플릿에서 선택하거나 input 박스로 입력받도록 해야한다.)
            "sub_cor": subCorIdx.join(','),   // 
            "ci_img_url":fileObject.path // CI
        };
    	
        
        if (jQuery('[name=manage_prog]:checked').val() == 1 && loginId !== preLoginId)
        {
    		submitObject['is_login_id_changed'] = 1;
        }
        else 
        {
    		submitObject['is_login_id_changed'] = 0;
        }

        if (jQuery('[name=manage_prog]:checked').val() == 1 && loginPwd !== prePwd)
    	{
    		submitObject['is_pwd_changed'] = 1;
    	}
        else
        {
    		submitObject['is_pwd_changed'] = 0;
        }

        $.ajax({
            'url': '//${cms_api_domain}/1.0/corporations/update',
            'type': 'post',
            'dataType': 'json',
            'contentType': 'application/json',
            'beforeSend': function(jqXHR, setting) {
                    jqXHR.setRequestHeader('x-api-key', 'SpammerGoHome');
            }
            ,
            'data':JSON.stringify(submitObject) ,
            'success': function(data)
            {
            	alert('수정 완료 되었습니다.');
                changeToReadonly();
                loadCorpInfo();
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
    }

    jQuery('#search_zip_code').click(function(){
            if (jQuery(this).css('visibility') != 'hidden')
            execDaumPostcode();
    });


    jQuery("#ADD_FORM").submit(function(e) {
        e.preventDefault();  
        
        
        var ciImg = jQuery('#sourceFile').val();
        if (ciImg === '')
        {
            updateCorp({ 'path' : jQuery('img#ci_img_url').attr('src') });
        }
        else
        {
            jQuery('#_FILE_UPLOAD_FORM').ajaxForm({
                 "url" : "${pageContext.request.contextPath}/ci/upload"
                ,"enctype" : "multipart/form-data"
                ,"success" : function(result)
                {
                    if (result.status == 200)
                    {
                        updateCorp(result.body);
                    }
                    else
                    {
                        alert(result.messageDesc);
                    }
                }
                ,"error" : function(jqXHR, textStatus, errorThrown)
                {
                    if (jqXHR.responseJSON && jqXHR.responseJSON.messageDesc )
                    {
                        alert(jqXHR.responseJSON.messageDesc);
                    }
                    else
                    {
                        alert('CI 이미지 업로드에 실패했습니다. 잠시 후 다시 시도해 주시기 바랍니다.');
                    }

                }
            });
            jQuery('#_FILE_UPLOAD_FORM').submit();
        }
    })

    jQuery('#BTN_CANCEL').click(function(){
        changeToReadonly();
        // 각 폼에 값 설정한다.
        loadCorpInfo();
    });
    
    jQuery('#BTN_SAVE').click(function(){

        if (jQuery('[name=manage_prog]:checked').val() == 1)
        {
            var login_id = jQuery('#login_id').val().replace(/[ \t]/gi , "");
            if (login_id === '')
            {
                alert('<spring:message code="parameter.required" arguments="${_login_id_invalid_title_}"></spring:message>');
                jQuery('#login_id').focus();
                return;
            }
        }

        var type = $('input[type=radio][name=manage_prog]:checked').attr('value')
        if(type == 1 ? (isDuplicateChkComplete() && isDuplicateRegChkComplete()) : isDuplicateRegChkComplete())
        {

        }
        else if(!isDuplicateRegChkComplete())
        {
            alert('사업자등록번호 중복체크를 먼저 해주시기 바랍니다.');
            return;
        }
        else if(type == 1 && !isDuplicateChkComplete()) {
            alert('아이디 중복체크를 먼저 해주시기 바랍니다.');
            return;
        }
            
        if (jQuery('[name=manage_prog]:checked').val() == 1)
        {
            var pwd = jQuery('#pwd').val().replace(/[ \t]/gi, "");
            if (pwd === '')
            {
                alert('<spring:message code="parameter.required" arguments="${_login_pwd_invalid_title_}"></spring:message>');;
                jQuery('#pwd').focus();
                return;
            }
        }     	
        
     	if (jQuery('select#bank_cd').val() !== "")
     	{
     		jQuery('#bank_account_number').attr('required', true);
     	}
     	else
     	{
     		jQuery('#bank_account_number').removeAttr('required');
     	}
    	
        
    	
        jQuery('#_FILE_UPLOAD_FORM').ajaxForm({
             "url" : "${pageContext.request.contextPath}/ci/upload"
            ,"enctype" : "multipart/form-data"
            ,"success" : function(result){
                insertCorp(result.body);
            }
        });
        jQuery('#__HIDDEN_SUBMIT_BTN').click();
    	
    	
    });

    jQuery('#BTN_MODIFY').click(function(){
        changeToModify();
    });
    
    jQuery("#sourceFile").on("change", function(e) {
        var file = e.originalEvent.target.files[0];
        var reg = /^(.+).[png|PNG]$/g
        if(reg.test(file.name) == false) {
            alert("파일은 png형식만 가능합니다.");
            e.preventDefault();
            jQuery(e.target).val(null);
        }
        else {
            var fileReader = new FileReader();

            fileReader.addEventListener('load', function() {
                jQuery('#ci_img_url').attr('src', fileReader.result)
                console.log(fileReader.result);
            }, false)

            if(file) {
                fileReader.readAsDataURL(file);
            }
        }
    });
    // 날짜선택 
    jQuery('#start_date').change(function(e) {
        var startDate = document.getElementById("start_date").value;
        var endDate = document.getElementById("end_date").value;
     
        if ((Date.parse(endDate) < Date.parse(startDate))) {
            alert("계약기간은 현재에서 과거로 설정할 수 없습니다.");
            document.getElementById("start_date").value = "";
        }
    })
    jQuery("#end_date").change(function () {
        var startDate = document.getElementById("start_date").value;
        var endDate = document.getElementById("end_date").value;
     
        if ((Date.parse(endDate) < Date.parse(startDate))) {
            alert("계약기간은 현재에서 과거로 설정할 수 없습니다.");
            document.getElementById("end_date").value = "";
        }
    });
    
	loadSubCorp();
    

});

</script>
</html>  
