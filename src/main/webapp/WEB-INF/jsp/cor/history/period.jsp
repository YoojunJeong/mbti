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
    <script>mixpanel.track("cor period");</script>
<!-- begin #content -->
<div id="content" class="content">
	<!-- begin breadcrumb -->
	<ol class="breadcrumb pull-right">
        <li class="active"><a href="/cor/history/period?mainmenu=m4&submenu=s1">HOME</a></li>
        <li class="active"><a href="/cor/history/period?mainmenu=m4&submenu=s1">기간별</a></li>
    </ol>
	<h1 class="page-header">이용내역조회-기간별 이용내역</h1>
	<!-- begin row -->
	<div class="row">
		<!-- begin col-12 -->
		<div class="col-md-12">
			<div class="panel panel-inverse">
                <div class="panel-heading">
                    <h4 class="panel-title">이용내역조회-기간별 이용내역</h4>
                </div>
				<form action="#" id="SEARCH_FORM">
                <div class="panel-body">             	
					<div class="form-inline" onsubmit="return false;">
							<label class="col-md-1 control-label">검색구분</label>
							<div class="col-md-2"><input type="text" class="form-control" name="search_txt" placeholder="이름, 사번"></div>
							<label class="col-md-1 control-label">서비스 제공 업체</label>
							<div class="col-md-3">
								<select id="subCorIdx" class="form-control">
									<option value="-1">전체</option>
								</select>
							</div>
							<div class="col-md-4">&nbsp;</div>
							<div class="col-md-1 text-right"><input class="btn btn-primary" href="javascript:;" id="__SEARCH_BTN" value="검색" type="submit"></div>			
					</div>
				</div>
				<div class="panel-body">
					<div class="form-inline" onsubmit="return false;">
						<label class="col-md-1 control-label">기간별</label>

                        <div class="col-md-5">
                        	<div class='input-group date datetimepicker-date'>
                        	    <input type='text' id="first_date" name="from" class="form-control"/><span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                        	</div>
                        	~
                        	<div class='input-group date datetimepicker-date'>
                        	    <input type='text' id="last_date" name="to" class="form-control"/><span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                        	</div>
                        </div>

						<div class="col-md-5">&nbsp;</div>
						<div class="col-md-1 text-right"><a class="btn btn-primary" href="javascript:;" id="__RESET_BTN" >초기화</a></div>			
					</div>
                </div>
                </form>
                <div class="panel-body">             	
					<div class="form-inline">
						<div class="col-md-12 text-right">
							<button class="btn btn-primary" id="excel">엑셀다운로드</button>
						</div>
					</div>
				</div>
            </div>
		</div>
		<!-- end col-12 -->
	</div>
	<!-- end row -->
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-inverse">
				<div class="table-responsive">
               		<div class="dataTables_wrapper no-footer">
           				<!--
               			<div id="data-table_filter" class="dataTables_filter">
               				<label>Search:<input type="search" class="" placeholder="" aria-controls="data-table"></label>
               			</div>
               			-->
               			<table id="data-table" class="table table-striped table-bordered dataTable no-footer " role="grid">
               				<thead>
                                <tr role="row"> 
									<th class="text-center">합계</th>
									<th class="text-center">기본료</th>
									<th class="text-center">추가료</th>
									<th class="text-center">콜수수료</th>
									<th class="text-center">합계</th>
                               </tr>                                    
                           </thead>
                           <tbody id="history_body">
                           </tbody>
               			</table>
               		</div>
               	</div>
			</div>
		</div>
	</div>
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
<script>
var today = new Date();

var search_text = '';
var from_dt = '';
var to_dt = '';

var idx = -1;

var columnsrenderer = function (value) {
	    return   '<div style="text-align: center; margin-top: 13px;">' + value + '</div>';
}
var numberrender = function(row, columnfield, value, defaulthtml, columnproperties) {
	var regex = /<(.*?)>(.*?)<(.*?)>/g;

	var reg_arr = regex.exec(defaulthtml);
	var result =  defaulthtml.replace(reg_arr[2], value.toLocaleString());
	return result;
}
var rownumber = 1;
var orderNumberIndexrenderer = function (row, column, value) 
{
	console.log("cell")
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
var service_type = function(row, columnfield, value, defaulthtml, columnproperties) {
    var regex = /<(.*?)>(.*?)<(.*?)>/g;

    var val = "";

    switch(value) {
        case "0": val = "법인대리"; break;
        case "1": val = "모범택시"; break;
        case "2": val = "퀵서비스"; break;
        default: val = ""; break;
    }

    var reg_arr = regex.exec(defaulthtml);
    var result =  defaulthtml.replace(reg_arr[2], val);
    return result;
}
var data_columns = [ 
			 {"width":"30"  ,  "renderer": columnsrenderer ,   "datafield":"upload_idx"                  ,"text":"NO"					,"type":"string","name":"upload_idx", "cellsalign": 'center', "hidden": true}
			,{"width":"30"  ,  "renderer": columnsrenderer ,   "datafield":"idx"                  ,"text":"NO"					,"type":"string","name":"idx", "cellsalign": 'center', "cellsrenderer":orderNumberIndexrenderer}
			,{"width":"100"  ,  "renderer": columnsrenderer ,   "datafield":"cust_no"                  ,"text":"사번"					,"type":"string","name":"cust_no", "cellsalign": 'center'}
			,{"width":"100"  ,  "renderer": columnsrenderer ,   "datafield":"cust_name"                  ,"text":"이름"					,"type":"string","name":"cust_name"}
			,{"width":"90"  ,  "renderer": columnsrenderer ,   "datafield":"use_date"                  ,"text":"접수일"					,"type":"string","name":"use_date", "cellsalign": 'center'}
			,{"width":"90"  ,  "renderer": columnsrenderer ,   "datafield":"use_time"                  ,"text":"접수시간"					,"type":"string","name":"use_time", "cellsalign": 'center'}
			,{"width":"120"  ,  "renderer": columnsrenderer ,   "datafield":"start_addr"                  ,"text":"출발지"					,"type":"string","name":"start_addr"}
			,{"width":"120"  ,  "renderer": columnsrenderer ,   "datafield":"route_addr"                  ,"text":"경유지"					,"type":"string","name":"route_addr"}
            ,{"width":"80"  ,  "renderer": columnsrenderer ,   "datafield":"waiting_time"                  ,"text":"대기시간"                 ,"type":"string","name":"waiting_time"}
			,{"width":"120"  ,  "renderer": columnsrenderer ,   "datafield":"finish_addr"                  ,"text":"도착지"					,"type":"string","name":"finish_addr"}
			,{"width":"90"  ,  "renderer": columnsrenderer ,   "datafield":"cost"                  ,"text":"기본료"					,"type":"string","name":"cost", "cellsrenderer": numberrender,  "cellsalign": "right"}
			,{"width":"90"  ,  "renderer": columnsrenderer ,   "datafield":"add_cost"                  ,"text":"추가료"					,"type":"string","name":"add_cost", "cellsrenderer": numberrender,  "cellsalign": "right"}
			,{"width":"90"  ,  "renderer": columnsrenderer ,   "datafield":"add_tax"                  ,"text":"콜수수료"					,"type":"string","name":"add_tax", "cellsrenderer": numberrender,  "cellsalign": "right"}
			,{"width":"90"  ,  "renderer": columnsrenderer ,   "datafield":"total"                  ,"text":"합계"					,"type":"string","name":"total", "cellsrenderer": numberrender,  "cellsalign": "right"}
			,{"width":"100"  ,  "renderer": columnsrenderer ,   "datafield":"driver_id"                  ,"text":"기사ID"					,"type":"string","name":"driver_id"}
			,{"width":"100"   ,  "renderer": columnsrenderer ,   "datafield":"driver_name"                  ,"text":"기사성명"					,"type":"string","name":"driver_name"}
			,{"width":"100"  ,  "renderer": columnsrenderer ,   "datafield":"memo"                  ,"text":"비고"					,"type":"string","name":"memo"}
			,{"width":"122"  ,  "renderer": columnsrenderer ,   "datafield":"phone_number"                  ,"text":"고객전화번호"					,"type":"string","name":"phone_number"}
			,{"width":"90"  ,  "renderer": columnsrenderer ,   "datafield":"type"                  ,"text":"서비스구분"					,"type":"string","name":"type", "cellsrenderer": service_type}
            ,{"width":"120"  ,  "renderer": columnsrenderer ,   "datafield":"corp_name"                  ,"text":"법인명"                  ,"type":"string","name":"corp_name"}
            ,{"width":"170"  ,  "renderer": columnsrenderer ,   "datafield":"created_at"                  ,"text":"생성일자"                  ,"type":"string","name":"created_at", "cellsalign": "center"}
			,{"width":"170"  ,  "renderer": columnsrenderer ,   "datafield":"update_at"                  ,"text":"마지막 업데이트"					,"type":"string","name":"update_at", "cellsalign": "center"}
];  
var gridDataSource = {
    "cache": false,
    "type": 'post',
    "url": '//${cms_api_domain}/1.0/cor/history/period',
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
$("#__GRID").jqxGrid( {
    width: '100%',
    height: '760', 
    theme: "arctic",
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
    columnsheight:40, //헤더 컬럼의 크기 
    altrows : true,   //줄마다 다른 색 넣기 
    columns: data_columns
});
function loadList() {
	idx = $('#subCorIdx').val();
	search_text = $('input[name=search_txt]').val();
	from_dt = $('input[name=from]').val();
	to_dt = $('input[name=to]').val();

	var dataadapter = new $.jqx.dataAdapter(gridDataSource, {
        'beforeSend' : function (jqXHR, settings) {
            // TODO scyun AJAX 호출시 헤더값을 숨기는 방안 확인 필요함... 
            // 전송 전 API 에서 검증하는 api-key 를 설정한다
            jqXHR.setRequestHeader("x-api-key", "SpammerGoHome");
        },
         'formatData' : function(data) {
             // 여기서 검색필드값을 추가해 전달한다. 
            return  JSON.stringify( {
            						 'search_text': search_text
            						,'from_dt': from_dt
            						,'to_dt': to_dt
            						,'cor_idx': '${corIdx}'
            						,'sub_cor_idx': idx
                                    ,'page'           : data.pagenum + 1
                                    ,'perPage'        : data.pagesize
                                    });
        },
         'loadError' : function(jqXHR, status, error) {

        },
        'downloadComplete' : function(edata, textStatus, jqXHR) {
            // http 상태코드가 2XX 일 경우 수행됨..
            console.log(edata);
        },
        'beforeLoadComplete' : function() {
            //
        }
    });
    $("#__GRID").jqxGrid( { source: dataadapter, columns: data_columns});
    $.ajax({
	    url: '//${cms_api_domain}/1.0/cor/history/period',
	    type: 'post',
	    dataType: 'json',
	    contentType: 'application/json',
	    beforeSend: function(jqXHR, setting) {
	            jqXHR.setRequestHeader('x-api-key', 'SpammerGoHome');
	    },
	    data:JSON.stringify({'search_text': search_text, 'from_dt': from_dt, 'to_dt': to_dt, cor_idx: '${corIdx}', sub_cor_idx: idx, page: -1, perPage: 10}),
	    success: function(data) {
	            console.log(data);
	            insertTotalData(data.body)
	    }
	})
}
function insertTotalData(data) {
    var html = '';
    var cur;
    var classType = '';
    var total_cost = 0;
    var total_add_cost = 0;
	var total_add_tax = 0;
	var total_total = 0;
	
    for(var i = 0, j = data.list.length; i < j; i++) {
            cur = data.list[i];

            if(typeof cur.cost == "undefined") cur.cost = 0;
            if(typeof cur.add_cost == "undefined") cur.add_cost = 0;
            if(typeof cur.add_tax == "undefined") cur.add_tax = 0;

            total_cost += cur.cost;
            total_add_cost += cur.add_cost;
            total_add_tax += cur.add_tax;
            total_total += (cur.cost + cur.add_cost + cur.add_tax);
    }


    html += '<tr class="' + 'odd' + ' result">';
    html += '<td colspan="1" style="text-align: center;">총 계</td>';
    html += '<td style="text-align: right;">' + total_cost.toLocaleString() + '</td>';
    html += '<td style="text-align: right;">' + total_add_cost.toLocaleString() + '</td>';
    html += '<td style="text-align: right;">' + total_add_tax.toLocaleString() + '</td>';
    html += '<td style="text-align: right;">' + total_total.toLocaleString() + '</td>';
	
	html += '</tr>';
    
    $('#history_body').empty();
    $('#history_body').append(html);
}
// corpPopup
function loadSubCol() {
	$.ajax({
	    url: '//${cms_api_domain}/1.0/cor/history/link_svc_list',
	    type: 'post',
	    dataType: 'json',
	    contentType: 'application/json',
	    beforeSend: function(jqXHR, setting) {
	            jqXHR.setRequestHeader('x-api-key', 'SpammerGoHome');
	    },
	    data:JSON.stringify(
	    	{
	    		'cor_idx': ${corIdx},
				'search_text': search_text
	    	}
	    ),
	    success: function(data) {
	        var html ="";
	        html += '<option value="-1" selected>전체</option>';
	        for(var i in data.body.list) {
	        	html += '<option value="' + data.body.list[i].idx + '">' + data.body.list[i].name + '</option>'
	        }
	        $('#subCorIdx').empty();
	        $('#subCorIdx').append(html);

	        console.log(data);
	    }
	})
}
// initialize
function initialize() {
	idx = -1;


	loadSubCol();


	$('#history_body').empty();

	$('input[name=corp_txt]').removeAttr("readonly");
	$('input[name=corp_txt]').val("");

	$('input[name=search_txt]').val("")
	$('input[name=from]').val("")
	$('input[name=to]').val("");

	validate.toDatePicker($('#first_date'))
	validate.dateToFirstDay($('#first_date'))
    validate.toDatePicker($('#last_date'))
	validate.dateToToday($('#last_date'))
	PK_COMN.toDatePicker('.datetimepicker-date');

    var html = '';
    html += '<tr class="' + 'odd' + ' result">';
    html += '<td colspan="1" style="text-align: center;">총 계</td>';
    html += '<td style="text-align: right;">' + 0 + '</td>';
    html += '<td style="text-align: right;">' + 0 + '</td>';
    html += '<td style="text-align: right;">' + 0 + '</td>';
    html += '<td style="text-align: right;">' + 0 + '</td>';
    
    html += '</tr>';
    
    $('#history_body').empty();
    $('#history_body').append(html);
}
	
$('#SEARCH_FORM').on('submit', function(e) {
	e.preventDefault();
	
	loadList();
})
$('#__RESET_BTN').on('click', function(e) {
	e.preventDefault();
	
	initialize();

	$('#SEARCH_FORM').submit();
})

$('#excel').on('click', function(e) {
	e.preventDefault();
	
	location.href = '/cor/history/period_xlsx?search_text=' + search_text + '&from_dt=' + from_dt + '&to_dt=' + to_dt + "&cor_idx=" + ${corIdx} + "&sub_cor_idx=" + idx;
})
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
// Validate
validate.addElement($('input[name=search_txt]'), {kor: true, number: true, eng: true, space: true});


initialize();
loadList();



</script>
</html>