<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  trimDirectiveWhitespaces="true" %>
<%@include file="/WEB-INF/jsp/include/taglib.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>사용자 조회</title>

	<link rel="stylesheet" href="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/jqwidget/styles/jqx.base.css" type="text/css" />
	<link rel="stylesheet" href="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/jqwidget/styles/jqx.arctic.css" type="text/css" />
	<script src="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/jquery-ui-1.11.4.custom/external/jquery/jquery.js"></script>
</head>
<body>
	<div id="_GRID" style="position: relative; z-index: 0;"></div>
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
	var req_id = '<%=request.getParameter("req_id")%>'
	var cor_idx = '<%=request.getParameter("cor_idx")%>'
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
	var data_columns = [ 
			 {"width":"30"  ,  "renderer": columnsrenderer ,   "datafield":"upload_idx"                  ,"text":"NO"					,"type":"string","name":"upload_idx", "cellsalign": 'center', 'hidden': true}
			,{"width":"30"  ,  "renderer": columnsrenderer ,   "datafield":"idx"                  ,"text":"NO"					,"type":"string","name":"idx", "cellsalign": 'center', "cellsrenderer":orderNumberIndexrenderer}
			,{"width":"60"  ,  "renderer": columnsrenderer ,   "datafield":"cust_no"                  ,"text":"사번"					,"type":"string","name":"cust_no", "cellsalign": 'center'}
			,{"width":"60"  ,  "renderer": columnsrenderer ,   "datafield":"cust_name"                  ,"text":"이름"					,"type":"string","name":"cust_name"}
			,{"width":"100"  ,  "renderer": columnsrenderer ,   "datafield":"use_date"                  ,"text":"접수일"					,"type":"string","name":"use_date", "cellsalign": 'center'}
			,{"width":"80"  ,  "renderer": columnsrenderer ,   "datafield":"use_time"                  ,"text":"접수시간"					,"type":"string","name":"use_time", "cellsalign": 'center'}
			,{"width":"90"  ,  "renderer": columnsrenderer ,   "datafield":"start_addr"                  ,"text":"출발지"					,"type":"string","name":"start_addr"}
			,{"width":"120"  ,  "renderer": columnsrenderer ,   "datafield":"route_addr"                  ,"text":"경우지"					,"type":"string","name":"route_addr"}
            ,{"width":"120"  ,  "renderer": columnsrenderer ,   "datafield":"waiting_time"                  ,"text":"대기시간"                 ,"type":"string","name":"waiting_time"}
			,{"width":"70"  ,  "renderer": columnsrenderer ,   "datafield":"finish_addr"                  ,"text":"도착지"					,"type":"string","name":"finish_addr"}
			,{"width":"100"  ,  "renderer": columnsrenderer ,   "datafield":"cost"                  ,"text":"기본료"					,"type":"string","name":"cost", "cellsrenderer": numberrender,  "cellsalign": "right"}
			,{"width":"100"  ,  "renderer": columnsrenderer ,   "datafield":"add_cost"                  ,"text":"추가료"					,"type":"string","name":"add_cost", "cellsrenderer": numberrender,  "cellsalign": "right"}
			,{"width":"100"  ,  "renderer": columnsrenderer ,   "datafield":"add_tax"                  ,"text":"콜수수료"					,"type":"string","name":"add_tax", "cellsrenderer": numberrender,  "cellsalign": "right"}
			,{"width":"100"  ,  "renderer": columnsrenderer ,   "datafield":"total"                  ,"text":"합계"					,"type":"string","name":"total", "cellsrenderer": numberrender,  "cellsalign": "right"}
			,{"width":"70"  ,  "renderer": columnsrenderer ,   "datafield":"driver_id"                  ,"text":"기사ID"					,"type":"string","name":"driver_id"}
			,{"width":"70"  ,  "renderer": columnsrenderer ,   "datafield":"driver_name"                  ,"text":"기사성명"					,"type":"string","name":"driver_name"}
			,{"width":"100"  ,  "renderer": columnsrenderer ,   "datafield":"memo"                  ,"text":"비고"					,"type":"string","name":"memo"}
			,{"width":"122"  ,  "renderer": columnsrenderer ,   "datafield":"phone_number"                  ,"text":"고객전화번호"					,"type":"string","name":"phone_number", "cellsalign": 'center'}
			,{"width":"100"  ,  "renderer": columnsrenderer ,   "datafield":"type"                  ,"text":"서비스구분"					,"type":"string","name":"type"}
			,{"width":"100"  ,  "renderer": columnsrenderer ,   "datafield":"corp_name"                  ,"text":"법인명"					,"type":"string","name":"corp_name"}
];  

	var gridDataSource = {
        "cache": false,
        "type": 'post',
        "url": '//${cms_api_domain}/1.0/sub_cor/history/result_history',
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
    $("#_GRID").jqxGrid( {
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
	function loadGrid() {
		var dataadapter = new $.jqx.dataAdapter(gridDataSource, {
	        'beforeSend' : function (jqXHR, settings) {
	            // TODO scyun AJAX 호출시 헤더값을 숨기는 방안 확인 필요함... 
	            // 전송 전 API 에서 검증하는 api-key 를 설정한다
	            jqXHR.setRequestHeader("x-api-key", "SpammerGoHome");
	        },
	         'formatData' : function(data) {
	             // 여기서 검색필드값을 추가해 전달한다.
	             // 

            	return  JSON.stringify( {
            							  'req_id'		   : req_id
            							 ,'cor_idx'		   : cor_idx
								    	 ,'page'           : data.pagenum + 1
	                                     ,'perPage'        : data.pagesize
	                                    });
	            
	        },
	         'loadError' : function(jqXHR, status, error) {

	        },
	        'downloadComplete' : function(edata, textStatus, jqXHR) {
	            // http 상태코드가 2XX 일 경우 수행됨..
	            console.log(edata);
	           // $("#_GRID").jqxGrid('hidecolumn', 'idx');
	        },
	        'beforeLoadComplete' : function() {
	            //
	        }
	    });
	    $("#_GRID").jqxGrid( { source: dataadapter});
	}
	loadGrid();

	</script>
</body>
</html>