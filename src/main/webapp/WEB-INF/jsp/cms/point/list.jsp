<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  trimDirectiveWhitespaces="true" %>
<%@include file="/WEB-INF/jsp/include/taglib.jsp" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko">
	<common:head>
		<link rel="stylesheet" href="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/jqwidget/styles/jqx.base.css" type="text/css" />
		<link rel="stylesheet" href="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/jqwidget/styles/jqx.arctic.css" type="text/css" />
		<title>ParkingOn ___Admin</title>
		<style type="text/css" class="style">
			input[type=radio] { display: none; }
			* { margin:0; padding:0; box-sizing: border-box; }
			*:after { content: ""; display: block; clear:both; }
			
			html, body { width: 100%; height: 100%; }

			.search_modal { background-color: #ddd; }

			li { list-style: none; }

			.search_container { width: 580px; height: 500px; padding: 30px; text-align: center; }

			.search_input { width: 350px; height: 30px; padding: 5px; }
			.m_button { width: 70px; height: 30px; border:0; background-color: #3498db; float: right; color:#fff; transition: .3s; font-size: 14px ! important; }

			.m_button:hover { background-color: #1565C0; }
			
			.contents { padding-top: 20px; }

			.list_header { background-color: #3498db; }
			.list_header li { color:#fff; }

			.list_content { border-bottom: 1px solid #ddd; cursor:pointer; }

			.element { width: 100%;}
			.element li { float:left; text-align: center; height: 25px; line-height: 25px; border-left: 1px solid #ddd; text-overflow: ellipsis; overflow: hidden; }

			.element li:nth-child(1) { width: 40%; }
			.element li:nth-child(2) { width: 20%; }
			.element li:nth-child(3) { width: 40%; border-right: 1px solid #ddd; }

			.selected { background-color: #ddd; }
			.selected li { border-color: #fff; }

			.btn_wrap { width: 150px; font: 0; margin: 20px auto;  }
			.btn_wrap button:nth-child(1) { float: left; }
			.btn_wrap button:nth-child(2) { float: right; }
			
			.pagination { display: inline-block; }

			.pagemove { display: inline-block; width: 20px; height: 30px; background-color: #ddd; margin: 5px; line-height: 30px;     text-decoration: none; color: #000; }
			.cur_page { background-color: #3498db; color:#fff ! important; }
			

			#all:checked ~ .s_all { background-color: #1565C0; }
			#success:checked ~ .s_success { background-color: #1565C0; }
			#fail:checked ~ .s_fail { background-color: #1565C0; }

			.point_container { width: 530px; height: 330px; padding: 30px; font-size:0; margin-bottom: 10px; }

			.data { width: calc(100% / 3 - 1px); height: 100px; font-size: 14px; float:left; }
			.data_title { width: 100%; height: 50px; text-align: center; }
			.data_contents { width: 100%; height: 50px; text-align: center; }


			#memo_submit { width: 100%; height: 100%; padding: 30px; }
			input[name=memo] { width: 80%; height: 30px; }


			input[name=use_point], input[name=cash], input[name=supply_point] { width: 120px; }

			.memomodi { float: right; }
			/*.memomodi:hover { background-color: #000; color: #fff; }*/
	
			.data_title { width: 100%; height: 50px; background-color: #ddd; padding-top: 20px; }
			.data_contents { width: 100%; height: 50%; padding-top: 15px; }
			/*.data_title:nth-child(3n-1) { border: 0; }*/

			.data { border: 1px solid #000; }

			input[type=number]::-webkit-inner-spin-button, 
			input[type=number]::-webkit-outer-spin-button { 
			  -webkit-appearance: none; 
			  margin: 0; 
			}
		</style>
	</common:head>
	<common:body>
	<script>mixpanel.track("cms-point list");</script>
<!-- begin #content -->
<div id="content" class="content">
	<!-- begin breadcrumb -->
	<ol class="breadcrumb pull-right">
        	<li class="active"><a href="/cms/corp/list?mainmenu=m1&submenu=s1">HOME</a></li>
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
                <form class="inquiry" action="#">
				<div class="panel-body">
					<div class="col-md-2">법인조회 :</div>
					<div class="col-md-3"><input id="corp" type="text"></div>
					<div class="col-md-3">
						<input class="btn btn-primary" type="submit" value="조회">
					</div>
				</div>
				</form>
				<div class="panel-body">
					<div class="col-md-3">법인명 : <span id="name"></span></div>
					<div class="col-md-3">사업자 등록번호 : <span id="reg_number"></span></div>
				</div>
				<div class="panel-body">
					<div class="col-md-3">잔여 포인트 : <span id="point"></span></div>
					<div class="col-md-3">파킹온 사용 포인트 : <span id="used_point"></span></div>
				</div>
				<div class="panel-body">
					<div class="col-md-3">
						<input type="radio" name="status" id="all" value="-1" checked>
						<input type="radio" name="status" id="success" value="0"/>
						<input type="radio" name="status" id="fail" value="1"/>
						<label class="btn btn-primary status s_all" for="all" disabled="disabled">전체</label>
						<label class="btn btn-primary status s s_success" for="success" disabled="disabled">정상</label>
						<label class="btn btn-primary status s_fail" for="fail" disabled="disabled">실패</label>
					</div>
					<div class="col-md-9 text-right">
						<button class="btn btn-primary" id="point_minus" disabled>포인트 차감</button>
						<button class="btn btn-primary" id="excel" disabled>엑셀다운로드</button>
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
				<div class="panel-body result">
					<span class="total"></span>
					<span class="rest"></span>
					<!-- 추후 추가예정 -->
					<!-- <button class="btn btn-primary t_history" style="margin-top: 10px;" disabled="disabled">이용 내역보기</button> -->
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

<!-- 포인트 차감 신청 팝업 -->
<div class="point_modal" title="포인트 차감 신청" style="display: none">
	<head>
		<title>포인트 차감 신청</title>
	</head>
	<body>
		<div class="point_container">
			<div class="data">
				<div class="data_title">
					법인명
				</div>
				<div class="data_contents p_corp_name">
					contents
				</div>
			</div>
			<div class="data">
				<div class="data_title">
					사업자등록번호
				</div>
				<div class="data_contents p_reg_num">
					
				</div>
			</div>
			<div class="data">
				<div class="data_title">
					잔여포인트
				</div>
				<div class="data_contents p_rest_point">
					contents
				</div>
			</div>
			<div class="data">
				<div class="data_title">
					공급가
				</div>
				<div class="data_contents p_price">
					<input type="number" name="supply_point">
				</div>
			</div>
			<div class="data">
				<div class="data_title">
					부가세(VAT)
				</div>
				<div class="data_contents p_vat">
					0
				</div>
			</div>
			<div class="data">
				<div class="data_title">
					합계금액
				</div>
				<div class="data_contents p_final_price">
					0
				</div>
			</div>
			<div class="data">
				<div class="data_title">
					포인트 차감신청 금액
				</div>
				<div class="data_contents p_use_point">
					<input type="number" class="minus" name="use_point">
				</div>
			</div>
			<div class="data">
				<div class="data_title">
					현금결제 금액
				</div>
				<div class="data_contents p_cash">
					<input type="number" class="minus" name="cash">
				</div>
			</div>
			<div class="data">
				<div class="data_title">
					남은 금액
				</div>
				<div class="data_contents p_rest_price">
					0
				</div>
			</div>
		</div>
			<div class="btn_wrap">
				<button class="m_button" id="p_ok">확인</button>
				<button class="m_button" id="p_cancle">취소</button>
			</div>
	</body>
</div>
<div class="memo_modal" title="메모 변경" style="display: none">
	<head>
		<title>메모 변경</title>
	</head>
	<body>
		<form action="#" id="memo_submit">
			<input type="text" name="memo">
			<button type="submit" class="m_button">완료</button>
		</form>
	</body>
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
//메모 수정 팝업
function openMemoPopup(idx, callback) {
	var data = $("#__GRID").jqxGrid('getrowdata', idx);
	idx = data.idx;

	if(typeof memoPopup === "undefined" || memoPopup.closed) {
		memoPopup = window.open("", "memoPopup", "status=1,width=530,height=90");
	    memoPopup.document.write("<style>" + $('.style').html() + "</style>");
	    memoPopup.document.write($('.memo_modal').html());
	    memoPopup.document.write('<script>' + $('.i').html() + "</scrip" + "t>");
	}
	else {
		try 
		{
            memoPopup.document;
        }
        catch (e) {
            memoPopup = window.open(url, "_blank");
        }
        if (navigator.appName == 'Microsoft Internet Explorer') {
            memoPopup.close();
            memoPopup = window.open(url, "_blank");
        }
        else {
            memoPopup.focus();
        }
	}
	function event() {
		$(memoPopup.document).find('#memo_submit').submit(function(e) {
			e.preventDefault();

			var text = $(memoPopup.document).find('input[name=memo]').val();

			modify(text);
		})
	}
	function modify(memo) {
		$.ajax({
		    url: '//${cms_api_domain}/1.0/admin/point/memo_modify',
		    type: 'post',
		    dataType: 'json',
		    contentType: 'application/json',
		    beforeSend: function(jqXHR, setting) {
		            jqXHR.setRequestHeader('x-api-key', 'SpammerGoHome');
		    },
		    data:JSON.stringify({
		    	login_id: '${loginId}',
		    	cor_idx: 1,
		    	idx: idx,
		    	memo: memo
		    }),
		    success: function(data) {
		    	if(data.status == 200) {
		    		var text = $(memoPopup.document).find('input[name=memo]').val();
		    		callback(text);
		    		memoPopup.close();
		    	}
		    	else {
		    		alert(data.status);
		    		memoPopup.close();
		    	}
		    }
		})
	}
	function initialize() {
		$(memoPopup.document).find('input[name=memo]').val(data.memo);
		validate.addElement($(memoPopup.document).find('input[name=memo]'), {kor: true, eng: true, number: true, maxLength: 20});
	}
	initialize();
	event();
}
// 포인트 차감 팝업
function openPointPopup(idx, callback) {
	var data = null;
	if(typeof pointPopup === "undefined" || pointPopup.closed) {
		pointPopup = window.open("", "pointPopup", "status=1,width=530,height=450");
	    pointPopup.document.write("<style>" + $('.style').html() + "</style>");
	    pointPopup.document.write($('.point_modal').html());
	}
	else {
		try 
		{
            pointPopup.document;
        }
        catch (e) {
            pointPopup = window.open(url, "_blank");
        }
        if (navigator.appName == 'Microsoft Internet Explorer') {
            pointPopup.close();
            pointPopup = window.open(url, "_blank");
        }
        else {
            pointPopup.focus();
        }
	}
	function loadData() {
		$.ajax({
		    url: '//${cms_api_domain}/1.0/admin/point/point_data',
		    type: 'post',
		    dataType: 'json',
		    contentType: 'application/json',
		    beforeSend: function(jqXHR, setting) {
		            jqXHR.setRequestHeader('x-api-key', 'SpammerGoHome');
		    },
		    data:JSON.stringify({
		    	idx:idx
		    }),
		    success: function(m_data) {
		    	data = m_data.body;
		    	data.result = 0;
		    	console.log(data.result);
		    	initialize();
		    }
		})
	}
	function initialize() {

		// if(data.amount == 0) {
		// 	pointPopup.alert("차감할게 없어요");
		// 	pointPopup.close();
		// }

		$(pointPopup.document).find('.p_corp_name').text(data.name);
		$(pointPopup.document).find('.p_reg_num').text(data.reg_num);
		$(pointPopup.document).find('.p_rest_point').text(data.point.toLocaleString());
		// $(pointPopup.document).find('.p_price').text(data.amount.toLocaleString());
		// $(pointPopup.document).find('.p_vat').text(data.vat.toLocaleString());
		// $(pointPopup.document).find('.p_final_price').text(data.result.toLocaleString());
		// $(pointPopup.document).find('.p_use_point').text();
		// $(pointPopup.document).find('.p_cash').text();
		// $(pointPopup.document).find('.p_rest_price').text(data.result.toLocaleString());
	}
	function event() {

		$(pointPopup.document).find('input').bind('keypress keyup', function(e) {
			var supply_point = Number($(pointPopup.document).find('input[name=supply_point]').val())
			var point = Number($(pointPopup.document).find('input[name=use_point]').val());
			var cash = Number($(pointPopup.document).find('input[name=cash]').val())

			var vat = Math.round(supply_point/100*10).toLocaleString();


			$(pointPopup.document).find('.p_final_price').text((supply_point+Math.round(supply_point/100*10)).toLocaleString());
			$(pointPopup.document).find('.p_vat').text(vat);
			$(pointPopup.document).find('.p_rest_price').text(((supply_point+Math.round(supply_point/100*10)) - (point+cash)).toLocaleString());
		});
		$(pointPopup.document).find('#p_cancle').on('click', function(e) {
			pointPopup.close();
		})
		$(pointPopup.document).find('#p_ok').on('click', function(e) {
			if(Number($(pointPopup.document).find('input[name=use_point]').val().replace(/\,/gi,"")) > Number($(pointPopup.document).find('.p_rest_point').text())) {
				pointPopup.alert("포인트차감액을 확인해주세요.");
			}
			else if(Number($(pointPopup.document).find('.p_rest_price').text().replace(/\,/gi,"")) != 0) {
				pointPopup.alert("남은금액이 0일 경우에만 신청 가능합니다.");
			}
			else {
				callback(
					data.point,
					Number($(pointPopup.document).find('input[name=supply_point]').val()),
					Number($(pointPopup.document).find('input[name=use_point]').val()),
					Number($(pointPopup.document).find('input[name=cash]').val()),
					data.reg_num
				);
				pointPopup.close();
			}
		})
	}

	loadData();
	event();
}
// 법인조회 팝업
function openCorpPopup() {
	// window.open("/cms/point/popup/corpListPopup", "asd", "status=1,width=530,height=90");
	if(typeof corpPopup === "undefined" || corpPopup.closed) {
		corpPopup = window.open("/popup/corpListPopup?type=1", "corpPopup", "status=1,width=600,height=610");
	}
	else {
        corpPopup.close();
        corpPopup = window.open("/popup/corpListPopup?type=1", "corpPopup", "status=1,width=600,height=610");
	}
}


// ready
var idx = null;

var columnsrenderer = function (value) {
	    return   '<div style="text-align: center; margin-top: 30px;">' + value + '</div>';
}
var columns2renderer = function (value) {
	    return   '<div style="text-align: center; margin-top: 13px;">' + value + '</div>';
}
var headerRenderer = function(value)
{
	return  '<table style="width:100%;height:100%;"><tr><td style="text-align:center;vertical-align: middle;">'+value+'</td></tr></table>';// +value+ '</div>' ;
}
var numberrender = function(row, columnfield, value, defaulthtml, columnproperties) {
	var regex = /<(.*?)>(.*?)<(.*?)>/g;

	var reg_arr = regex.exec(defaulthtml);
	var result =  defaulthtml.replace(reg_arr[2], value.toLocaleString());
	return result;
}
var momerender = function(row, columnfield, value, defaulthtml, columnproperties) {
	var result = "";

	if(value.trim() == "") {
		var regex = /<(.*?)><(.*?)>/g;

		var reg_arr = regex.exec(defaulthtml);
		result = defaulthtml.replace("><", ">" + value + '<button class="btn btn-primary btn-xs memomodi" data-idx="' + row + '">등록</button><')
	}
	else {
		var regex = /<(.*?)>(.*?)<(.*?)>/g;

		var reg_arr = regex.exec(defaulthtml);
		result = defaulthtml.replace(reg_arr[2], value + '<button class="btn btn-primary btn-xs memomodi" data-idx="' + row + '">등록</button>')
	}
	return result;
}
var historyrenderer = function(row, columnfield, value, defaulthtml, columnproperties) {
	var regex = /<(.*?)><(.*?)>/g;

	var reg_arr = regex.exec(defaulthtml);
	result = defaulthtml.replace("><", ">" + value + '<button class="btn btn-primary btn-xs history" data-idx="' + row + '">내역보기</button><')
	return result;
}
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
var data_columns = [ 
			 {"width":"30"  ,  "renderer": columnsrenderer ,   "datafield":"idx"                  ,"text":"NO"					,"type":"string","name":"idx", "cellsalign": 'center', "hidden": true}
		   ,{"width":"30"  ,  "renderer": columnsrenderer ,   "datafield":"no"                  ,"text":"NO"					,"type":"string","name":"no", "cellsalign": 'center', "cellsrenderer":orderNumberIndexrenderer}
           , {"width":"200"  ,	"renderer": columnsrenderer ,   "datafield":"date"                 ,"text":"차감요청일시"		,"type":"string","name":"date","cellsalign": 'center'}
           , {"width":"150"  ,	"renderer": columnsrenderer ,   "datafield":"name"             ,"text":"법인명"				,"type":"string","name":"name"}
           , {"width":"120"  ,	"renderer": columnsrenderer ,   "datafield":"amount"             ,"text":"합계금액"			,"type":"string","name": "amount", "cellsrenderer": numberrender, "cellsalign": "right"}
           , {"width":"80"  ,	"renderer": columnsrenderer ,   "datafield":"vat"           ,"text":"부가세VAT"			,"type":"string","name": "vat", "cellsrenderer": numberrender, "cellsalign": "right"}
           , {"width":"80"   ,	"renderer": columns2renderer ,   "datafield":"result"        ,"text":"금액합계"		,"columngroup": 'supply_point'	,"type":"string","name": "result", "cellsrenderer": numberrender, "cellsalign": "right"}
           , {"width":"80"   ,	"renderer": columns2renderer ,   "datafield":"point"        ,"text":"포인트차감액"	,"columngroup": 'supply_point'		,"type":"string","name": "point", "cellsrenderer": numberrender, "cellsalign": "right"}
           , {"width":"80"  ,	"renderer": columns2renderer ,   "datafield":"cash"         ,"text":"현금결제금액"	,"columngroup": 'supply_point'	,"type":"string","name": "cash", "cellsrenderer": numberrender, "cellsalign": "right"}
           , {"width":"50"  ,	"renderer": columnsrenderer ,   "datafield":"status"  ,"text":"상태"				,"type":"string","name": "status"}
           , {"width":"500"  ,	"renderer": columnsrenderer ,   "datafield":"memo"         ,"text":"메모"				,"type":"string","name": "memo", "cellsrenderer": momerender}
           // 후추 추가예정
           // , {"width":"100"  ,	"renderer": columnsrenderer ,   "datafield":"history"         ,"text":"내역보기"				,"type":"string","name": "history", "cellsrenderer": historyrenderer, "cellsalign": "center"}
];
var gridDataSource = {
    "cache": false,
    "type": 'post',
    "url": '//${cms_api_domain}/1.0/admin/point/point_history',
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
    columnsheight:40//헤더 컬럼의 크기 
    , altrows : true   //줄마다 다른 색 넣기 
    , columns: data_columns
    ,  columngroups:[
                                {text:'공급가' ,align:'center',name:'supply_point' }
                    ]
});

function loadData(m_idx) {
	idx = m_idx;
	$('#point_minus').removeAttr("disabled");
	$('#excel').removeAttr("disabled");
	$('.status').removeAttr("disabled");
	$('.t_history').removeAttr("disabled");
	loadCorpData();
	loadGrid();
}
function loadGrid() {
	var dataadapter = new $.jqx.dataAdapter(gridDataSource, {
        'beforeSend' : function (jqXHR, settings) {
            // TODO scyun AJAX 호출시 헤더값을 숨기는 방안 확인 필요함... 
            // 전송 전 API 에서 검증하는 api-key 를 설정한다
            jqXHR.setRequestHeader("x-api-key", "SpammerGoHome");
        },
         'formatData' : function(data) {
             // 여기서 검색필드값을 추가해 전달한다. 
            return  JSON.stringify( {
            						 'idx'			  : idx
                                    ,'page'           : data.pagenum + 1
                                    ,'perPage'        : data.pagesize
                                    ,'filter'		  : $('input[name=status]:checked').val()
                                    });
        },
         'loadError' : function(jqXHR, status, error) {

        },
        'downloadComplete' : function(edata, textStatus, jqXHR) {
            // http 상태코드가 2XX 일 경우 수행됨..
            var sum = 0;
            var amount = 0;
            for(var i in edata.body.list) {
            	sum +=edata.body.list[i].point;
            	amount += edata.body.list[i].amount;
            }
            $('.total').text("포인트 차감액 합계 : " + sum.toLocaleString());

            console.log(edata);
        },
        'beforeLoadComplete' : function() {
            //
        }
    });
    $("#__GRID").jqxGrid( { source: dataadapter});
}
function loadCorpData() {
	$.ajax({
	    url: '//${cms_api_domain}/1.0/admin/point/corp',
	    type: 'post',
	    dataType: 'json',
	    contentType: 'application/json',
	    beforeSend: function(jqXHR, setting) {
	        jqXHR.setRequestHeader('x-api-key', 'SpammerGoHome');
	    },
	    data:JSON.stringify({idx: idx}),
	    success: function(data) {
	    	console.log(data);

	    	if(data.status != 200) {
	    		alert(data.messageDesc);
	    		return;
	    	}
	    	$('#name').text(typeof data.body.name == "undefined" ? "없음" : data.body.name)
	    	$('#reg_number').text(typeof data.body.reg_number == "undefined" ? "없음" : data.body.reg_number)
	    	$('#point').text(typeof data.body.point == "undefined" ? "0" : data.body.point.toLocaleString());
	    	$('#used_point').text(typeof data.body.used_point == "undefined" ? "0" : data.body.used_point.toLocaleString())
            // $('.rest').text("잔여 차감액 합계 : " + (typeof data.body.result == "undefined" ? 0 : data.body.result.toLocaleString()));
	    }
	})
}
function pointProcess(cur_point, supply_point, use_point, use_cash, reg_num) {
	$.ajax({
	    url: '//${cms_api_domain}/1.0/admin/point/point_process',
	    type: 'post',
	    dataType: 'json',
	    contentType: 'application/json',
	    beforeSend: function(jqXHR, setting) {
	            jqXHR.setRequestHeader('x-api-key', 'SpammerGoHome');
	    },
	    data:JSON.stringify({
	    	login_id: '${loginId}',
	    	cor_idx: idx,
	    	supply_point: supply_point,
	    	rest_point: cur_point,
	    	point: use_point,
	    	cash: use_cash,
	    	reg_num: reg_num
	    }),
	    success: function(data) {
	    	console.log(data);

	    	if(data.status != 200) {
	    		alert(data.messageDesc);
	    		return;
	    	}

	    	loadCorpData();
	    	loadGrid();
	    }
	})
}

// 법인 선택
$('.inquiry').on('submit', function(e) {
	e.preventDefault();
	openCorpPopup();
})
$('#corp').on('click', function(e) {
	openCorpPopup();
})
// 상태별로 불러오기 전체, 성공, 실패
$('input[name=status]').on('change', function(e) {
	loadGrid();
})
// 포인트 차감 버튼
$('#point_minus').on('click', function(e) {
	openPointPopup(idx, pointProcess);
})

$('#excel').on('click', function(e) {
	location.href='/admin/point/point_xlsx?idx=' + idx + "&filter=" + $('input[name=status]:checked').val();
})

// 메모 수정 or 등록 버튼 클릭 이벤트
$(document).on('click', '.memomodi', function(e) {
	var target = $(e.target);

	var idx = target.attr('data-idx')
	openMemoPopup(idx, function(modified) {
		var data =$("#__GRID").jqxGrid('getrowdata', idx);
		var uid = data.uid;

		data.memo = modified;

		$("#__GRID").jqxGrid('updaterow', uid, data);
	})
})
// 내역보기 팝업
$(document).on('click', '.history', function(e) {
	var target = $(e.target);

	var row_idx = target.attr("data-idx");
	var data = $("#__GRID").jqxGrid('getrowdata', row_idx);

	if(typeof corpPopup === "undefined" || corpPopup.closed) {
		corpPopup = window.open("/cms/point/popup/point_history?req_id="+data.idx + "&cor_idx="+idx, "historyPopup", "status=1,width=1500,height=780");
	}
	else {
        corpPopup.close();
        corpPopup = window.open("/cms/point/popup/point_history?req_id="+data.idx + "&cor_idx="+idx, "historyPopup", "status=1,width=1500,height=780");
	}
})
$('.t_history').on('click', function(e) {
	if(typeof corpPopup === "undefined" || corpPopup.closed) {
		corpPopup = window.open("/cms/point/popup/point_history?req_id="+0 + "&cor_idx="+idx, "historyPopup", "status=1,width=1500,height=780");
	}
	else {
        corpPopup.close();
        corpPopup = window.open("/cms/point/popup/point_history?req_id="+0 + "&cor_idx="+idx, "historyPopup", "status=1,width=1500,height=780");
	}
})
// VALIDATE
validate.addElement($('#corp'), {kor: true, number: true, eng: true, space: true, special: true});

</script>
</html>