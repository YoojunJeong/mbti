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
    <script>mixpanel.track("cor-user list");</script>
<!-- begin #content -->
<div id="content" class="content">
	<!-- begin breadcrumb -->
    <ol class="breadcrumb pull-right">
        <li class="active"><a href="/cor/history/period?mainmenu=m4&submenu=s1">HOME</a></li>
        <li class="active"><a href="/cor/user/list?mainmenu=m4&submenu=s4">사용자조회</a></li>

    </ol>
	<h1 class="page-header">사용자조회</h1>
	<!-- begin row -->
	<div class="row">
		<!-- begin col-12 -->
		<div class="col-md-12">
			<div class="panel panel-inverse">
                <div class="panel-heading">
                    <h4 class="panel-title">사용자조회</h4>
                </div>
				
				<form action="#" id="SEARCH_FORM">
                <div class="panel-body">             	
					<div class="form-inline" onsubmit="return false;">
							<label class="col-md-1 control-label">검색구분</label>
							<div class="col-md-2"><input type="text" class="form-control" name="search_txt" placeholder="이름, 사번"></div>
							<div class="col-md-2">
							</div>
							<div class="col-md-6">&nbsp;</div>
							<div class="col-md-1 text-right"><input class="btn btn-primary" href="javascript:;" id="__SEARCH_BTN" value="검색" type="submit"></div>			
					</div>
				</div>
				<div class="panel-body">
					<div class="form-inline" onsubmit="return false;">
						<div class="col-md-11">&nbsp;</div>
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
var today = new Date();

var search_text = '';
var columnsrenderer = function (value) {
	    return   '<div style="text-align: center; margin-top: 13px;">' + value + '</div>';
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
var data_columns = [ 
			{"width":"30"  ,  "renderer": columnsrenderer ,   "datafield":"idx"                  ,"text":"NO"                 ,"type":"string","name":"idx", "cellsalign": 'center', 'hidden': true}
             ,{"width":"30"  ,  "renderer": columnsrenderer ,   "datafield":"no"                  ,"text":"NO"                 ,"type":"string","name":"no", "cellsalign": 'center', "cellsrenderer":orderNumberIndexrenderer}
			,{"width":"195"  ,  "renderer": columnsrenderer ,   "datafield":"123"                  ,"text":"부서"					,"type":"string","name":""}
			,{"width":"195"  ,  "renderer": columnsrenderer ,   "datafield":"nickname"               ,"text":"성함"					,"type":"string","name":"nickname", }
			,{"width":"195"  ,  "renderer": columnsrenderer ,   "datafield":"mon_1"                  ,"text":"직급"					,"type":"string","name":"", }
			,{"width":"195"  ,  "renderer": columnsrenderer ,   "datafield":"no_in_company"                  ,"text":"사번"					,"type":"string","name":"no_in_company", }
            ,{"width":"195"  ,  "renderer": columnsrenderer ,   "datafield":"total"                  ,"text":"이용횟수/고객"                  ,"type":"string","name":"total", }
			,{"width":"195"  ,  "renderer": columnsrenderer ,   "datafield":""                  ,"text":"이용한도"					,"type":"string","name":"limit", }
			,{"width":"195"  ,  "renderer": columnsrenderer ,   "datafield":"phone_number"                  ,"text":"전화번호"					,"type":"string","name":"phone_number", }
			,{"width":"195"  ,  "renderer": columnsrenderer ,   "datafield":"5"                  ,"text":"회사 E-mail"					,"type":"string","name":"", }
];  
var gridDataSource = {
    "cache": false,
    "type": 'post',
    "url": '//${cms_api_domain}/1.0/cor/user/list',
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
                                    ,'page'           : data.pagenum + 1
                                    ,'perPage'        : data.pagesize
                                    ,'cor_idx'		  : '${corIdx}'
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
}

function insertList(data) {
    var html = '';
    var cur;
    var total = 0;
    var classType = '';
    
    for(var i = 0, j = data.list.length; i < j; i++) {
            cur = data.list[i];
            
            i % 2 == 0 ? classType = 'even' : classType = 'odd';
            html += '<tr class="' + classType + '">';
            html += '<td>' + cur.idx + '</td>';
            html += '<td>' + cur.dept + '</td>';
            html += '<td>' + cur.nickname + '</td>';
            html += '<td>' + cur.position + '</td>';
            html += '<td>' + cur.cust_no + '</td>';
            html += '<td>' + cur.total + '</td>';
            html += '<td>' + cur.phone_number + '</td>';
            html += '<td>' + cur.manager_email + '</td>';
            html += '</tr>';
    }

    $('#history_body').empty();
    $('#history_body').append(html);
}
function initialize() {
    $('input[name=search_txt]').val("");
}
$('#SEARCH_FORM').on('submit', function(e) {
    e.preventDefault();
    loadList();
})
$('#__RESET_BTN').on('click', function(e) {
    e.preventDefault();
    initialize()
    loadList();
})
$('#excel').on('click', function(e) {
    e.preventDefault();
    location.href = '/cor/user/list_excel?search_text=' + search_text + "&cor_idx=" + ${corIdx};
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