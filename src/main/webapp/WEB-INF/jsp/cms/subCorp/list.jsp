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
    <script>mixpanel.track("cms-svc detail");</script>
<!-- begin #content -->
<div id="content" class="content">
	<!-- begin breadcrumb -->
	<ol class="breadcrumb pull-right">
        <li class="active"><a href="/cms/corp/list?mainmenu=m1&submenu=s1">HOME</a></li>
        <li class="active"><a href="/cms/corp/list?mainmenu=m1&submenu=s1">법인관리</a></li>
        <li class="active"><a href="/cms/subCorp/list?mainmenu=m1&submenu=s2">서비스공급업체 목록</a></li>
    </ol>

    <h1 class="page-header">서비스 공급업체 목록</h1>
    <!-- begin row -->
    <div class="row">
        <!-- begin col-12 -->
        <div class="col-md-12">
            <form id="SEARCH_FORM" action="#">
            <div class="panel panel-inverse">
                <div class="panel-heading">
                    <h4 class="panel-title">검색</h4>
                </div>
                <div  class="form-horizontal form-bordered">
                    <div class="form-group">
                        <label class="col-md-1 control-label">검색구분</label>
                        <div class="col-md-5 form-inline">
                            <div class="input-group"> <input class="form-control" type="text" name="search_txt" placeholder="법인명"></input> </div>
                            <div class="input-group"> <button type="submit" id="__SEARCH_BTN" class="btn btn-primary">검색</button> </div>
                        </div>
                        <div class="col-md-6 text-right">
                            <button id="__SUB_CORP_REG_BTN"   type="button"      class="btn btn-primary">업체등록</button>
                        </div>
                    </div>
                </div>
            </div>
            </form>
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
<script>
	var wrapForCell = function(value)
	{
        return  '<div style="text-align: center;margin-top:5px;">' +value+ '</div>' ;
	}

    // GRID Column Renderrer
    var columnsrenderer = function (value) {
        return  wrapForCell( value );
    }
    
    var headerRenderrer = function(value) 
    {
    	return  '<table style="width:100%;height:100%;"><tr><td style="text-align:center;vertical-align: middle;">'+value+'</td></tr></table>';
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

var data_columns = [
      { "width":"50"  , "text":"번호",									"name":"ordidx"                         ,"renderer": headerRenderrer                         ,"cellsrenderer":orderNumberIndexrenderer}
	, { "width":"50"  , "hidden" : true,    "renderer": headerRenderrer ,   "datafield":"sub_cor_idx", "text":"IDX", "type":"string", "name":"sub_cor_idx" ,cellsalign:"center" }
	, { "width":"150" , "renderer": headerRenderrer ,   "datafield":"name" , "text":"법인명", "type":"string", "name":"name" }
	, { "width":"150" , "renderer": headerRenderrer ,   "datafield":"manager_name" , "text":"담당자명", "type":"string", "name":"manager_name" }
	, { "width":"150" , "renderer": headerRenderrer ,   "datafield":"manager_email" , "text":"이메일", "type":"string", "name":"manager_email" }
	, { "width":"150" , "renderer": headerRenderrer ,   "datafield":"manager_phone" , "text":"전화번호", "type":"string", "name":"manager_phone" }
	, { "width":"150" , "renderer": headerRenderrer ,   "datafield":"manager_dept" , "text":"부서", "type":"string", "name":"manager_dept" }
	, { "width":"150" , "renderer": headerRenderrer ,   "datafield":"manager_position" , "text":"직급", "type":"string", "name":"manager_position" }
	, { "width":"150" , "renderer": headerRenderrer ,   "datafield":"login_id" , "text":"아이디", "type":"string", "name":"login_id" }
];

// GRID Theme 
var theme = 'arctic';
// TODO scyun : ui 에서 API 호출시 URL 에 version을 하드코딩? 설정에서 읽어오도록 ????
//              어떻게 해야할까???
// GRID DATASOURCE 설정..
var gridDataSource = {
    "cache": false,
    "type": 'post',
    "url": '//${cms_api_domain}${pageContext.request.contextPath}/1.0/subcorporation/list',
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
        return  JSON.stringify( {
                                 'page'           : data.pagenum + 1
                                ,'perPage'        : data.pagesize
                                ,'search_txt' :     jQuery('[name=search_txt]').val()
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

	jQuery(document).ready(function(){

        validate.addElement(jQuery("[name=search_txt]"), { kor: true, number: true, eng: true, space: true, special: true})

	    $("#__GRID").jqxGrid( {
	        width: '100%',
	        height: '760', 
	        source: dataadapter,
	        theme: theme,
	        //rowsheight: 60,
	        scrollmode: 'logical',
	        pageable: true,
	        pagesize: 100,
	        virtualmode: true,
	        pagesizeoptions: [10,20,50, 100],
	        rendergridrows: function (params) {
	            return params.data;
	        },
	        columnsresize: true,
	        columns: data_columns
	        , columnsheight:40//헤더 컬럼의 크기 
	        , altrows : true   //줄마다 다른 색 넣기 
	    });
	    
	    // jQuery('#__SEARCH_BTN').click(function(){
     //        $("#__GRID").jqxGrid( { source: dataadapter});
     //    });
            
        jQuery('#SEARCH_FORM').submit(function(e) {
            e.preventDefault();
            
	        $("#__GRID").jqxGrid( { source: dataadapter});
        })

	    $("#__GRID").bind('rowdoubleclick', function (event) {
	        var rowdata = event.args.row;
	        console.log(rowdata);
            document.location.href="//${cms_ui_domain}${pageContext.request.contextPath}/cms/subCorp/detail?mainmenu=${param.mainmenu}&submenu=${param.submenu}&subCorIdx="+rowdata.bounddata.sub_cor_idx;
	    });

		
		jQuery('#__SUB_CORP_REG_BTN').click(function(){
			document.location.href="//${cms_ui_domain}${pageContext.request.contextPath}/cms/subCorp/reg?mainmenu=${param.mainmenu}&submenu=${param.submenu}";
		});
	});
</script>
</html>  
