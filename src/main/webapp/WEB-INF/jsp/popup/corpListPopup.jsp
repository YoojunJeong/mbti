<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  trimDirectiveWhitespaces="true" %>
<%@include file="/WEB-INF/jsp/include/taglib.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>업체 조회</title>
	<link rel="stylesheet" href="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/jqwidget/styles/jqx.base.css" type="text/css" />
	<link rel="stylesheet" href="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/jqwidget/styles/jqx.arctic.css" type="text/css" />
	<style class="style" type="text/css">
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

			.point_container { width: 530px; height: 330px; padding: 30px; font-size:0; }

			.data { width: calc(100% / 3); height: 100px; display: inline-block; font-size: 14px; }
			.data_title { width: 100%; height: 50%; text-align: center; }
			.data_contents { width: 100%; height: 50%; text-align: center; }


			#memo_submit { width: 100%; height: 100%; padding: 30px; }
			input[name=memo] { width: 80%; height: 30px; }


			input[name=use_point], input[name=cash] { width: 120px; }

		</style>
		<script src="//${asset_static_domain}${pageContext.request.contextPath}/assets/pk-common.js"></script>
</head>
<body>
	<div class="search_container">
		<form class="title_search">
			<input class="search_input" type="text" name="search">
			<button class="m_button" type="submiit">검색</button>
		</form>

		<div class="contents">
			<div id="_GRID" style="position: relative; z-index: 0;"></div>

			<div class="btn_wrap">
				<button class="m_button" id="ok">확인</button>
				<button class="m_button" id="cancle">취소</button>
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
	<script type="text/javascript">
		var selected_idx = null;
		var selected_name = null;
		var search_text = "";

		var popupLink = null;

		var allCorporations = '//${cms_api_domain}/1.0/admin/point/corp_list';
		var subCorporations = '//${cms_api_domain}/1.0/svc/history/link_corp_list'
		var corporations = '//${cms_api_domain}/1.0/cor/history/corp_list'

		var svc_idx = null;
		var cor_idx = null;

		var type = Number('<%=request.getParameter("type")%>');

		if(type == 1) {
			popupLink = allCorporations;
		}
		else if(type == 2) {
			popupLink = subCorporations;
			svc_idx = '<%=request.getParameter("svc_idx")%>'
		}
		else if(type == 3) {
			popupLink = corporations;
			cor_idx = '<%=request.getParameter("cor_idx")%>'
		}
		function search() {
		selected_idx = null;
		$('.list_content').removeClass("selected");

		// $.ajax({
		//     url: '//${cms_api_domain}/1.0/admin/point/corp_list',
		//     type: 'post',
		//     dataType: 'json',
		//     contentType: 'application/json',
		//     beforeSend: function(jqXHR, setting) {
		//             jqXHR.setRequestHeader('x-api-key', 'SpammerGoHome');
		//     },
		//     data:JSON.stringify({
		//     	'search_text': search_text, 
		//        ,'page'       : data.pagenum + 1
	 //           ,'perPage'    : data.pagesize
		//     }),
		//     success: function(data) {
		//     	console.log(data.body);
		//     	loadList(data.body);
		//     }
		// })
		loadGrid();
	}
	// 법인 조회 팝업 초기화
	
	var columnsrenderer = function (value) {
		    return   '<div style="text-align: center; margin-top: 13px;">' + value + '</div>';
	}
	var service_type_rednerer = function(row, columnfield, value, defaulthtml, columnproperties) {
		var regex = /<(.*?)>(.*?)<(.*?)>/g;

		var val = "";

		switch(Number(value)) {
			case 0 :
				val = "법인대리"
			break;
			case 1:
				val = "모범택시"
			break;
			case 2:
				val = "퀵서비스"
			break;
		}

		var reg_arr = regex.exec(defaulthtml);
		var result =  defaulthtml.replace(reg_arr[2], val);
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
			{"width":"0",   "renderer": columnsrenderer ,   "datafield":"idx"   ,"text":"idx"			,"type":"string","name":"idx", "hidden":true }
			,{"width":"30"  ,  "renderer": columnsrenderer ,   "datafield":"no"                  ,"text":"NO"					,"type":"string","name":"no", "cellsalign": 'center', "cellsrenderer":orderNumberIndexrenderer}
		  , {"width":"200",   "renderer": columnsrenderer ,   "datafield":"name"   ,"text":"법인명"			,"type":"string","name":"name" }
          , {"width":"120",	  "renderer": columnsrenderer ,   "datafield":"ceo_name"  ,"text":"대표자"			,"type":"string","name":"ceo_name"}
          , {"width":"180",	  "renderer": columnsrenderer ,   "datafield":"reg_num"  ,"text":"사업자 등록번호"	,"type":"string","name":"reg_num","cellsalign": 'center'}
	];
	if(type == 3) {
		data_columns = [ 
			{"width":"0",   "renderer": columnsrenderer ,   "datafield":"idx"   ,"text":"idx"			,"type":"string","name":"idx", "hidden":true }
			,{"width":"30"  ,  "renderer": columnsrenderer ,   "datafield":"no"                  ,"text":"NO"					,"type":"string","name":"no", "cellsalign": 'center', "cellsrenderer":orderNumberIndexrenderer}
		  , {"width":"250",   "renderer": columnsrenderer ,   "datafield":"name"   ,"text":"법인명"			,"type":"string","name":"name" }
          , {"width":"250",	  "renderer": columnsrenderer ,   "datafield":"service_type"  ,"text":"서비스 구분"			,"type":"string","name":"service_type", "cellsrenderer":service_type_rednerer}
		];
	}
	var gridDataSource = {
        "cache": false,
        "type": 'post',
        "url": popupLink,
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
	    height: '450', 
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
	            if(type == 1) {
		            return  JSON.stringify( {
		            						 'search_text': search_text
									    	 ,'page'           : data.pagenum + 1
		                                     ,'perPage'        : data.pagesize
		                                    });
	            }
	            else if(type == 2) {
	            	return  JSON.stringify( {
	            							 'svc_idx': svc_idx
		            						 ,'search_text': search_text
									    	 ,'page'           : data.pagenum + 1
		                                     ,'perPage'        : data.pagesize
		                                    });
	            }
	            else if(type == 3) {
	            	return  JSON.stringify( {
	            							 'cor_idx': cor_idx
		            						 ,'search_text': search_text
									    	 ,'page'           : data.pagenum + 1
		                                     ,'perPage'        : data.pagesize
		                                    });
	            }
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
	function event() {
		$('.title_search').on('submit', function(e) {
			e.preventDefault();
			search_text = $('.search_input').val();
			search();
		})
		$(document).on('click', '.list_content', function(e) {
			var target = $(e.target);
			console.log(target);
			$('.list_content').removeClass("selected");

			if(target.hasClass('list_content')) {
				target.addClass("selected");
				selected_idx = target.attr('data-idx');
			}
			else {
				target.parent().parent().addClass("selected");
				selected_idx = target.parent().parent().attr('data-idx');
			}
		})
		// row 클릭시
		$("#_GRID").on('rowclick', function (event) {
		    var row_index = args.rowindex;
		    var data = $("#_GRID").jqxGrid('getrowdata', row_index);

		    selected_name = data.name;
		    selected_idx = data.idx;                                                                   
		});
		$("#_GRID").on('rowdoubleclick', function (event) { 
		    var row_index = args.rowindex;
		    var data = $("#_GRID").jqxGrid('getrowdata', row_index);

		    selected_name = data.name;
		    selected_idx = data.idx;
		    window.opener.loadData(selected_idx, data.name);
			window.close();   
		});

		// 취소 이벤트
		$('#cancle').on('click', function(e) {
			window.close();
		})
		// 확인 이벤트
		$('#ok').on('click', function(e) {
			if(selected_idx != null) {
				window.opener.loadData(selected_idx, selected_name);

				window.close();
			}
			else {

				alert("법인을 선택해주세요.");
			}
		})
	}
	validate.addElement($('.search_input'), {kor: true, number: true, eng: true, space: true, special: true})

	event();
	search();

	</script>
</body>
</html>