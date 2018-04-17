<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  trimDirectiveWhitespaces="true" %>
<%@include file="/WEB-INF/jsp/include/taglib.jsp" %>
<spring:message code="const.corp.login_id" var="_login_id_invalid_title_"></spring:message>
<spring:message code="const.loginPwd"      var="_login_pwd_invalid_title_"></spring:message>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko">
    <common:head>
        <link rel="stylesheet" href="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/bootstrap-fileinput-master/css/fileinput.min.css" type="text/css" />
        <link rel="stylesheet" href="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/bootstrap-fileinput-master/css/fileinput-rtl.min.css" type="text/css" />
        <title>ParkingOn Admin</title>
    </common:head>
    <common:body>
    <script>mixpanel.track("cms-cor reg");</script>
<!-- begin #content -->
<div id="content" class="content">
    <!-- begin breadcrumb -->
	<ol class="breadcrumb pull-right">
        <li class="active"><a href="/cms/corp/list?mainmenu=m1&submenu=s1">HOME</a></li>
        <li class="active"><a href="/cms/corp/list?mainmenu=m1&submenu=s1">법인관리</a></li>
        <li class="active"><a href="/cms/corp/list?mainmenu=m1&submenu=s1">법인목록</a></li>
        <li class="active"><a href="/cms/corp/reg?mainmenu=m1&submenu=s1">법인등록</a></li>
    </ol>

    <h1 class="page-header">법인등록</h1>
    <!-- begin row -->
    <div class="row">
    <form id="ADD_FORM" action="#">
        <button id="__HIDDEN_SUBMIT_BTN" type="submit" class="btn btn-primary" style="display:none;">저장</button>
        <div class="col-md-9"> 
            <div class="panel panel-inverse" data-sortable-id="form-plugins-1">
                <div class="panel-heading"><h4 class="panel-title">기본 정보</h4> </div>
            <div class="panel-body panel-form">
                <div class="form-horizontal form-bordered">
                    <div class="form-group">
                        <label class="col-md-2 control-label">* 회사명(업체명)</label>
                        <div class="col-md-4"><input id="name" type="text" class="form-control"/></div>
                        <label class="col-md-2 control-label">* 사업자등록번호<br>(-를 제외하고 입력해주세요)</label>
                        <div class="col-md-2">
                        	<input id="reg_number" type="text" class="form-control"/>
                        </div>
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
                            <select  class="form-control" id="bank_cd">
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
                        <div class="col-md-2"> <input type="email" class="form-control" id="manager_email"  placeholder="연락처(E-Mail)"/></div>
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
                            <div class="input-group">
                                <span class="input-group-addon"><input type="radio" name="contract_type" checked="checked" value="1"></input></span>
                                <span class="form-control">일반</span>
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon"><input type="radio" name="contract_type" value="2"></input></span>
                                <span class="form-control">블루멤버스</span>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label">계약기간</label>
                        <div class="col-md-10 form-inline">
                            <div class='input-group date datetimepicker-date'>
                                <input type='text' id="start_date" name="start_date" class="form-control"/><span class="input-group-addon datespan"><span class="glyphicon glyphicon-calendar"></span></span>
                            </div>
                            <span>~</span>
                            <div class='input-group date datetimepicker-date'>
                                <input type='text' id="end_date" name="end_date" class="form-control"/><span class="input-group-addon datespan"><span class="glyphicon glyphicon-calendar"></span></span>
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
                        <div class="col-md-2">
                            <div class="input-group">
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
                            <div class="input-group">
                                <span class="input-group-addon"><input type="radio" name="use_limit" value="1"></input></span>
                                <span class="form-control"><spring:message code="const.use_lmiit.using"/></span>
                            </div>
                            <div class="input-group">
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
                            <div class="input-group">
                                <span class="input-group-addon"><input type="radio" name="manage_prog" value="0"></input></span>
                                <span class="form-control">개별설치</span>
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon"><input type="radio" name="manage_prog" checked="checked" value="1"></input></span>
                                <span class="form-control">통합</span>
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon">ID</span>
                                <input class="form-control" id="login_id" type="text" required="required"/>
                            </div>
                            <div class="input-group">
                                <button type="button" id="BTN_DUPLICATE_CHK" class="btn btn-primary disabled" >중복체크</button>
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon">PW</span>
                                <input class="form-control" id="pwd" type="password" required="required"/>
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
                        <div class="col-md-3">
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
    </form>
	<form id="_FILE_UPLOAD_FORM"  method="POST" enctype="multipart/form-data">
        <div class="col-md-9">
            <div class="panel panel-inverse" data-sortable-id="form-plugins-1">
                <div class="panel-heading"><h4 class="panel-title">CI</h4></div>
                <div class="panel-body panel-form">
                    <div class="form-horizontal form-bordered">
                    <div class="form-group">
                        <label class="col-md-2 control-label">CI 관리</label>
                        <div class="col-md-8 form-inline">
                            <input type="file" id="sourceFile" name="sourceFile" class="file" accept="image/png"></input>
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
        <a id="BTN_CANCEL" class="btn btn-primary">취소</a>
        <button id="BTN_SAVE" type="button" class="btn btn-primary">저장</button>
        
        </div>
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

    var clickManagerProgRadioBox = function ()
    {
        // 0 : 개별설치
        // 1 : 통합설치
        var chkedValue = jQuery(this).val();
        
        if (chkedValue == 0)
        {
            jQuery('#login_id').prop('readonly', true);
            jQuery('#pwd').prop('readonly', true);
            jQuery('#login_id').removeAttr('required');
            jQuery('#pwd').removeAttr('required');
        }
        else
        {
            jQuery('#login_id').prop('readonly', false);
            jQuery('#pwd').prop('readonly', false);
            jQuery('#login_id').attr('required', true);
            jQuery('#pwd').attr('required', true);
        }
        
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
   
   // 로그인 아이디 항목이 비어있거나 
   // 서버로부터 사용 가능한 아이디 여부를 확인받은 상태인지 확인 
   var isDuplicateChkComplete = function()
   {
       return  jQuery('#login_id').val().replace(/[ \t]/gi , "") === "" || jQuery('#login_id').val() === jQuery('#login_id').data('checkedLoginId');
   }
   // 사업자 등록번호 항목이 비어있거나
   // 서버로부터 사용 가능한 아이디 여부를 확인받안 상태인지 확인
   var isDuplicateRegChkComplete = function()
   {
       return  jQuery('#reg_number').val() === "" || jQuery('#reg_number').val() === jQuery('#reg_number').data('checkedRegNumber');
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
   
   var loadSubCorp = function ()
   {
		PKOAjax.request("//${cms_api_domain}/1.0/subcorporation/list", "post", new Object(), function(data){
			if (data.body.totalCount > 0)
			{
				var list = data.body.list;
				jQuery(list).each(function(idx , elem){
					jQuery('select[name=sub_cor]').append('<option value='+ elem['sub_cor_idx']+'>'+elem['name']+'</option>');
				});
			} 
		});
   }

jQuery(document).ready(function(){
	
	
	jQuery('#manager_email').keyup(function(){
		
		if (jQuery(this).val() !== '')
		{
			jQuery(this).attr('required', true);
			jQuery(this).on('invalid', function(event){
                var offset = jQuery(event.srcElement).offset();
                window.scrollTo(0,offset.top-200);
                jQuery(event.srcElement).focus();
			});
		}
		else
		{
			jQuery(this).attr('required', false);
            jQuery(this).off('invalid');
		}
	});

	
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
        if (_loginId !== '' && evt.target.value.length >= 2)
        {
            jQuery('#BTN_DUPLICATE_CHK').removeClass('disabled');
        }
        else
        {
            jQuery('#BTN_DUPLICATE_CHK').addClass('disabled');
        }
    }); 
	jQuery('#reg_number').keyup(function(e) {
		if(e.target.value.length >= 10) {
			jQuery('#BTN_REG_DUPLICATE_CHK').removeClass('disabled')
		}
		else {
            jQuery('#BTN_REG_DUPLICATE_CHK').addClass('disabled');
		}
	})
    
	
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
			jQuery('#sub_cor_wrap').append('<div class="input-group" data-sub-cor-idx="'+ thisVal +'"><span class="form-control">'+jQuery(this).find('option:selected').html()+'</span><span data-tag="sub-cor-tag" class="input-group-addon">X</span></div>');
			jQuery('#sub_cor_wrap').append(' ');
		}
	});

    PK_COMN.toDatePicker(jQuery('.datetimepicker-date'));


    var setting= { kor: true, eng: true, space: true, special: true, number: true, minLength: 3, maxLength: 10, required: true, type: "type", max: "max", myReg: "reg" }


    validate.addElement(jQuery('#name'), {kor: true, eng: true, number: true, special: true, space: true, required: true});

    validate.addElement(
        [jQuery('#biz_type'), jQuery("#biz_industry"), jQuery('#manager_dept'), jQuery('#manager_position'), jQuery('#manager_email'), jQuery('#address_detail')], 
        {kor: true, eng: true, number: true, special: true, space: true}
    );
    validate.addElement( jQuery('#address_detail'), {kor: true, eng: true, number: true, special: true, space: true, maxLength : 200});
    validate.addElement(jQuery("#reg_number"), { number: true, required: true, minLength: 10, maxLength:10 });
    validate.addElement(
        [jQuery('#ceo_name'), jQuery('#manager_name')], 
        { kor: true, eng: true, space: true}
    );
    validate.addElement([jQuery('#phone_number'), jQuery('#manager_phone')], { number: true, minLength: 9, maxLength: 11})
    validate.addElement(jQuery('#bank_account_number'), { number: true, myReg: "\\-" })

    validate.addElement(jQuery('#pay_date'), { type: "number", max: 31 });

    validate.addElement(jQuery('#login_id'), {eng: true, number: true, myReg: '\\-&_@\\(\\)\\.,', min: 2, maxLength: 20});
    validate.addElement(
        [jQuery('#pwd'), jQuery("#intro_sms_msg")], 
        {kor: true, eng: true, number: true, special: true, maxLength: 50}
    );

    function insertCorp(fileObject)
    {
	    	var subCorIdx = [];
	    	jQuery('[id=sub_cor_wrap]').children('div.input-group').each(function(idx, elem)
				    	{
				    		subCorIdx.push(jQuery(elem).data('sub-cor-idx'));
				    	});

        var submitObject = {
        	"loginId":"${loginId}",	
            "ceo_name":jQuery('#ceo_name').val(),       // 대표자
            "name" : jQuery('#name').val(),             // 회사명
            "reg_number":jQuery('#reg_number').val(),   // 사업자등록번호
            "biz_type":jQuery('#biz_type').val(),       // 업종
            "biz_industry":jQuery("#biz_industry").val(),   // 종목
            "phone_number":jQuery('#phone_number').val(),   // 대표번호
            "bank_cd":jQuery('#bank_cd').val(),             // 계좌 은행명
            "bank_account_number":jQuery('#bank_account_number').val(), // 계좌 계좌번호
            "manager_name":jQuery('#manager_name').val(), // 담당자명
            "manager_dept":jQuery('#manager_dept').val(), // 담당자 부서
            "manager_position":jQuery('#manager_position').val(), // 담당자 직급
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
            "login_id":jQuery('#login_id').val(), // 관리자 프로그램 ID
            "pwd":jQuery('#pwd').val(), // PWD
            "intro_sms_msg": jQuery('#intro_sms_msg').val(), //"가입승인 되었습니다 ", // 가입승인 SMS (템플릿에서 선택하거나 input 박스로 입력받도록 해야한다.)
            "sub_cor": subCorIdx.join(','),   // 복수업체 선택
            "ci_img_url":fileObject.path // CI
        };

        PKOAjax.request(
        	'//${cms_api_domain}/1.0/corporations/insert', 
        	'post', 
        	submitObject, 
        	function(data)
        	{
        	    alert(data.messageDesc);
        	    document.location.href="//${cms_ui_domain}/cms/corp/list?mainmenu=m1&submenu=s1";
        	}
        );
    }//insertCorp

    jQuery('#search_zip_code').click(function(){
        execDaumPostcode();
    });

	jQuery('#ADD_FORM').submit(function(e) {
		console.log(e);
		e.preventDefault();

    	//if (jQuery("#sourceFile").val() !== '') 
    	//{
		//	jQuery('#_FILE_UPLOAD_FORM').submit();
		//}
    	//else
    	//{
    	//	insertCorp({'path' : ''});
    	//}

	});
    
    
    jQuery('#BTN_SAVE').click(function(){
    	
		
     	if (jQuery('[name=manage_prog]:checked').val() == 1)
    		{
	    		var login_id = jQuery('#login_id').val().replace(/[ \t]/gi , "");
	    		if (login_id === '')
	    		{
	    			alert('<spring:message code="parameter.required" arguments="${_login_id_invalid_title_}"></spring:message>');;
	                jQuery('#login_id').focus();
	                return;
	    		}
	    		
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
            jQuery('#bank_account_number').on("invalid", function(event) {
                var offset = jQuery(event.srcElement).offset();
                window.scrollTo(0,offset.top-200);
                jQuery(event.srcElement).focus();
            });
     	}
     	else
     	{
     		jQuery('#bank_account_number').removeAttr('required');
     		jQuery('#bank_account_number').off('invalid');
     	}
    	
    	
    	
            var type = $('input[type=radio][name=manage_prog]:checked').attr('value')
            // if ((isDuplicateChkComplete () && $('input[type=radio][name=manage_prog]').val() == 1) && isDuplicateRegChkComplete())
            // 개별설치, 통합설치 일때 
            if(type == 1 ? (isDuplicateChkComplete() && isDuplicateRegChkComplete()) : isDuplicateRegChkComplete())
	    	{
                console.log(isDuplicateChkComplete())
	    		//20171026 우
	    		//이미지가 있으면 업로드 후에 인서트 한다. 
	    		//없으면 바로 인서트 로지기 
	    		var file = jQuery("#sourceFile").val();
	    		if(file !="")
	    		{
				jQuery('#_FILE_UPLOAD_FORM').ajaxForm({
					 "url" : "${pageContext.request.contextPath}/ci/upload"
					,"enctype" : "multipart/form-data"
					,"success" : function(result){
						insertCorp(result.body);
					}
				});
	    		}
	    		else
	    		{
	    			insertCorp("");
	    		}
				
				jQuery('#ADD_FORM').submit();   
	    	}
	    	else if(!isDuplicateRegChkComplete())
	    	{
	    		alert('사업자등록번호 중복체크를 먼저 해주시기 바랍니다.');
	    	}
	    	else if(type == 1 && !isDuplicateChkComplete()) {
	    		alert('아이디 중복체크를 먼저 해주시기 바랍니다.');
	    	}
    }
    );//btn_save

    jQuery('#BTN_CANCEL').click(function(){

        document.location.href="${pageContext.request.contextPath}/cms/corp/list";

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
