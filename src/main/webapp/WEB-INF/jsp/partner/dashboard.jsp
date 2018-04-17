<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  trimDirectiveWhitespaces="true" %>
<%@include file="/WEB-INF/jsp/include/taglib.jsp" %>
<!DOCTYPE html>
<html lang="ko">
	<common:head>
		<title>ParkingOn ___Admin</title>
		<link rel="stylesheet" href="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/jqwidget/styles/jqx.base.css" type="text/css" />
		<link rel="stylesheet" href="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/jqwidget/styles/jqx.arctic.css" type="text/css" />
		<style type="text/css">
			* { margin:0; padding:0; box-sizing: border-box; font-family: 'Open Sans',"Helvetica Neue",Helvetica,Arial,sans-serif; }
			*:after { display: block; clear: both; content: "" }
			
			span { display: inline-block; }
			.left { float: left; }
			.right { float: right; }
			.cl { clear: both; }

			.center_wrap { display: flex; align-items: center; justify-content: center; }

			#header { width: 100%; background-color: #fff; box-shadow: 1px 1px 3px #888; }

			.wrap { min-width: 1400px; height: 100%; padding: 30px; font:0; margin: auto; }

			.container { background-color: #fff; box-shadow: 1px 1px 3px #888; display: inline-block; }

			.input_container input[type=date] { width: 150px; height: 30px; float:left; }
			.input_container input[type=checkbox] { width: 18px; height: 18px; margin-top: 10px; cursor: pointer }
			.input_container input[type=text] { width: 20%; max-width: 120px; height: 30px; margin-top: 10px; padding: 5px; margin-left: 10px; }
			.input_container input[type=text]:nth-child(1) { margin-left: 0; }
			.input_container input[type=text]:nth-child(6) { margin-left: 0; }
			.input_container label { cursor: pointer }

			.search, .order{ width: calc(50% - 20px); padding: 10px; }
			.grid { width: 100%; padding: 10px; margin-top: 20px; }


			.table_column { height: 100%; display: inline-block; height: 100%; }

			.left_column { width: 30%; background-color: #3F51B5; color:#fff; padding-left: 10px; line-height: 45px; border-bottom: 1px solid #fff; }
			.right_column { width: 70%; color:#333; padding: 7px 0 7px 20px; float: right; border-bottom: 1px solid #9E9E9E; }
	


			.table_container { font-size: 15px; height: 45px; }
			.table_container:last-child .right_column, .table_container:last-child .left_column { border: 0; }

			.table_search { height: 100px; }

			/*ORDER*/
			.order_header { width: 100%; height: 45px; background-color: #3F51B5; color: #fff; font-size: 15px; border-bottom: 1px solid #fff; }
	

			.order_column { height: 100px; padding: 15px 0 15px 0; }
			.o_btn { width: 200px; height: 80px; border: 0; font-size: 18px; color:#fff; transition: background-color .3s; }

			.inquery_btn { background-color: #FFC107; }
			.inquery_btn:hover { background-color: #FF6F00; }
			.order_btn { background-color: #3F51B5; }
			.order_btn:hover { background-color: #1A237E; }

			#excel { width: 150px; height: 50px; background-color: rgb(33, 115, 70); border: 0; color: #fff; }
			
			.input-box { height: 30px; display: inline-block; }
			.date_addon { height: 30px; background-color: #e2e7eb; padding: 6px 12px 6px 12px; border-radius: 4px; border-top-left-radius: 0; border-bottom-left-radius: 0; }

			@media (max-width:1399px) {
				.wrap { min-width: 760px; }
				.search { width: 100%; }
				.order { width: 100%; margin-top: 30px; }

				.input_container input[type=text] { width: 20%; max-width: 300px; height: 30px; margin-top: 10px; padding: 5px; margin-left: 10px; }
			}
		</style>
	</common:head>
	<body>
		<script>mixpanel.track("partner dashboard");</script>
		<header id="header">
			<a href="//${php_web_domain}/partner/dashboard" class="navbar-brand"><span class="navbar-logo"></span> ParkingOn Admin</a>

			<a href="//${partner_ui_domain}/auth/${adminType}/logout"><span class="hidden-xs">로그아웃</span></a>
		</header>
		<section>
			<div class="wrap">
				<div class="search container left">
					<div class="table_container">
						<div class="table_column left_column">
							기간
						</div>
						<div class="table_column right_column">
							<div class="input_container">
								<div class="input-box">
									<input type="date" name="start_date">
									<span class="date_addon"><span class="glyphicon glyphicon-calendar"></span></span>
								</div>
								<div class="input-box">
									~
								</div>
								<div class="input-box">
									<input type="date" name="end_date">
									<span class="date_addon"><span class="glyphicon glyphicon-calendar"></span></span>
								</div>
							</div>
						</div>
					</div>
					<div class="table_container">
						<div class="table_column left_column">
							결제수단
						</div>
						<div class="table_column right_column">
							<div class="input_container">
								<input type="checkbox" class="payment_type" column-value='0' id="cash" name="cash">
								<label for="cash">현금</label>

								<input type="checkbox" class="payment_type" column-value='1' id="card" name="card">
								<label for="card">카드</label>

								<input type="checkbox" class="payment_type" column-value='2' id="after" name="after">
								<label for="after">후정산</label>
							</div>
						</div>
					</div>
					<div class="table_container">
						<div class="table_column left_column">
							상태
						</div>
						<div class="table_column right_column">
							<div class="input_container">
								<input type="checkbox" class="state" column-value="1000" id="order" name="order">
								<label for="order">접수</label>
								<input type="checkbox" class="state" column-value="1005" id="allocate" name="allocate">
								<label for="allocate">배차</label>
								<input type="checkbox" class="state" column-value="1015" id="finish" name="finish">
								<label for="finish">완료</label>
								<input type="checkbox" class="state" column-value="1050" id="cancle" name="cancle">
								<label for="cancle">취소</label>
							</div>
						</div>
					</div>
					<div class="table_container table_search">
						<div class="table_column left_column">
							검색
						</div>
						<div class="table_column right_column">
							<div class="input_container">
								<input type="text" class="searchTxt" id="user_name" placeholder="고객명">
								<input type="text" class="searchTxt" id="user_phone_number" placeholder="고객 전화">
								<input type="text" class="searchTxt" id="driver_name" placeholder="기사명">
								<input type="text" class="searchTxt" id="driver_phone_number" placeholder="기사 전화">
								<br>
								<input type="text" class="searchTxt" id="corp_name" placeholder="법인명">
								<input type="text" class="searchTxt" id="title" placeholder="출발지">
								<input type="text" class="searchTxt" id="u_title" placeholder="목적지">
								<input type="text" class="searchTxt" id="t_title" placeholder="경유지">
							</div>
						</div>
					</div>
				</div>
				<div class="order container right">
					<div class="order_header center_wrap">
						<div class="">
							<span class="s_order">접수: x건</span>
							<span class="s_process">진행: x건</span>
						</div>
					</div>
					<div class="table_container">
						<div class="table_column left_column">
							서비스 구분
						</div>
						<div class="table_column right_column">
							<div class="input_container">
								<input type="checkbox" class="type" column-value="1" id="sub_driver" name="sub_driver">
								<label for="sub_driver">대리운전</label>
								<input type="checkbox" class="type" column-value="2" id="consign" name="consign">
								<label for="consign">탁송</label>
								<input type="checkbox" class="type" column-value="0" id="driver" name="driver">
								<label for="driver">수행기사</label>
								<input type="checkbox" class="type" column-value="0" id="c_wash" name="c_wash">
								<label for="c_wash">방문세차</label>
							</div>
						</div>
					</div>
					<div class="table_container">
						<div class="table_column left_column">
							회원 구분
						</div>
						<div class="table_column right_column">
							<div class="input_container">
								<input type="checkbox" class="call_type" column-value="0" id="common" name="common">
								<label for="common">일반</label>
								<input type="checkbox" class="call_type" column-value="1" id="corp" name="=corp">
								<label for="corp">법인</label>
								<input type="checkbox" class="call_type" column-value="2" id="n_member" name="n_member">
								<label for="n_member">비회원</label>
							</div>
						</div>
					</div>
					<div class="table_container order_column">
						<button class="o_btn inquery_btn">조회/수정</button>
						<button class="o_btn order_btn">신규 오더</button>

						<div class="right">
							<button id="excel">엑셀 다운로드</button><br>
							<input type="checkbox" id="sound" name="sound">
							<label for="sound">음성</label>
						</div>
					</div>
				</div>
				<div class="grid container">
					<div id="__GRID" style="position: relative; z-index: 0;"></div>
				</div>
			</div>
		</section>
		<div id="context_menu">
			<ul>
				<li id="STATE_FIND_DRIVER" data-state=1000>접수 상태</li>
				<li id="STATE_CONNECTED_DRIVER" data-state=1005>배차</li>
				<li id="STATE_CHANGE_DRIVER" data-state=1006>재배차</li>
				<li id="STATE_COMPLETE" data-state=1015>운행 완료(결제)</li>
				<li id="STATE_CANCEL" data-state=1060>접수 취소</li>
				<li id="NEW_ORDER" data-state=''>오더 생성</li>
			</ul>
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
<script type="text/javascript">
var last_idx = 1;
var current_row_index = null;
var current_row_call_type = null;
var search_option = {
	 start_date: ''
	,end_date: ''
	,type: []
	,call_type: []
	,state: []
	,payment_type: []
	,page: 0
	,perPage: 0
	,user_name: ''
	,user_phone_number: ''
	,driver_name: ''
	,driver_phone_number: ''
	,corp_name: ''
	,title: ''
	,u_title: ''
	,t_title: ''
}

// 컬럼 렌더러
var render = function() {
	this.index_num = 1;

	var pushIn = function(defaulthtml, value) {
		var regex = /<(.*?)>(.*?)<(.*?)>/g;
		
		var reg_arr = regex.exec(defaulthtml);
		var result =  defaulthtml.replace(reg_arr[2], value);
		return result;
	}
	// 일반 컬림
	this.column = function(value) {
		return '<div style="text-align: center; margin-top: 13px;">' + value + '</div>';
	}
	this.number = function(row, column, value) {
	    if (row != 0)
	        this.index_num += 1;
	    else 
	        this.index_num = 1;
	    return '<div style="text-align: center; margin-top: 7px;">' + this.index_num + '</div>';
	}
	this.state = function(row, columnfield, value, defaulthtml, columnproperties) {
		var result = '';

		switch(value) {
			case STATE_FIND_DRIVER 			: result = "대기"; break;
			case STATE_CONNECTED_DRIVER 	: result = "기사연결"; break;
			case STATE_CHANGE_DRIVER 		: result = "기사변경"; break;
			case STATE_START_DRIVING 		: result = "기사연결"; break;
			case STATE_END_DRIVING 			: result = "기사연결"; break;
			case STATE_COMPLETE 			: result = "완료"; break;
			case STATE_CANCEL 				: result = "취소"; break;
			case STATE_CANCEL_BY_ADMIN 		: result = "취소"; break;
			case STATE_CANCEL_BY_DRIVER 	: result = "취소"; break;
			default 						: result = "오류!"; break;
		}
		return pushIn(defaulthtml, result);
	}
	this.payment = function(row, columnfield, value, defaulthtml, columnproperties) {
		var result = '';

		switch(value) {
			case 0 : result = "현금결제"; break;
			case 1 : result = "카드결제"; break;
		}
		return pushIn(defaulthtml, result);
	}
	this.service_type = function(row, columnfield, value, defaulthtml, columnproperties) {
		var result = '';

		switch(value) {
			case 1 : result = "대리운전"; break;
			case 2 : result = "탁송"; break;
		}
		return pushIn(defaulthtml, result);
	}
	this.driver_type  = function(row, columnfield, value, defaulthtml, columnproperties) {
		var result = '';

		switch(value) {
			case 'N' : result = "일반기사"; break;
			case 'F' : result = "정장기사"; break;
		}
		return pushIn(defaulthtml, result);
	}
	this.call_type = function(row, columnfield, value, defaulthtml, columnproperties) {
		var result = '';

		switch(value) {
			case 0 : result = "일반회원"; break;
			case 1 : result = "법인회원"; break;
		}
		return pushIn(defaulthtml, result);
	}
	this.locale = function(row, columnfield, value, defaulthtml, columnproperties) {
		return pushIn(defaulthtml, value.toLocaleString());
	}
}
var renderer = new render();
// grid row
var data_columns = [
	 {'width': 0, 	'renderer': renderer.column, 'datafield': 'idx', 				'text': 'idx', 		'type': 'number','name': 'idx', 'hidden': true}
	,{'width': 30, 	'renderer': renderer.column, 'datafield': 'no', 				'text': 'NO', 		'type': 'number','name': 'no','cellsrenderer': renderer.number}
	,{'width': 150,	'renderer': renderer.column, 'datafield': 'created_at', 		'text': '접수시간', 	'type': 'string','name': 'created_at', 'cellsalign': 'center'}
	,{'width': 70, 	'renderer': renderer.column, 'datafield': 'state', 				'text': '상태', 		'type': 'string','name': 'state', 'cellsalign': 'center', 'cellsrenderer': renderer.state}
	,{'width': 70, 	'renderer': renderer.column, 'datafield': 'payment_type', 		'text': '결제', 		'type': 'string','name': 'payment_type', 'cellsalign': 'center', 'cellsrenderer': renderer.payment}
	,{'width': 70, 	'renderer': renderer.column, 'datafield': 'cost', 				'text': '요금', 		'type': 'string','name': 'cost', 'cellsalign': 'right', 'cellsrenderer': renderer.locale}
	,{'width': 70, 	'renderer': renderer.column, 'datafield': 'type', 				'text': '서비스 구분', 'type': 'string','name': 'type', 'cellsalign': 'center', 'cellsrenderer': renderer.service_type}
	,{'width': 70, 	'renderer': renderer.column, 'datafield': 'driver_type', 		'text': '기사 Type', 	'type': 'string','name': 'driver_type', 'cellsalign': 'center','cellsrenderer': renderer.driver_type}
	,{'width': 70, 	'renderer': renderer.column, 'datafield': 'call_type', 			'text': '회원 구분', 	'type': 'string','name': 'call_type', 'cellsalign': 'center','cellsrenderer': renderer.call_type}
	,{'width': 100, 'renderer': renderer.column, 'datafield': 'corporation_name',	'text': '법인명', 	'type': 'string','name': 'corporation_name'}
	,{'width': 70, 	'renderer': renderer.column, 'datafield': 'nickname',			'text': '이름1', 		'type': 'string','name': 'nickname'}
	,{'width': 100, 'renderer': renderer.column, 'datafield': 'phone_number',		'text': '전화번호1', 	'type': 'string','name': 'phone_number', 'cellsalign': 'center'}
	,{'width': 70, 'renderer': renderer.column, 'datafield': 'nickname2',			'text': '이름2', 		'type': 'string','name': 'nickname2'}
	,{'width': 100, 'renderer': renderer.column, 'datafield': 'phone_number2',		'text': '전화번호2', 	'type': 'string','name': 'phone_number2'}
	,{'width': 130, 'renderer': renderer.column, 'datafield': 'title',				'text': '출발지', 	'type': 'string','name': 'title'}
	,{'width': 130, 'renderer': renderer.column, 'datafield': 'u_title',			'text': '도착지', 	'type': 'string','name': 'u_title'}
	,{'width': 70, 'renderer': renderer.column, 'datafield': 'driver_name',		'text': '기사이름', 	'type': 'string','name': 'driver_name'}
	,{'width': 100, 'renderer': renderer.column, 'datafield': 'driver_phone_number','text': '기사전화번호',	'type': 'string','name': 'driver_phone_number'}
];
var gridDataSource = {
    "cache": false,
    "type": 'post',
    "url": '//${cms_api_domain}/1.0/partner/list',
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
$("#context_menu").jqxMenu({ 
	width: 150, 
	height: 162, 
	autoOpenPopup: false, 
	mode: 'popup'
});
function loadList() {
	var dataadapter = new $.jqx.dataAdapter(gridDataSource, {
        'beforeSend' : function (jqXHR, settings) {
            jqXHR.setRequestHeader("x-api-key", "SpammerGoHome");
        },
         'formatData' : function(data) {
         	search_option.page 		= data.pagenum+1;
         	search_option.perPage 	= data.pagesize;

            return  JSON.stringify(search_option);
        },
         'loadError' : function(jqXHR, status, error) {

        },
        'downloadComplete' : function(edata, textStatus, jqXHR) {
            // http 상태코드가 2XX 일 경우 수행됨..

            // if(typeof edata.body.list[0] != 'undefined') {
            // 	console.log(edata.body.list[0]. idx);
            // 	last_idx = edata.body.list[0].idx;
            // }

            var data = edata.body.list;
            for(var i in data) {
            	if(data[i].sendSms == 1) {
            		smsSended(data[i].idx, function(success) {
	            		sendSms(data[i].phone_number);
            		})
            	}
            }
        },
        'beforeLoadComplete' : function() {
            //
        },
        'loadComplete' : function() {
			getTotal(search_option);
        }

    });
    $("#__GRID").jqxGrid( { source: dataadapter, columns: data_columns});
 //    $.ajax({
	//     url: '//${cms_api_domain}/1.0/cor/history/period',
	//     type: 'post',
	//     dataType: 'json',
	//     contentType: 'application/json',
	//     beforeSend: function(jqXHR, setting) {
	//             jqXHR.setRequestHeader('x-api-key', 'SpammerGoHome');
	//     },
	//     data:JSON.stringify({'search_text': search_text, 'from_dt': from_dt, 'to_dt': to_dt, cor_idx: '${corIdx}', sub_cor_idx: idx, page: -1, perPage: 10}),
	//     success: function(data) {
	//             console.log(data);
	//             insertTotalData(data.body)
	//     }
	// })
}
function combineSearchData(column) {
	var result = [];
	$('.'+column + ":checked").each(function(index, elem) {
		result.push($(this).attr('column-value'))
	})
	return result;
}
function checkNewRequest() {
	PKOAjax.request('//${cms_api_domain}/1.0/partner/checkNewRequest', 'post', {} , function(data) {
		console.log('check')
		console.log(data);
		if(data.body.idx > last_idx) {
			loadList();
			console.log('hasNewData')
		}
		else if(data.body.new == true) {
			console.log('hasNewData not load')
		}
	}, function(error) {
		alert(error);
	})
}
function getTotal(search_data) {
	PKOAjax.request('//${cms_api_domain}/1.0/partner/getTotal', 'post', search_data , function(data) {
		console.log(data);

		$('.s_order').text("접수: " + data.body.jupsu);
		$('.s_process').text("진행: " + data.body.continued);
	}, function(error) {
		alert(error);
	})
}
// Request 할당
function allocate(idx, callback) {
	PKOAjax.request('//${cms_api_domain}/1.0/partner/allocate', 'post', {idx: idx} , function(data) {
		callback();
	}, function(error) {
		alert(error);
	})
}
// Request 할당해제
function free(idx, callback) {
	PKOAjax.request('//${cms_api_domain}/1.0/partner/free', 'post', {idx: idx} , function(data) {
		callback();
	}, function(error) {
		alert(error);
	})
}
// Request 할당 체크 
function isAllocated(idx, not, allocated) {
	PKOAjax.request('//${cms_api_domain}/1.0/partner/isAllocate', 'post', {idx: idx} , function(data) {

		if(data.body == true) {
			allocated(data.body);
		}
		else {
			not(data.body);
		}
	}, function(error) {
		alert(error);
	})
}
// 현재 상태 알아옴
function getState(idx, callback) {
	PKOAjax.request('//${cms_api_domain}/1.0/partner/getState', 'post', {idx: idx} , function(data) {
		callback(data.body);
	}, function(error) {
		alert(error);
	})
}
function update(idx, options, callback) {

}
// 상태 변경
function updateState(idx, state, callback) {
	PKOAjax.request('//${cms_api_domain}/1.0/partner/updateState', 'post', {idx: idx, state: state} , function(data) {
		callback(data.body);
	}, function(error) {
		alert(error);
	})
}
// sms 보낸걸로 설정
function smsSended(idx, callback) {
	PKOAjax.request('//${cms_api_domain}/1.0/partner/smsSended', 'post', {idx: idx} , function(data) {
		callback(data.body);
	}, function(error) {
		alert(error);
	})
}
function sendSms(phone_number) {
	var send_phone = phone_number;
	var recv_phone = phone_number;
	var subject = 'subject';
	var content = '[파킹온]대리운전 오더가 접수 되었습니다. 빨리 기사 배정하여 연락 드리겠습니다.';

	$.ajax({
    	url: '//${cms_api_domain}/1.0/message/sms',
	    type: 'post',
	    dataType: 'json',
	    contentType: 'application/json',
	    beforeSend: function(jqXHR, setting) {
	            jqXHR.setRequestHeader('x-api-key', 'SpammerGoHome');
	    },
	    data:JSON.stringify({
	    	send_phone: send_phone,
	    	recv_phone: recv_phone,
	    	subject: subject,
	    	content: content
	    }),
	    success: function(data) {
            console.log(data);
	    }
	})
}
function openDaeriPopup(idx, call_type, to_state) {
	// window.open("/cms/point/popup/corpListPopup", "asd", "status=1,width=530,height=90");

	var height = call_type == 0 ? 807 : 880;
	console.log(call_type + "D");
	if(typeof to_state === 'undefined') {
		to_state = '';
	}
	if(typeof corpPopup === "undefined" || corpPopup.closed) {
		corpPopup = window.open("/partner/popup/chauffeurPopup?idx=" + idx +"&to_state=" + to_state, "chauffeurPopup", "status=1,width=615,height="+height);
	}
	else {
        corpPopup.close();
        corpPopup = window.open("/partner/popup/chauffeurPopup?idx=" + idx +"&to_state=" + to_state, "chauffeurPopup", "status=1,width=615,height=807"+height);
	}
}
function openTakPopup(idx, to_state) {
	// window.open("/cms/point/popup/corpListPopup", "asd", "status=1,width=530,height=90");

	if(typeof to_state === 'undefined') {
		to_state = '';
	}
	if(typeof corpPopup === "undefined" || corpPopup.closed) {
		corpPopup = window.open("/partner/popup/takPopup?idx=" + idx +"&to_state=" + to_state, "takPopup", "status=1,width=615,height=807");
	}
	else {
        corpPopup.close();
        corpPopup = window.open("/partner/popup/takPopup?idx=" + idx +"&to_state=" + to_state, "takPopup", "status=1,width=615,height=807");
	}
}
// 초기화 함수
function initialize() {
	// datepicker
	validate.dateToToday($('input[name=start_date]'))
	$('input[type=date]').datepicker({
		format: 'yyyy-mm-dd'
	});
	// 달력 버튼 클릭시 datepicker show

	setInterval(loadList, 5000);
}
$('.date_addon').click(function(e) {
	$(this).parent().find('input[type=date]').datepicker('show')
})
$('.inquery_btn').on('click', function(e) {
	search_option.start_date 	= document.querySelector('input[name=start_date]').value;
	search_option.end_date 		= document.querySelector('input[name=end_date]').value;
	search_option.payment_type 	= combineSearchData('payment_type');
	search_option.state 		= combineSearchData('state');
	search_option.call_type 	= combineSearchData('call_type');
	search_option.type 			= combineSearchData('type');


	search_option.user_name 			= document.getElementById("user_name").value;
	search_option.user_phone_number 	= document.getElementById("user_phone_number").value;
	search_option.driver_name 			= document.getElementById("driver_name").value;
	search_option.driver_phone_number 	= document.getElementById("driver_phone_number").value;
	search_option.corp_name 			= document.getElementById("corp_name").value;
	search_option.title 				= document.getElementById("title").value;
	search_option.u_title 				= document.getElementById("u_title").value;
	search_option.t_title 				= document.getElementById("t_title").value;
	loadList();
})
$('.searchTxt').keypress(function(e) {
	if(e.keyCode == 13) {
		$('.inquery_btn').click();
	}
})
$("#__GRID").on('rowclick', function (event) {
    if (!event.args.rightclick) 
    	return false;

    $("#__GRID").jqxGrid('selectrow', event.args.rowindex);

	var data = $('#__GRID').jqxGrid('getrowdata', event.args.rowindex);
    var scrollTop = $(window).scrollTop();
    var scrollLeft = $(window).scrollLeft();

    
// <li id="STATE_FIND_DRIVER" data-state='1000'>접수 상태</li>
// <li id="STATE_CONNECTED_DRIVER" data-state='1005'>배차</li>
// <li id="STATE_CHANGE_DRIVER" data-state='1006'>재배차</li>
// <li id="STATE_COMPLETE" data-state='1015'>운행 완료(결제)</li>
// <li id="STATE_CANCEL" data-state='1060'>접수 취소</li>
// <li id="NEW_ORDER" data-state=''>오더 생성</li>
    getState(data.idx, function(state_data) {
    	$("#context_menu").jqxMenu('close')

    	$("#context_menu").jqxMenu('disable', 'STATE_FIND_DRIVER', true);	
    	$("#context_menu").jqxMenu('disable', 'STATE_CONNECTED_DRIVER', true);	
		$("#context_menu").jqxMenu('disable', 'STATE_CHANGE_DRIVER', true);	
		$("#context_menu").jqxMenu('disable', 'STATE_COMPLETE', true);	
		$("#context_menu").jqxMenu('disable', 'STATE_CANCEL', true);	
		$("#context_menu").jqxMenu('disable', 'NEW_ORDER', true);	
    	switch(state_data) {
    		case STATE_FIND_DRIVER :
    			$("#context_menu").jqxMenu('disable', 'STATE_CONNECTED_DRIVER', false);
    			$("#context_menu").jqxMenu('disable', 'STATE_CANCEL', false);	
    		break;
			case STATE_CONNECTED_DRIVER :
			case STATE_CHANGE_DRIVER :
			case STATE_START_DRIVING :
			case STATE_END_DRIVING 	: 	
				$("#context_menu").jqxMenu('disable', 'STATE_FIND_DRIVER', false);	
				$("#context_menu").jqxMenu('disable', 'STATE_CHANGE_DRIVER', false);	
				$("#context_menu").jqxMenu('disable', 'STATE_COMPLETE', false);	
				$("#context_menu").jqxMenu('disable', 'STATE_CANCEL', false);	
			break;
			case STATE_COMPLETE : 
				$("#context_menu").jqxMenu('disable', 'NEW_ORDER', false);	
			break;
			case STATE_CANCEL :		
			case STATE_CANCEL_BY_ADMIN :
			case STATE_CANCEL_BY_DRIVER :
				$("#context_menu").jqxMenu('disable', 'STATE_FIND_DRIVER', false);
				$("#context_menu").jqxMenu('disable', 'STATE_CONNECTED_DRIVER', false);	
			break;
    	}
		$('#context_menu').jqxMenu('open', parseInt(event.args.originalEvent.clientX) + 5 + scrollLeft, parseInt(event.args.originalEvent.clientY) + 5 + scrollTop);      	
		current_row_index = data.idx;
		current_row_call_type = data.call_type
    })
    return false;
});
$('#__GRID').on('rowdoubleclick', function (event) 
{ 
    var args = event.args;
    // row's bound index.
    var boundIndex = args.rowindex;
    // row's visible index.
    var visibleIndex = args.visibleindex;
    // right click.
    var rightclick = args.rightclick; 
    // original event.
    var ev = args.originalEvent;

    var data = $('#__GRID').jqxGrid('getrowdata', boundIndex);

    if(rightclick) return false;

    switch(data.type) {
    	case 1: //대리운전
		    isAllocated(data.idx, function() {
		    	allocate(data.idx, function() {
		    		openDaeriPopup(data.idx, data.call_type)
		    	})
		    }, function() {
		    	alert("이미 다른사람에게 배정된 요청입니다.");
		    })
    	break;
    	case 2: //택송
		    isAllocated(data.idx, function() {
		    	allocate(data.idx, function() {
		    		openTakPopup(data.idx)
		    	})
		    }, function() {
		    	alert("이미 다른사람에게 배정된 요청입니다.");
		    })
    	break;
    }
});
$('#context_menu').on('itemclick', function (event) {
    var element = event.args;
    var state = Number($(element).attr('data-state'));
	console.log(current_row_index + " 의 상태를 " + state + "로바꿈");
	console.log(state == STATE_CONNECTED_DRIVER);

	isAllocated(current_row_index, function() {
		if(state == STATE_CONNECTED_DRIVER || state == STATE_CHANGE_DRIVER) {
			openDaeriPopup(current_row_index, current_row_call_type, state);
		}
		else {
			updateState(current_row_index, state, function() {
				alert("상태가 변경되었습니다.");
			});
		}
	}, function() {
		alert("이미 다른사람에게 배정된 요청입니다.")
	})
});
$('#context_menu').on('closed', function (event) {
	// if(current_row_index != null) {
	// 	free(current_row_index, function() {
	// 		current_row_index = null;
	// 	})
	// }
});
$('#excel').on('click', function(e) {
	location.href = "/partner/excel?param=" + encodeURI(JSON.stringify(search_option));
})
initialize();
loadList();

document.oncontextmenu = document.body.oncontextmenu = function() {return false;}
</script>
	</body>
</html>