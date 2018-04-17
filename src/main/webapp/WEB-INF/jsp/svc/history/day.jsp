<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="/WEB-INF/jsp/include/taglib.jsp"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko">
<common:head>
	<link rel="stylesheet"
		href="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/jqwidget/styles/jqx.base.css"
		type="text/css" />
	<link rel="stylesheet"
		href="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/jqwidget/styles/jqx.arctic.css"
		type="text/css" />
	<title>ParkingOn ___Admin</title>
	<style type="text/css">
        td, th { min-width: 100px; }
    </style>
</common:head>
<common:body>
<script>mixpanel.track("svc day");</script>
	<!-- begin #content -->
	<div id="content" class="content">
		<!-- begin breadcrumb -->
		<ol class="breadcrumb pull-right">
        	<li class="active"><a href="/svc/history/sub_period?mainmenu=m5&submenu=s1">HOME</a></li>
        	<li class="active"><a href="/svc/history/sub_day?mainmenu=m5&submenu=s3">일기준</a></li>
    	</ol> 
		<h1 class="page-header">이용내역조회-사용자별 이용내역(일기준)</h1>
		<!-- begin row -->
		<div class="row">
			<!-- begin col-12 -->
			<div class="col-md-12">
				<div class="panel panel-inverse">
					<div class="panel-heading">
						<h4 class="panel-title">이용내역조회-사용자별 이용내역(일기준)</h4>
					</div>

					<form action="#" id="SEARCH_FORM">
						<div class="panel-body">
							<div class="form-inline" onsubmit="return false;">
								<label class="col-md-1 control-label">검색구분</label>
								<div class="col-md-2">
									<input type="text" class="form-control" name="search_txt"
										placeholder="이름, 사번">
								</div>
								<label class="col-md-1 control-label">법인업체</label>
								<div class="col-md-2">
									<input type="text" class="form-control corpPopup" name="corp_txt" placeholder="법인 조회">
									<a href="#" class="btn btn-primary corpPopup">조회</a>
								</div>
								<div class="col-md-5">&nbsp;</div>
								<div class="col-md-1 text-right">
									<input class="btn btn-primary b_i_deiable" href="javascript:;"
										id="__SEARCH_BTN" value="검색" type="submit">
								</div>
							</div>
						</div>
						<div class="panel-body">
							<div class="form-inline" onsubmit="return false;">
								<label class="col-md-1 control-label">이용년도</label>
								<div class="col-md-2">
									<select class="form-control" name="year">
									</select>
								</div>
								<label class="col-md-1 control-label">이용 월</label>
								<div class="col-md-2">
									<select class="form-control" name="month">
										<option value="01">1월</option>
										<option value="02">2월</option>
										<option value="03">3월</option>
										<option value="04">4월</option>
										<option value="05">5월</option>
										<option value="06">6월</option>
										<option value="07">7월</option>
										<option value="08">8월</option>
										<option value="09">9월</option>
										<option value="10">10월</option>
										<option value="11">11월</option>
										<option value="12">12월</option>
									</select>
								</div>
								<div class="col-md-5">&nbsp;</div>
								<div class="col-md-1 text-right">
									<a class="btn btn-primary" href="javascript:;" id="__RESET_BTN">초기화</a>
								</div>
							</div>
						</div>
					</form>
					<div class="panel-body">
						<div class="form-inline">
							<div class="col-md-12 text-right">
								<button class="btn btn-primary b_i_deiable" id="excel">엑셀다운로드</button>
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
						<table id="data-table"
							class="table table-striped table-bordered dataTable no-footer"
							role="grid">
							<thead>
								<tr role="row">
									

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
</common:body>

<script>

var month, year;

var idx= null;

var today = new Date()
var last_day = ( new Date( today.getFullYear(), today.getMonth()+1, 0) ).getDate();

var search_text = '';
var search_year = today.getFullYear() + "" + (today.getMonth()-1 < 10 ? "0" + (today.getMonth()+1) : today.getMonth()-1);

var columnsrenderer = function (value) {
	    return   '<div style="text-align: center; margin-top: 13px;">' + value + '</div>';
}
var numberrender = function(row, columnfield, value, defaulthtml, columnproperties) {
	var regex = /<(.*?)>(.*?)<(.*?)>/g;

	var reg_arr = regex.exec(defaulthtml);

	var result =  defaulthtml.replace(reg_arr[2], value.toLocaleString());
	return result;
}
var data_columns = [ 
			 {"width":"70"  ,  "renderer": columnsrenderer ,   "datafield":"cust_no"                  ,"text":"사번"					,"type":"string","name":"cust_no", "cellsalign": 'center'}
			,{"width":"100"  ,  "renderer": columnsrenderer ,   "datafield":"cust_name"                  ,"text":"이름"					,"type":"string","name":"cust_name"}
			,{"width":"70"  ,  "renderer": columnsrenderer ,   "datafield":"total_used"                  ,"text":"이용횟수"					,"type":"number","name":"total_used", "cellsalign": 'right', "cellsrenderer": numberrender,  "cellsalign": "right"}
			,{"width":"100"  ,  "renderer": columnsrenderer ,   "datafield":"total"                  ,"text":"이용합계"					,"type":"number","name":"total", "cellsalign": 'right', "cellsrenderer": numberrender,  "cellsalign": "right"}
	];
for(var i = 1; i <= 31; i++) {
	data_columns.push({"width":"70"  ,  "renderer": columnsrenderer ,   "datafield":"day_"+i                  ,"text":i+"일"					,"name":"day_"+i, "cellsalign": 'right', "cellsrenderer": numberrender,  "cellsalign": "right"});
}
var gridDataSource = {
    "cache": false,
    "type": 'post',
    "url": '//${cms_api_domain}/1.0/svc/history/day',
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
	search_text = $('input[name=search_txt]').val();
	search_year = $('select[name=year]').val() + "" + $('select[name=month]').val();

	last_day = ( new Date( $('select[name=year]').val(),  $('select[name=month]').val(), 0) ).getDate();
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
            						,'search_year': search_year
            						// ,'cor_idx': '${corIdx}'
            						,'cor_idx': idx
            						,'svc_idx': ${corIdx}
                                    ,'page'           : data.pagenum + 1
                                    ,'perPage'        : data.pagesize
                                    });
        },
         'loadError' : function(jqXHR, status, error) {

        },
        'downloadComplete' : function(edata, textStatus, jqXHR) {
            // http 상태코드가 2XX 일 경우 수행됨..
            // 
            console.log(edata);
        },
        'beforeLoadComplete' : function() {
        	for(var i = 31; i > last_day; i--) {
		    	$('#__GRID').jqxGrid('hidecolumn', "day_"+i);
        	}
        },
        'loadComplete': function() {

        }
    });
    $("#__GRID").jqxGrid( { source: dataadapter, });
    

    $.ajax({
	    url: '//${cms_api_domain}/1.0/svc/history/day',
	    type: 'post',
	    dataType: 'json',
	    contentType: 'application/json',
	    beforeSend: function(jqXHR, setting) {
	            jqXHR.setRequestHeader('x-api-key', 'SpammerGoHome');
	    },
	    // data:JSON.stringify({'search_text': search_text, 'search_year': search_year,'cor_idx': '${corIdx}', page:-1, perPage: 10}),
	    data:JSON.stringify({'search_text': search_text, 'search_year': search_year, cor_idx: idx, svc_idx: '${corIdx}', page:-1, perPage: 10}),
	    success: function(data) {
	            console.log(data);
	            insertTotalData(data.body);
	            
	    }
	})
}



function insertTotalData(data) {
    var html = '';
    var cur;
    var total = 0;
    var total_used = 0;
    var classType = '';
    
    for(var i = 0, j = data.list.length; i < j; i++) {
            cur = data.list[i];
            // 이용량 더하기
            total_used += cur.total_used;
    }
    
    // 달별 total amount
    var total_array = [];
    var temp = 0;
   	for(var i = 1; i <= last_day; i++) {
   		temp = 0;
   		for(var j = 0; j < data.totalCount; j++) {
   			temp += data.list[j]['day_'+i];
   		}
   		total_array.push(temp);
   	}

   	html += '<th tabindex="0" aria-controls="data-table" rowspan="1" colspan="1"></th>';
   	html += '<th tabindex="0" aria-controls="data-table" rowspan="1" colspan="1">이용횟수</th>';
   	html += '<th tabindex="0" aria-controls="data-table" rowspan="1" colspan="1">이용합계</th>';
   	for(var i = 1; i <= last_day; i++) {
		html += '<th tabindex="0" aria-controls="data-table" rowspan="1" colspan="1">' + i + '일</th>';
	}
	$('thead tr').empty();
	$('thead tr').append(html);

	html = '';
   	

	i % 2 == 0 ? classType = 'even' : classType = 'odd';
    html += '<tr class="' + classType + ' result">';
    html += '<td colspan="1" style="text-align: center;">총 계</td>';
    html += '<td style="text-align: right;">' + total_used.toLocaleString() + '</td>';
    html += '<td style="text-align: right;">' + data.totalAmount.toLocaleString() + '</td>';
    
    // 월별 데이터 
	for(var i = 0; i < last_day; i++) {
		html += '<td style="text-align: right;">' + total_array[i].toLocaleString() + '</td>';
	}
	
	html += '</tr>';
    
    $('#history_body').empty();
    $('#history_body').append(html);
}
// corpPopup
function openPopup() {
	if(typeof corpPopup === "undefined" || corpPopup.closed) {
		corpPopup = window.open("/popup/corpListPopup?type=2&svc_idx=${corIdx}", "corpPopup", "status=1,width=600,height=610");
	}
	else {
        corpPopup.close();
        corpPopup = window.open("/popup/corpListPopup?type=2&svc_idx=${corIdx}", "corpPopup", "status=1,width=600,height=610");
	}
}
function loadData(m_idx, name) {
	$('input[name=corp_txt]').attr("readonly", "true");
	$('input[name=corp_txt]').val(name);

	$('.b_i_deiable').removeAttr("disabled");

	idx = m_idx;
	loadList();
}
function initialize() {
	idx = null;
	
	$('#history_body').empty();

	$('.b_i_deiable').attr("disabled", "disabled");

	$('input[name=corp_txt]').removeAttr("readonly");
	$('input[name=corp_txt]').val("");

	$('input[name=search_txt]').val("");
	$('select[name=year]').val(today.getFullYear());
	$('select[name=month]').val((today.getMonth()+1 < 10 ? "0" + (today.getMonth()+1) : today.getMonth()+1));

	var html = '';
	
	$('select[name=month]').val((today.getMonth()+1 < 10 ? "0" + (today.getMonth()+1) : today.getMonth()+1));
	last_day = ( new Date( today.getFullYear(), today.getMonth()+1, 0) ).getDate();

	// initialize year
	var html = "";
	for(var i = today.getFullYear(); i >= 2014; i--) {
		if(i == today.getFullYear()) {
			html += "<option value='" + i + "' selected>" + i + "년</option>";
		}
		else {
			html += "<option value='" + i + "'>" + i + "년</option>";
		}
	} 
	$('select[name=year]').empty();
	$('select[name=year]').append(html);

	var html = '';
	
	html += '<th tabindex="0" aria-controls="data-table" rowspan="1" colspan="1"></th>';
   	html += '<th tabindex="0" aria-controls="data-table" rowspan="1" colspan="1">이용횟수</th>';
   	html += '<th tabindex="0" aria-controls="data-table" rowspan="1" colspan="1">이용합계</th>';
   	for(var i = 1; i <= last_day; i++) {
		html += '<th tabindex="0" aria-controls="data-table" rowspan="1" colspan="1">' + i + '일</th>';
	}
	$('thead tr').empty();
	$('thead tr').append(html);

	html = '';
   	

	i % 2 == 0 ? classType = 'even' : classType = 'odd';
    html += '<tr class="' + classType + ' result">';
    html += '<td colspan="1" style="text-align: center;">총 계</td>';
    html += '<td style="text-align: right;">' + 0 + '</td>';
    html += '<td style="text-align: right;">' + 0 + '</td>';
    
    // 월별 데이터 
	for(var i = 0; i < last_day; i++) {
		html += '<td style="text-align: right;">' + 0 + '</td>';
	}
	
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
$('select[name=month]').on('change', function() {
	last_day = ( new Date( today.getFullYear(), Number($('.select[name=month]').val()), 0) ).getDate();
})
$('#excel').on('click', function(e) {
	e.preventDefault();
	
	// location.href='/cor/history/day_xlsx?search_text=' + search_text + "&search_year=" + search_year + "&cor_idx=" + ${corIdx};
	location.href='/svc/history/day_xlsx?search_text=' + search_text + "&search_year=" + search_year + "&svc_idx=" + ${corIdx} + "&cor_idx=" + idx;
})
$('.corpPopup').on('click', function(e) {
	e.preventDefault();

	openPopup();
})
// Validate
validate.addElement($('input[name=search_txt]'), {kor: true, number: true, eng: true, space: true});

initialize();
	
</script>

</html>