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
    <script>mixpanel.track("cms-user list");</script>
<!-- begin #content -->
<div id="content" class="content">
    <!-- begin breadcrumb -->
    <ol class="breadcrumb pull-right">
        <li><a href="javascript:;">Home</a></li>
    </ol>
    <h1 class="page-header">사용자조회</h1>
    <!-- begin row -->
    <div class="row">
        <!-- begin col-12 -->
        <div class="col-md-12">
            <div class="panel panel-inverse">
                <div class="panel-heading">
                    <div class="panel-heading-btn">
                        <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>                                              
                    </div>
                    <h4 class="panel-title">사용자조회</h4>
                </div>
                <div class="panel-body">
                    <div id="__GRID" style="position: relative; z-index: 0;"></div>
                </div>
            </div>
        </div>
        <!-- end col-12 -->
    </div>
    <!-- end row -->
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
var today = new Date();

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

var wrapForCell = function(value)
{
    return value  ;
}

var headerRenderer = function(value)
{
    return  '<table style="width:100%;height:100%;"><tr><td style="text-align:center;vertical-align: middle;">'+value+'</td></tr></table>';// +value+ '</div>' ;
}

var columnsrenderer = function (value) {
    return wrapForCell(value);
} 

 var changeUserState = function(rowId, userIdx, state)
 {
	 console.log('userIdx->' + userIdx);
	 console.log('status ->' + status);
	 // 
	 /// /{version}/corporations/c${corIdx}/users
	 // URL, method, inObj, callback
	 var params = {'state': state};
	 
	 PKOAjax.request("//${cms_api_domain}/1.0/corporations/c${corIdx}/users/"+userIdx+"/changeState", "post", params, function(result)
	 {

		 console.log(result);
		 // 성공처리..
		 // 1. 해당 데이터 상태값 변경한 후 
		 // grid refresh 
		 
		 
		 // 1. 변경된 rowdata GET
		 var rowData = $('#__GRID').jqxGrid('getrowdata', rowId);
		 rowData['state'] = state;
		 $('#__GRID').jqxGrid('render');
	 }
	 );

 }
var stateColumnRenderer = function(row, datafield, value, html, cellconfig, rowData)
{

	var html = '';
	if (value == 0 || value == 1)
	{
        html  += '<div style="text-align: center; "><span>심사중</span>&nbsp;<button class="btn btn-xs btn-primary" onclick="changeUserState('+ row + "," +rowData.idx+', 2)" data-user-idx="'+rowData.idx+'">승인</button>&nbsp;<button  class="btn btn-xs btn-primary"  onclick="changeUserState('+ row + "," +rowData.idx+', 3)"  data-user-idx="'+rowData.idx+'">반려</button></div>';
	}
	else if (value ==2 ) // 승인상태 , (대기, 반려만...)
	{
        html  += '<div style="text-align: center; "><span>승인</span>&nbsp;<button  class="btn btn-xs btn-primary"  onclick="changeUserState('+ row + "," +rowData.idx+', 1)" data-user-idx="'+rowData.idx+'">대기</button>&nbsp;<button  class="btn btn-xs btn-primary"  onclick="changeUserState('+ row + "," +rowData.idx+', 3)"  data-user-idx="'+rowData.idx+'">반려</button></div>';
	}
	else  // 반려상태 (대기, 승인만)..
	{
        html  += '<div style="text-align: center; "><span>반려</span>&nbsp;<button  class="btn btn-xs btn-primary"  onclick="changeUserState('+ row + "," +rowData.idx+', 1)" data-user-idx="'+rowData.idx+'">대기</button>&nbsp;<button  class="btn btn-xs btn-primary"  onclick="changeUserState('+ row + "," +rowData.idx+', 2)" data-user-idx="'+rowData.idx+'">승인</button></div>';
	}
	
	var tblHtml = "<table style='height:100%;width:100%;'><tbody><tr><td style='text-align:center;'>"+html+"</td></tr></tbody></table>"
	
	return tblHtml;
		
};

var nameColumnRenderer = function(row, datafield, value, html, cellconfig, rowData)
{
	var html = '<a href="//${php_web_domain}/admin/MemberModify?idx=' + rowData.idx + '&mainmenu=1&submenu=1">'+rowData.nickname+'</a>';

	return '<table style="width:100%;height:100%;"><tr><td style="text-align:left;vertical-align: middle;padding-left:5px;">'+html+'</td></tr></table>' ;
}

var numberrender = function(row, columnfield, value, defaulthtml, columnproperties) {
    var result =  PK_COMN.addComma(value);
    return '<table style="width:100%;height:100%;"><tr><td style="text-align:right;vertical-align: middle;padding-right:5px;">'+result+'</td></tr></table>' ;
};

var phone_number_renderrer = function(row, columnfield, value, defaulthtml, columnproperties) {
	var result = PK_COMN.toPhoneNumber(value);
    return '<table style="width:100%;height:100%;"><tr><td style="text-align:center;vertical-align: middle;">'+result+'</td></tr></table>' ;
}

var data_columns = [ 
   {"width":"30"   ,  "renderer": headerRenderer ,   "datafield":"idx"               ,"text":"NO"           ,"type":"string","name":"idx", "cellsalign": 'center' , "hidden":true }
  ,{"width":"30"   ,  "renderer": headerRenderer ,   "datafield":"NO"                ,"text":"NO"           ,"type":"string","name":"NO",  "cellsalign": 'center' , "cellsrenderer":orderNumberIndexrenderer}
  ,{"width":"80"   ,  "renderer": headerRenderer ,   "datafield":"nickname"          ,"text":"이름"         ,"type":"string","name":"nickname"   , "cellsrenderer": nameColumnRenderer  }
  ,{"width":"120"  ,  "renderer": headerRenderer ,   "datafield":"corpName"          ,"text":"법인명"       ,"type":"string","name":"corpName"     }
  ,{"width":"225"  ,  "renderer": headerRenderer ,   "datafield":"email"             ,"text":"이메일"       ,"type":"string","name":"email"        }
  ,{"width":"135"  ,  "renderer": headerRenderer ,   "datafield":"phone_number"      ,"text":"휴대전화번호" ,"type":"string","name":"phone_number" , "cellsalign":"center" ,"cellsrenderer": phone_number_renderrer}
  ,{"width":"100"  ,  "renderer": headerRenderer ,   "datafield":"car_kind"          ,"text":"차종"         ,"type":"string","name":"car_kind"     }
  ,{"width":"100"  ,  "renderer": headerRenderer ,   "datafield":"car_color"         ,"text":"색상"         ,"type":"string","name":"car_color"    }
  ,{"width":"100"  ,  "renderer": headerRenderer ,   "datafield":"car_number"        ,"text":"차량번호"     ,"type":"string","name":"car_number"   }
  ,{"width":"180"  ,  "renderer": headerRenderer ,   "datafield":"created_at"        ,"text":"가입일시"     ,"type":"string","name":"created_at" , "cellsalign":"center" }
  ,{"width":"100"  ,  "renderer": headerRenderer ,   "datafield":"valet_cnt"         ,"text":"이용횟수"     ,"type":"string","name":"valet_cnt"  , "cellsalign":"right" ,  "cellsrenderer": numberrender }
  ,{"width":"180"  ,  "renderer": headerRenderer ,   "datafield":"state"             ,"text":"상태"         ,"type":"string","name":"state",       "cellsrenderer" : stateColumnRenderer }
];  
var gridDataSource = {
    "cache": false,
    "type": 'post',
    "url": '//${cms_api_domain}/{version}/corporations/c${corIdx}/users',
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
    columnsheight:40 , 
    altrows : true,    //줄마다 다른 색 넣기 
    scrollmode: 'logical',
    pageable: true,
    pagesize: 100,
    virtualmode: true,
    pagesizeoptions: [10,20,50,100],
    rendergridrows: function (params) {
        return params.data;
    },
    columnsresize: true,
    columns: data_columns
});
function loadList() {
    var dataadapter = new $.jqx.dataAdapter(gridDataSource, {
        'beforeSend' : function (jqXHR, settings) {
            // TODO scyun AJAX 호출시 헤더값을 숨기는 방안 확인 필요함... 
            // 전송 전 API 에서 검증하는 api-key 를 설정한다
            jqXHR.setRequestHeader("x-api-key", "SpammerGoHome");
        },
         'formatData' : function(data) {
             // 여기서 검색필드값을 추가해 전달한다. 
            return  JSON.stringify( {
                                     'page'           : data.pagenum + 1
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
}



$('#SEARCH_FORM').on('submit', function(e) {
    e.preventDefault();
    
    search_text = $('input[name=search_txt]').val();
    loadList();
})
$('#__RESET_BTN').on('click', function(e) {
    e.preventDefault();
    $('input[name=search_txt]').val("");
    $('#SEARCH_FORM').submit();
});

loadList();
</script>

</html>  

