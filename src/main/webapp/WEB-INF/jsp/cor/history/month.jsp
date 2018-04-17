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
	<script>mixpanel.track("cor month");</script>
<!-- begin #content -->
<div id="content" class="content">
	<!-- begin breadcrumb -->
	<ol class="breadcrumb pull-right">
        <li class="active"><a href="/cor/history/period?mainmenu=m4&submenu=s1">HOME</a></li>
        <li class="active"><a href="/cor/history/month?mainmenu=m4&submenu=s2">월기준</a></li>
    </ol>
	<h1 class="page-header">이용내역조회-사용자별 이용내역(월기준)</h1>
	<!-- begin row -->
	<div class="row">
		<!-- begin col-12 -->
		<div class="col-md-12">
			<div class="panel panel-inverse">
                <div class="panel-heading">
                    <h4 class="panel-title">이용내역조회-사용자별 이용내역(월기준)</h4>
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
						<label class="col-md-1 control-label">이용년도</label>
						<div class="col-md-2">
							<select class="form-control" name="year">
							</select>
						</div>
						<div class="col-md-8">&nbsp;</div>
						<div class="col-md-1 text-right"><a class="btn btn-primary" href="javascript:;" id="__RESET_BTN" >초기화</a></div>
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
	           			<table id="data-table" class="table table-striped table-bordered dataTable no-footer" role="grid">
	           				<thead>
	                               <tr role="row"> 
									<th tabindex="0" aria-controls="data-table" rowspan="1" colspan="1"></th>
									<th tabindex="0" aria-controls="data-table" rowspan="1" colspan="1">합계</th>
									<th tabindex="0" aria-controls="data-table" rowspan="1" colspan="1">1월</th>
									<th tabindex="0" aria-controls="data-table" rowspan="1" colspan="1">2월</th>
									<th tabindex="0" aria-controls="data-table" rowspan="1" colspan="1">3월</th>
									<th tabindex="0" aria-controls="data-table" rowspan="1" colspan="1">4월</th>
									<th tabindex="0" aria-controls="data-table" rowspan="1" colspan="1">5월</th>
									<th tabindex="0" aria-controls="data-table" rowspan="1" colspan="1">6월</th>
									<th tabindex="0" aria-controls="data-table" rowspan="1" colspan="1">7월</th>
									<th tabindex="0" aria-controls="data-table" rowspan="1" colspan="1">8월</th>
									<th tabindex="0" aria-controls="data-table" rowspan="1" colspan="1">9월</th>
									<th tabindex="0" aria-controls="data-table" rowspan="1" colspan="1">10월</th>
									<th tabindex="0" aria-controls="data-table" rowspan="1" colspan="1">11월</th>
									<th tabindex="0" aria-controls="data-table" rowspan="1" colspan="1">12월</th>
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
<script type="text/javascript" src="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/jqwidget/jqxgrid.selection.js"></script> <script type="text/javascript" src="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/jqwidget/jqxgrid.columnsresize.js"></script>
<script type="text/javascript" src="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/jqwidget/jqxgrid.filter.js"></script>
<script type="text/javascript" src="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/jqwidget/jqxgrid.sort.js"></script>
<script type="text/javascript" src="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/jqwidget/jqxgrid.pager.js"></script>
<script type="text/javascript" src="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/jqwidget/jqxgrid.grouping.js"></script>
<!-- //Required files for grid -->
<!-- Optional files for grid -->
<script type="text/javascript" src="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/jqwidget/jqxcheckbox.js"></script>

	</common:body>

<script>
var today = new Date();

var search_text = '';
var search_year = today.getFullYear();

var idx = -1;

var columnsrenderer = function (value) {
    return   '<div style="text-align: center; margin-top: 13px;">' + value + '</div>';
}
var yearrenderer = function(value) {
    return   '<div style="text-align: center; margin-top: 13px;">' + search_year + value + '</div>';
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
			,{"width":"150"  ,  "renderer": yearrenderer ,   "datafield":"total"               ,"text":"년 합계"					,"type":"string","name":"total", "cellsrenderer": numberrender,  "cellsalign": "right"}
			,{"width":"106"  ,  "renderer": columnsrenderer ,   "datafield":"mon_1"                  ,"text":"1월"					,"type":"string","name":"mon_1", "cellsrenderer": numberrender,  "cellsalign": "right"}
			,{"width":"106"  ,  "renderer": columnsrenderer ,   "datafield":"mon_2"                  ,"text":"2월"					,"type":"string","name":"mon_2", "cellsrenderer": numberrender,  "cellsalign": "right"}
			,{"width":"106"  ,  "renderer": columnsrenderer ,   "datafield":"mon_3"                  ,"text":"3월"					,"type":"string","name":"mon_3", "cellsrenderer": numberrender,  "cellsalign": "right"}
			,{"width":"106"  ,  "renderer": columnsrenderer ,   "datafield":"mon_4"                  ,"text":"4월"					,"type":"string","name":"mon_4", "cellsrenderer": numberrender,  "cellsalign": "right"}
			,{"width":"106"  ,  "renderer": columnsrenderer ,   "datafield":"mon_5"                  ,"text":"5월"					,"type":"string","name":"mon_5", "cellsrenderer": numberrender,  "cellsalign": "right"}
			,{"width":"106"  ,  "renderer": columnsrenderer ,   "datafield":"mon_6"                  ,"text":"6월"					,"type":"string","name":"mon_6", "cellsrenderer": numberrender,  "cellsalign": "right"}
			,{"width":"106"  ,  "renderer": columnsrenderer ,   "datafield":"mon_7"                  ,"text":"7월"					,"type":"string","name":"mon_7", "cellsrenderer": numberrender,  "cellsalign": "right"}
			,{"width":"106"  ,  "renderer": columnsrenderer ,   "datafield":"mon_8"                  ,"text":"8월"					,"type":"string","name":"mon_8", "cellsrenderer": numberrender,  "cellsalign": "right"}
			,{"width":"106"  ,  "renderer": columnsrenderer ,   "datafield":"mon_9"                  ,"text":"9월"					,"type":"string","name":"mon_9", "cellsrenderer": numberrender,  "cellsalign": "right"}
			,{"width":"106"  ,  "renderer": columnsrenderer ,   "datafield":"mon_10"                  ,"text":"10월"					,"type":"string","name":"mon_10", "cellsrenderer": numberrender,  "cellsalign": "right"}
			,{"width":"106"  ,  "renderer": columnsrenderer ,   "datafield":"mon_11"                  ,"text":"11월"					,"type":"string","name":"mon_11", "cellsrenderer": numberrender,  "cellsalign": "right"}
			,{"width":"106"  ,  "renderer": columnsrenderer ,   "datafield":"mon_12"                  ,"text":"12월"					,"type":"string","name":"mon_12", "cellsrenderer": numberrender,  "cellsalign": "right"}
];  
var gridDataSource = {
    "cache": false,
    "type": 'post',
    "url": '//${cms_api_domain}/1.0/cor/history/month',
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
	search_year = $('select[name=year]').val();
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
	    url: '//${cms_api_domain}/1.0/cor/history/month',
	    type: 'post',
	    dataType: 'json',
	    contentType: 'application/json',
	    beforeSend: function(jqXHR, setting) {
	            jqXHR.setRequestHeader('x-api-key', 'SpammerGoHome');
	    },
	    data:JSON.stringify({'search_text': search_text, 'search_year': search_year,'cor_idx': '${corIdx}', 'sub_cor_idx': idx, page:-1, perPage: 10}),
	    success: function(data) {
	            console.log(data);
	            insertTotalData(data.body)
	    }
	})
}


function insertTotalData(data) {
    var html = '';
    var cur;
    var total = 0;
    var classType = '';
    
    // 달별 total amount
    var total_array = [];
    var temp = 0;
   	for(var i = 1; i <= 12; i++) {
   		temp = 0;
   		for(var j = 0; j < data.totalCount; j++) {
   			temp += data.list[j]['mon_'+i];
   		}
   		total_array.push(temp);
   	}
   	
   	

    i % 2 == 0 ? classType = 'even' : classType = 'odd';
    html += '<tr class="' + classType + ' result">';
    html += '<td colspan="1" style="text-align: center;">총 계</td>';
    html += '<td style="text-align: right;">' + data.totalAmount.toLocaleString() + '</td>';
    
    // 월별 데이터 
	for(var i = 0; i < 12; i++) {
		html += '<td style="text-align: right;">' + total_array[i].toLocaleString() + '</td>';
	}
	
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
	    }
	});
}
function initialize() {
	idx = -1;
	
	loadSubCol();

	$('#history_body').empty();

	$('.b_i_deiable').attr("disabled", "disabled");

	$('input[name=corp_txt]').removeAttr("readonly");
	$('input[name=corp_txt]').val("");
	
	$('input[name=search_txt]').val("");
	$('select[name=year]').val(today.getFullYear());

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

	html = '';
    html += '<tr class="' + 'odd' + ' result">';
    html += '<td colspan="1" style="text-align: center;">총 계</td>';
    html += '<td style="text-align: right;">' + 0 + '</td>';
    
    // 월별 데이터 
	for(var i = 0; i < 12; i++) {
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

$('#excel').on('click', function(e) {
	e.preventDefault();
	location.href = '/cor/history/month_xlsx?search_text=' + search_text + "&search_year=" + search_year + "&cor_idx=" + ${corIdx} + "&sub_cor_idx=" + idx;
})

// Validate
validate.addElement($('input[name=search_txt]'), {kor: true, number: true, eng: true, space: true});
$('.corpPopup').on('click', function(e) {
	e.preventDefault();

	openPopup();
})


initialize();
loadList();
</script>

</html>  