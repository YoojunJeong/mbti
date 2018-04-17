<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  trimDirectiveWhitespaces="true" %>
<%@include file="/WEB-INF/jsp/include/taglib.jsp" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko">
    <common:head>
        <link rel="stylesheet" href="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/jqwidget/styles/jqx.base.css" type="text/css" />
        <link rel="stylesheet" href="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/jqwidget/styles/jqx.arctic.css" type="text/css" />
        <title>ParkingOn Admin</title>
    </common:head>
    <common:body>
    <script>mixpanel.track("cms-cor list");</script>
<!-- begin #content -->
<div id="content" class="content">
 
    <!-- begin breadcrumb -->
    <ol class="breadcrumb pull-right">
        <li class="active"><a href="/cms/corp/list?mainmenu=m1&submenu=s1">HOME</a></li>
        <li class="active"><a href="/cms/corp/list?mainmenu=m1&submenu=s1">법인관리</a></li>
        <li class="active"><a href="/cms/corp/list?mainmenu=m1&submenu=s1">법인목록</a></li>
    </ol>
    
    <h1 class="page-header">법인관리 > 법인목록</h1>
    <!-- begin row -->
    <div class="row">
        <!-- begin col-12 -->
        <div class="col-md-12">
            <div class="panel panel-inverse">
                <div class="panel-heading">
                    <h4 class="panel-title">검색</h4>
                </div>
                <form action="#" id="SEARCH_FORM">
                <div class="panel-body">                
                    <div class="form-inline" onsubmit="return false;">
                            <label class="col-md-1 control-label">검색구분</label>
                            <div class="col-md-2"><input type="text" class="form-control" name="search_txt" placeholder="검색어를 입력하세요 (법인명 또는 대표자명 또는 사업자등록번호)"></div>
                            <label class="col-md-1 control-label">계약구분</label>
                            <div class="col-md-2">
                                <select class="form-control" name="ctype">
                                    <option value="">전체</option>
                                    <option value="1">일반</option>
                                    <option value="2">블루멤버스</option>
                                </select>
                            </div>
                            <div class="col-md-5">&nbsp;</div>
                            <div class="col-md-1 text-right"><button type="submit" class="btn btn-primary" href="javascript:;" id="__SEARCH_BTN" >검색</button></div>           
                    </div>
                </div>
                <div class="panel-body">
                    <div class="form-inline" onsubmit="return false;">
                        <label class="col-md-1 control-label">계약기간</label>
                        <div class="col-md-5">
                            <div class='input-group date datetimepicker-date'>
                                <input type='text' name="from"  class="form-control" value="" required /><span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                            </div>
                            <span>~</span>
                            <div class='input-group date datetimepicker-date'>
                                <input type='text' name="to"  class="form-control" value="" required /><span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                            </div>
                        </div>
                        <label class="col-md-1 control-label">이용상태</label>
                        <div class="col-md-4">
                            <input id="all"    name="service_status" type="radio" value="" checked="checked"><label class="checkbox-inline" for="">전체   </label>
                            <input id="use"    name="service_status" type="radio" value="0"><label class="checkbox-inline" for="">사용중  </label>
                            <input id="unuse"  name="service_status" type="radio" value="1"><label class="checkbox-inline" for="">사용중지</label>
                        </div>
                        <div class="col-md-1 text-right"><a class="btn btn-default" href="javascript:;" id="__RESET_BTN" >초기화</a></div>          
                    </div>
                </div>
                <div class="panel-body">                
                    <div class="form-inline">
                        <div class="col-md-12 text-right">
                            <button id="__CORP_REG_BTN"         class="btn btn-primary">법인등록</button>
                            <button id="__EXCEL_DOWNLOAD"  type="button" class="btn btn-primary">엑셀다운로드</button>
                        </div>
                    </div>
                </div>
                </form>
            </div>
        </div>
        <!-- end col-12 -->
    </div>
    <!-- end row -->
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-inverse">
                <div class="panel-heading">
                    <div class="panel-heading-btn">
                        <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>                                              
                    </div>
                    <h4 class="panel-title">목록</h4>
                </div>
                <div class="panel-body">
                    <div id="__GRID" style="position: relative; z-index: 0;"></div>
                </div>
            </div>
        </div>
    </div>
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
<script type="text/javascript">
    var wrapForCell = function(value)
    {
        return  '<div style="text-align:center;margin-top:5px;">' +value+ '</div>' ;
    }
    var popupCiImg = function(idx)
    {
        var url = '//${cms_ui_domain}${pageContext.request.contextPath}/cms/corp/c' + idx + "/ciPopup";
        window.open(url, 'corCiImgPopup', 'directories=no,titlebar=no,toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=400,height=300');
    }

    var bankNameRender = function(row, datafield, bank_cd)
    {
        var result ='';
        switch (bank_cd)
        {
        <c:forEach var="item" items="${bankCodeMap}">
            case '${item.value}' :  result = "<spring:message code="${item.key}"></spring:message>"; break;
        </c:forEach>
        }
        return  wrapForCell( result );
    }
    
    var manageProgRender = function (row, datafield, value)
    {
        var result = '';
        
        if (value == 0)
        {
            result = "개별설치";
        }
        else
        {
            result = "통합";
        }
            
        return  wrapForCell( result );
    }
    
    var useLimitRender = function(row, datafield, use_limit)
    {
        var result = '';
        
        if (use_limit == 1)
        {
            result = "<spring:message code="const.use_lmiit.using"/>";
        }
        else
        {
            result = "<spring:message code="const.use_lmiit.none"/>";
        }
            
        return  wrapForCell( result );
    }

    var contractTypeRender = function (row, datafield, value)
    {
        var result = '';
        if (value == 1)
        {
            result =  "<spring:message code="const.contract_type.normal"/>";
        }
        else if (value == 2)
        {
            result = "<spring:message code="const.contract_type.bluemembers"/>";
        }

        return  wrapForCell( result );
    }
    var serviceStatusRender = function (row, datafield, value)
    {
        var result = '';
        if (value === 0 )
        {
            result = "<spring:message code="const.service_status.using"/>&nbsp;&nbsp;&nbsp;<button class='btn btn-xs btn-primary modify_btn' data-idx='" + row + "'>변경</button>";
        }
        else if(value === 1)
        {
            result = "<spring:message code="const.service_status.blocked"/>&nbsp;&nbsp;&nbsp;<button class='btn btn-xs btn-primary modify_btn' data-idx='" + row + "'>변경</button>";
        }
        else {

        }

        return  wrapForCell( result );
    }
    
    /** 
     * 더이상 사용하지 않음..
     function(row, datafield, value, html, cellconfig, rowData)
     */
    var ciImgRender = function(row, datafield, value, html, cellconfig, rowData)
    {
        var result = '';
        if(value)
        {
/*         	    var url = '//${cms_ui_domain}${pageContext.request.contextPath}/cms/corp/c' + rowData.idx + "/ciPopup";
        	    var fn = "window.open('"+ url + "');return false;"; 
        	    
                var url = '//${cms_ui_domain}${pageContext.request.contextPath}/cms/corp/c' + rowData.idx + "/ciPopup";
                var fn = "window.open('"+ url + "');return false;";
        	    
        	    */
            result = "<a href='#' onclick='popupCiImg("+rowData.idx+")' class='btn btn-xs btn-default prevent'>이미지 확인</a>";    
        }
        return wrapForCell( result );
    }

    // GRID Column Renderrer
    var columnsrenderer = function (value) {
        return  headerAlign( value );
    }
    
    var headerRenderer = function(value)
    {
    	return  '<table style="width:100%;height:100%;"><tr><td style="text-align:center;vertical-align: middle;">'+value+'</td></tr></table>';// +value+ '</div>' ;
    }
    
    var withoutColgroupHeaderRenderer = function()
    {
    	return  '<table style="width:100%;height:100%;"><tr><td style="text-align:center;vertical-align: middle;">'+value+'</td></tr></table>';// +value+ '</div>' ;
    }

    /*
            그리드에 인덱스 번호를 찍는 렌더러 
    */
    var rownumber = 1;
    var orderNumberIndexrenderer = function (row, column, value) 
    {
            if (row != 0)
            {
                rownumber += 1;
            }
            else 
            {
                rownumber = 1;
            }
            return "<div style='margin:4px;text-align:center;'>" + rownumber + "</div>";
    }
    
jQuery(document).ready(function(){

    validate.addElement(jQuery('[name=search_txt]'), {kor: true, number: true, eng: true, space: true, special: true})
    validate.toDatePicker(jQuery('[name=from]')); 
    validate.toDatePicker(jQuery('[name=to]')); 

    var resetSearchForm = function()
    {
        // search_txt  init
        jQuery('[name=search_txt]').val('');
        // ctype inin
        jQuery('[name=ctype]').val('');
        // from  init
        jQuery('[name=from]').val(moment().format("YYYY") + "-01-01");
        // to    init
        jQuery('[name=to]').val(moment().format("YYYY-MM-DD"));
        // 
        jQuery('[name=service_status][id=all]').prop('checked',true);
    }
    
    jQuery('#__EXCEL_DOWNLOAD').click(function(){
        
        var params = [];
        params.push('search_txt=' +jQuery('[name=search_txt]').val() );
        params.push('ctype=' +jQuery('[name=ctype]').val() );
        params.push('from=' +jQuery('[name=from]').val() );
        params.push('to=' +jQuery('[name=to]').val() );
        params.push('service_status=' +jQuery('[name=service_status]:checked').val() );
        
        document.location.href="//${cms_ui_domain}${pageContext.request.contextPath}/cms/corp/xlsx?" + params.join("&");
    });
    
    
    jQuery('#__CORP_REG_BTN').click(function(){
        document.location.href="//${cms_ui_domain}${pageContext.request.contextPath}/cms/corp/reg?mainmenu=${param.mainmenu}&submenu=${param.submenu}";
    });
    
    jQuery('#__RESET_BTN').click(resetSearchForm);
    

    resetSearchForm();
    
   
    var data_columns =  [

              {"width":"50"                                 ,"text":"번호",									"name":"ordidx"                         ,"renderer": headerRenderer                         ,"cellsrenderer":orderNumberIndexrenderer}
            , {"width":"50"   ,"datafield":"idx"            ,"text":"번호"          	,"type":"string",	"name":"idx"           					,"renderer": headerRenderer   , hidden: true  }
            , {"width":"70"   ,"datafield":"contract_type"  ,"text":"계약구분"      	,"type":"string",	"name":"contract_type" 					,"renderer": headerRenderer 						,"cellsrenderer":contractTypeRender }
            , {"width":"250"  ,"datafield":"name"           ,"text":"법인명"        	,"type":"string",	"name":"name"          					,"renderer": headerRenderer}
            , {"width":"70"   ,"datafield":"ceo_name"       ,"text":"대표자명"      	,"type":"string",	"name":"ceo_name"      					,"renderer": headerRenderer}
            , {"width":"200"  ,"datafield":"reg_number"     ,"text":"사업자등록번호"    ,"type":"string",	"name":"reg_number"                     ,"renderer": headerRenderer}
            , {"width":"100"  ,"datafield":"member_cnt"     ,"text":"회원수"        	,"type":"string",	"name":"member_cnt"                     ,"renderer": headerRenderer ,columngroup: 'service_info',cellsalign:"right", cellsformat: 'd'} 
            , {"width":"100"  ,"datafield":"ci_img_url"     ,"text":"CI 이미지"     	,"type":"string",	"name":"ci_img_url"                     ,"renderer": headerRenderer ,columngroup: 'service_info',"cellsrenderer" : ciImgRender } 
            , {"width":"70"   ,"datafield":"pay_date"       ,"text":"정산일"    		,"type":"string",	"name":"pay_date"      					,"renderer": headerRenderer ,columngroup: 'contract_info',cellsalign:"right" }
            , {"width":"70"   ,"datafield":"discount_rate"  ,"text":"할인율"        	,"type":"string",	"name":"discount_rate"     				,"renderer": headerRenderer ,columngroup: 'contract_info',cellsalign:"right", cellsformat: 'p1' }
            , {"width":"70"   ,"datafield":"manager_name"   ,"text":"이름"      		,"type":"string",	"name":"manager_name"  					,"renderer": headerRenderer ,columngroup: 'manager_info' }
            , {"width":"70"   ,"datafield":"manager_dept"   ,"text":"직급"     			,"type":"string",	"name":"manager_dept"  					,"renderer": headerRenderer ,columngroup: 'manager_info' }
            , {"width":"70"   ,"datafield":"manager_phone"  ,"text":"전화번호"      	,"type":"string",	"name":"manager_phone"                  ,"renderer": headerRenderer ,columngroup: 'manager_info' }
            , {"width":"70"   ,"datafield":"manager_email"  ,"text":"이메일"        	,"type":"string",	"name":"manager_email"                  ,"renderer": headerRenderer ,columngroup: 'manager_info' }
            
            , {"width":"130"  ,"datafield":"service_status"     ,"text":"서비스상태"    ,"type":"string","name":"service_status"    ,"renderer": headerRenderer ,"cellsrenderer" : serviceStatusRender}
    ];
    // GRID Theme 
    var theme = 'arctic';

    // TODO scyun : ui 에서 API 호출시 URL 에 version을 하드코딩? 설정에서 읽어오도록 ????
    //              어떻게 해야할까???
    // GRID DATASOURCE 설정..
    var gridDataSource = {
        "cache": false,
        "type": 'post',
        "url": '//${cms_api_domain}${pageContext.request.contextPath}/1.0/corporations/list',
        "contenttype" : "application/json",
        "datatype": "json",
        "root" : "body>list",
        "beforeprocessing": function (data) {
            if (data) 
            {
                gridDataSource.totalrecords = data.body.totalCount;
            }
        },
        "datafields": data_columns
        
    };
    // GRID DATA WRAPPER 설정..
    var dataadapter = new $.jqx.dataAdapter(gridDataSource, {
        'beforeSend' : function (jqXHR, settings) {
            // TODO scyun AJAX 호출시 헤더값을 숨기는 방안 확인 필요함... 
            // 전송 전 API 에서 검증하는 api-key 를 설정한다
            jqXHR.setRequestHeader("x-api-key", "SpammerGoHome");
        },
         'formatData' : function(data) {
             // 여기서 검색필드값을 추가해 전달한다. 
            return JSON.stringify({
                'page'           : data.pagenum + 1
                ,'perPage'        : data.pagesize
                ,'search_txt' :     jQuery('[name=search_txt]').val()
                ,'ctype'      :     jQuery('[name=ctype]').val()
                ,'from'       :     jQuery('[name=from]').val()
                ,'to'         :     jQuery('[name=to]').val()
                ,'service_status' :jQuery('[name=service_status]:checked').val()
                });
        },
         'loadError' : function(jqXHR, status, error) {

        },
        'downloadComplete' : function(edata, textStatus, jqXHR) {
            // http 상태코드가 2XX 일 경우 수행됨..
        },
        'beforeLoadComplete' : function() {
            //
        }
    });

    $("#__GRID").jqxGrid( {
        width: '100%',
        height: '760', 
        source: dataadapter,
        theme: theme,
        rowsheight: 30,
        scrollmode: 'logical',
        pageable: true,
        pagesize: 100,
        virtualmode: true,
        pagesizeoptions: [10,20,50, 100],
        rendergridrows: function (params) {
            return params.data;
        },
        columnsresize: true,
        columnsheight:40//헤더 컬럼의 크기 
        , altrows : true   //줄마다 다른 색 넣기 
        , columns: data_columns
          

       ,  columngroups:[
                                {text:'서비스정보' ,align:'center',name:'service_info' }
                            ,   {text:'계약정보'    ,align:'center',name:'contract_info' }
                            ,   {text:'담당자정보'  ,align:'center',name:'manager_info' }
                    ]
    });
    
    /*
    $("#__GRID").bind("pagechanged", function (event) {
        var args = event.args;
        var pagenumber = args.pagenum;
        var pagesize = args.pagesize;
    });
    $("#__GRID").bind("pagesizechanged", function (event) {
        var args = event.args;
        var pagenumber = args.pagenum;
        var pagesize = args.pagesize;
    });
    */
    
    // jQuery('#__SEARCH_BTN').click(function(){
    //     $("#__GRID").jqxGrid( { source: dataadapter});
    // });
    jQuery("#SEARCH_FORM").submit(function(e) {
    	rownumber = 1;
        e.preventDefault();
        $("#__GRID").jqxGrid( { source: dataadapter});
    })
    //$("#__GRID").bind('rowselect', function (event) {
    $("#__GRID").bind('rowdoubleclick', function (event) {
        console.log(event.args.row.bounddata.idx);  
        var rowdata = event.args.row.bounddata.idx;
        if(rowdata)
        {
            document.location.href="${pageContext.request.contextPath}/cms/corp/detail?mainmenu=${param.mainmenu}&submenu=${param.submenu}&corIdx="+ rowdata;
        }
    });
    $("#__GRID").on("pagechanged", function (event) 
    {
        // event arguments.
        var args = event.args;
        // page number.
        var pagenum = args.pagenum;
        // page size.
        var pagesize = args.pagesize;

        rownumber = 0;
    });   
    $(document).on('click', '.modify_btn', function(e) {
        var row_idx = jQuery(e.target).attr('data-idx');
        var data = $('#__GRID').jqxGrid('getrowdata', row_idx);

        var cor_idx = data.idx;
        var cor_name = data.name;
        var svr_condition = data.service_status;
        var confirm_title = cor_name+" 법인의 서비스를 사용중지로 변경하시겠습니까?  \n * 서비스 상태 변경 시 해당 법인 고객의 대리운전 접수에 문제가 발생 할 수 있습니다.";
        if(svr_condition == "1")
        {
            confirm_title = cor_name+" 법인의 서비스 상태를 사용으로 변경하시겠습니까?";
        }
        if (confirm(confirm_title) == true)
        {   
            changeService_Status(row_idx,cor_idx);
        }
        else
        {   //취소
            return;
        }
    })

    // 팝업 열때 a태그의 클릭으로 인해서 url 이 바뀌어 스크롤이 초기화됨 그래서 a태그의 클릭이벤트를 prevnetDefault로 막음
    $(document).on('click', '.prevent', function(e) {
        e.preventDefault();
    })

    // $("#__GRID").on("cellclick", function (event) 
    //         {
    //             var cor_idx = event.args.row.bounddata.idx;
    //             var row_idx = args.rowindex;
    //             var dataField = event.args.datafield;
    //             var cor_name = event.args.row.bounddata.name; 
    //             var svr_condition = event.args.row.bounddata.service_status;
    //             var confirm_title = cor_name+" 법인의 서비스를 사용중지로 변경하시겠습니까?  \n * 서비스 상태 변경 시 해당 법인 고객의 대리운전 접수에 문제가 발생 할 수 있습니다.";
    //             if(svr_condition == "1")
    //                 {
    //                     confirm_title = cor_name+" 법인의 서비스 상태를 사용으로 변경하시겠습니까?";
    //                 }
    //             console.log(args);
    //             if(dataField =="service_status")
    //                 {
    //                     if (confirm(confirm_title) == true)
    //                     {   
    //                         changeService_Status(row_idx,cor_idx);
    //                     }
    //                     else
    //                     {   //취소
    //                         return;
    //                     }
    //                 }
    //         });   
    
    
    PK_COMN.toDatePicker(jQuery('.datetimepicker-date'));
});

    
function changeService_Status(row_idx,cor_idx)
{
    /*
     * FsAjax.request(p1, p2,p3, p4
     * p1 = 가고 싶은 URL 정보  
     * p2 = 요청 메소드 적는 곳 
     * p3 = 보낼 데이터 없으면 빈값
     * p4 = callback 함수 구현
     */
     // UI서버를 호출하고 ui가   API랑 통신한후에 결과를 ui서버가 내려준다. 
    var jsonObj = new Object();
     jsonObj.idx = cor_idx;
    PKOAjax.request('/cms/corp/'+cor_idx+'/changestatus', 'post', jsonObj, function(data)
            {
                var rowData = $("#__GRID").jqxGrid('getrowdata',row_idx);
                if(rowData.service_status == 1)
                {
                    rowData.service_status = 0;
                }
                else
                {
                    rowData.service_status = 1;
                }
                $("#__GRID").jqxGrid('refreshdata');
                alert('처리되었습니다.');
            }//function
        );
}

</script>
</html>  
