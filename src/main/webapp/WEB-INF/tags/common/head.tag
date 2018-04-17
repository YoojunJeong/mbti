<%@ tag language="java" pageEncoding="UTF-8" body-content="scriptless"   trimDirectiveWhitespaces="true"  %>
<%@include file="/WEB-INF/jsp/include/taglib.jsp"  %>
<head>
	<meta charset="utf-8" />
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
	<meta content="" name="description" />
	<meta content="" name="author" />
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="/ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">
 
    <link rel="apple-touch-icon" sizes="57x57"         href="//${asset_static_domain}${pageContext.request.contextPath}/assets/favicon/apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60"         href="//${asset_static_domain}${pageContext.request.contextPath}/assets/favicon/apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72"         href="//${asset_static_domain}${pageContext.request.contextPath}/assets/favicon/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76"         href="//${asset_static_domain}${pageContext.request.contextPath}/assets/favicon/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114"       href="//${asset_static_domain}${pageContext.request.contextPath}/assets/favicon/apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120"       href="//${asset_static_domain}${pageContext.request.contextPath}/assets/favicon/apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144"       href="//${asset_static_domain}${pageContext.request.contextPath}/assets/favicon/apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152"       href="//${asset_static_domain}${pageContext.request.contextPath}/assets/favicon/apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180"       href="//${asset_static_domain}${pageContext.request.contextPath}/assets/favicon/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192"  href="//${asset_static_domain}${pageContext.request.contextPath}/assets/favicon/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32"    href="//${asset_static_domain}${pageContext.request.contextPath}/assets/favicon/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96"    href="//${asset_static_domain}${pageContext.request.contextPath}/assets/favicon/favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16"    href="//${asset_static_domain}${pageContext.request.contextPath}/assets/favicon/favicon-16x16.png">
    <!-- 안드로이드용 파비콘 메니페스트??
    <link rel="manifest" href="//${asset_static_domain}${pageContext.request.contextPath}/assets/favicon/manifest.json">
      -->
	
	<!-- ================== BEGIN BASE CSS STYLE ================== -->
	<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
	<link href="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/jquery-ui-1.11.4.custom/themes/smoothness/jquery-ui.min.css">
	<!-- ======== scyun  왜 1.11.4 theme 를 읽고 아래 다시 낮은 버전의 CSS 를 읽는것인지 확인필요.. -->
	<!-- ========  -->
	<link href="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/jquery-ui/themes/base/minified/jquery-ui.min.css" rel="stylesheet" />
	<link href="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
	<link href="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
	<link href="//${asset_static_domain}${pageContext.request.contextPath}/assets/css/animate.min.css" rel="stylesheet" />
	<link href="//${asset_static_domain}${pageContext.request.contextPath}/assets/css/style.min.css" rel="stylesheet" />
	<link href="//${asset_static_domain}${pageContext.request.contextPath}/assets/css/style-responsive.min.css" rel="stylesheet" />
	<link href="//${asset_static_domain}${pageContext.request.contextPath}/assets/css/theme/default.css" rel="stylesheet" id="theme" />
	<link href="//${asset_static_domain}${pageContext.request.contextPath}/assets/css/custom.css" rel="stylesheet" />
	<link href="//${asset_static_domain}${pageContext.request.contextPath}/assets/css/jquery.fileupload.css" rel="stylesheet">
	

	<!-- ================== END BASE CSS STYLE ================== -->
	
	<!-- ================== BEGIN PAGE LEVEL STYLE ================== -->
	<link href="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/jquery-jvectormap/jquery-jvectormap-1.2.2.css" rel="stylesheet" />
	<link href="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/bootstrap-datepicker/css/datepicker.css" rel="stylesheet" />
	<link href="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/bootstrap-datepicker/css/datepicker3.css" rel="stylesheet" />
	<link href="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/gritter/css/jquery.gritter.css" rel="stylesheet" />
	<link href="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/bootstrap-timepicker/css/bootstrap-timepicker.min.css" rel="stylesheet">
	<link href="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/bootstrap-daterangepicker/daterangepicker-bs3.css" rel="stylesheet">
	<link href="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/bootstrap-eonasdan-datetimepicker/build/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
	<link href="//${asset_static_domain}${pageContext.request.contextPath}/assets/css/modal.css" rel="stylesheet">
	<!-- ================== END PAGE LEVEL STYLE ================== -->
	


	<!-- 리소스 -->
	<link href="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/bootstrap-select/bootstrap-select.min.css" rel="stylesheet" />
	<link href="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/select2/select2.css" rel="stylesheet" />
	
	<link href="//${asset_static_domain}${pageContext.request.contextPath}/assets/css/common.css" rel="stylesheet" />
    <!-- ================== BEGIN BASE JS ================== -->
    <!-- 
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.15/angular.min.js"></script>
    <script>
    var valet_admin = angular.module("parkingOnAdmin", []);
    </script>
    <script src="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/jquery-ui-1.11.4.custom/external/jquery/jquery.js"></script>
    <script src="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/jquery-ui-1.11.4.custom/jquery-ui.min.js"></script>
     -->

    <!-- ================== BEGIN BASE JS ================== -->
    <script src="//${asset_static_domain}${pageContext.request.contextPath}/assets/js/jquery.js"></script>
    <script src="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/jquery/jquery-migrate-1.1.0.min.js"></script>
    <script src="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/jquery-ui/ui/minified/jquery-ui.min.js"></script>
    <script src="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="//${asset_static_domain}${pageContext.request.contextPath}/assets/js/jquery.ui.widget.js"></script>
    <script src="//${asset_static_domain}${pageContext.request.contextPath}/assets/js/jquery.fileupload.js"></script>
    <script src="//${asset_static_domain}${pageContext.request.contextPath}/assets/js/data-notify.js"></script>
    <script src="//${asset_static_domain}${pageContext.request.contextPath}/assets/js/moments.js"></script>
    <script src="//${asset_static_domain}${pageContext.request.contextPath}/assets/js/bootstrap-datetimepicker.js"></script>
    <script src="//${asset_static_domain}${pageContext.request.contextPath}/assets/js/jquery.magnific-popup.js"></script>

    <!--[if lt IE 9]>
        <script src="//${asset_static_domain}${pageContext.request.contextPath}/assets/crossbrowserjs/html5shiv.js"></script>
        <script src="//${asset_static_domain}${pageContext.request.contextPath}/assets/crossbrowserjs/respond.min.js"></script>
        <script src="//${asset_static_domain}${pageContext.request.contextPath}/assets/crossbrowserjs/excanvas.min.js"></script>
    <![endif]-->
    <script src="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/jquery-cookie/jquery.cookie.js"></script>
    <!-- ================== END BASE JS ================== -->
    
    <!-- ================== BEGIN PAGE LEVEL JS ================== -->
    <script src="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/gritter/js/jquery.gritter.js"></script>
    <script src="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/flot/jquery.flot.min.js"></script>
    <script src="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/flot/jquery.flot.time.min.js"></script>
    <script src="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/flot/jquery.flot.resize.min.js"></script>
    <script src="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/flot/jquery.flot.pie.min.js"></script>
    <script src="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/sparkline/jquery.sparkline.js"></script>
    <script src="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/jquery-jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
    <script src="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/jquery-jvectormap/jquery-jvectormap-world-mill-en.js"></script>
    <script src="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    <script src="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/bootstrap-timepicker/js/bootstrap-timepicker.min.js"></script>
    <script src="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/bootstrap-daterangepicker/moment.js"></script>
    <script src="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/bootstrap-daterangepicker/daterangepicker.js"></script>
    <script src="//${asset_static_domain}${pageContext.request.contextPath}/assets/js/dashboard.js"></script>
    <script src="//${asset_static_domain}${pageContext.request.contextPath}/assets/js/apps.js"></script>
    <script src="//${asset_static_domain}${pageContext.request.contextPath}/assets/js/jquery.validate.js"></script>
    <script src="//${asset_static_domain}${pageContext.request.contextPath}/assets/js/work.js"></script>
<!--  <script type="text/javascript">
 var datepicker = $.fn.datepicker.noConflict(); // return $.fn.datepicker to previously assigned value
 $.fn.bootstrapDP = datepicker;                 // give $().bootstrapDP the bootstrap-datepicker functionality
 </script -->
    <!-- ================== END PAGE LEVEL JS ================== -->
 
     <!-- ================== COMMON JS ==================== -->
    <script src="//${asset_static_domain}${pageContext.request.contextPath}/assets/pk-common.js?v=20171025_v7"></script>
    <!-- ================== END BASE JS ================== -->

    <!-- 추가 스크립트 -->
    <script src="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/bootstrap-select/bootstrap-select.min.js"></script>
    <script src="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/select2/select2.js"></script>
	<jsp:doBody/>
	
</head>
<!-- start Mixpanel --><script type="text/javascript">(function(e,a){if(!a.__SV){var b=window;try{var c,l,i,j=b.location,g=j.hash;c=function(a,b){return(l=a.match(RegExp(b+"=([^&]*)")))?l[1]:null};g&&c(g,"state")&&(i=JSON.parse(decodeURIComponent(c(g,"state"))),"mpeditor"===i.action&&(b.sessionStorage.setItem("_mpcehash",g),history.replaceState(i.desiredHash||"",e.title,j.pathname+j.search)))}catch(m){}var k,h;window.mixpanel=a;a._i=[];a.init=function(b,c,f){function e(b,a){var c=a.split(".");2==c.length&&(b=b[c[0]],a=c[1]);b[a]=function(){b.push([a].concat(Array.prototype.slice.call(arguments,
0)))}}var d=a;"undefined"!==typeof f?d=a[f]=[]:f="mixpanel";d.people=d.people||[];d.toString=function(b){var a="mixpanel";"mixpanel"!==f&&(a+="."+f);b||(a+=" (stub)");return a};d.people.toString=function(){return d.toString(1)+".people (stub)"};k="disable time_event track track_pageview track_links track_forms register register_once alias unregister identify name_tag set_config reset people.set people.set_once people.increment people.append people.union people.track_charge people.clear_charges people.delete_user".split(" ");
for(h=0;h<k.length;h++)e(d,k[h]);a._i.push([b,c,f])};a.__SV=1.2;b=e.createElement("script");b.type="text/javascript";b.async=!0;b.src="undefined"!==typeof MIXPANEL_CUSTOM_LIB_URL?MIXPANEL_CUSTOM_LIB_URL:"file:"===e.location.protocol&&"//cdn.mxpnl.com/libs/mixpanel-2-latest.min.js".match(/^\/\//)?"https://cdn.mxpnl.com/libs/mixpanel-2-latest.min.js":"//cdn.mxpnl.com/libs/mixpanel-2-latest.min.js";c=e.getElementsByTagName("script")[0];c.parentNode.insertBefore(b,c)}})(document,window.mixpanel||[]);
mixpanel.init("948c769369c8e8c664264858b4fd66e5");</script><!-- end Mixpanel -->
<script type="text/javascript">
var SINFO = {
		GETNORMALACCOUNTS : "//${php_api_domain}/a_api/accounts/getAccountsForNormal",
		GETNORMALINFOFORFORMAL : "//${php_api_domain}/a_api/accounts/getAccountInfoForNormal",
		UPDATEACCOUNTFORNORMAL : "//${php_api_domain}/a_api/accounts/updateAccountForNormal",	
		GETDRIVERACCOUNTS : "//${php_api_domain}/a_api/accounts/getAccountsForDriver",
		GETDRIVERACCOUNT : '//${php_api_domain}/a_api/accounts/getAccountInfoForDriver',	
		UPDATEDRIVERIMG : '//${php_api_domain}/a_api/accounts/uploadDriverImage',
		UPDATEDRIVERSTATE : "//${php_api_domain}/a_api/accounts/updateDriverState",
		UPDATEDRIVERSTATUS : "//${php_api_domain}/a_api/accounts/updateDriverStatus",
		UPDATEDRIVERINFO : '//${php_api_domain}/a_api/accounts/updateAccountForDriver',
		UPDATEDRIVERPWD : '//${php_api_domain}/a_api/accounts/updatePasswordForDriver',
		UPDATEDRIVERIMAGE : '//${php_api_domain}/a_api/accounts/uploadDriverImage',
		GETPARKINGLOTS : "//${php_api_domain}/a_api_valet/zone/getParkingLots",
		INSERTAPPVERSION : "//${php_api_domain}/a_api/version/insertAppVersion",
		GETVALETCNTPERHOR : '//${php_api_domain}/a_api_valet/valet/getValetCntPerHour',
		GETVALETCNTPERWEEKDAY : '//${php_api_domain}/a_api_valet/valet/getValetCntPerWeekday',
		GETPARTNERS : '//${php_api_domain}/a_api/partner/getPartners',
		GETPARTNER : '//${php_api_domain}/a_api/partner/getData',
		GETSTATISTICSFORDASHBOARD : '//${php_api_domain}/a_api/statistics/getStatisticsForDashboard',
		GETCLOSEPARKINGLOTS : '//${php_api_domain}/a_api_valet/zone/getCloseParkingLots',
		GETVALETLISTS : '//${php_api_domain}/a_api_valet/valet/getRequestValets',
		GETVALET : '//${php_api_domain}/a_api_valet/valet/getRequestValet',
		GETAPPVERSION : '//${php_api_domain}/a_api/version/getAppVersions',
		DELETEAPPVERSION : '//${php_api_domain}/a_api/version/delete',
		NOTICEINSERT : '//${php_api_domain}/a_api/notice/insert',
		GETNOTICELISTS : '//${php_api_domain}/a_api/notice/getNotices',
		GETFAQLISTS : '//${php_api_domain}/a_api/faq/getFaqs',
		GETREPORTLIST : '//${php_api_domain}/a_api/report/reports',
		UPDATEREPORT : '//${php_api_domain}/a_api/report/updateCompleted',
		FAQINSERT : '//${php_api_domain}/a_api/faq/insert',
		UPDATENOTICE : '//${php_api_domain}/a_api/notice/update',
		UPDATEFAQ : '//${php_api_domain}/a_api/faq/update',
		CHANGEDRIVER : '//${php_api_domain}/a_api_valet/valet/changeDriver',
		INSERTAREA2PARKINGLOT : '//${php_api_domain}/a_api_valet/zone/insertArea2ParkingLot',
		ADDCODES : '//${php_api_domain}/a_api/closed_beta/createCode',
		GETMONTHLYRESERVATIONS : '//${php_api_domain}/a_api_service/monthly/getReservations',
		GETREQUESTS : '//${php_api_domain}/a_api_service/request/getRequests',
		GETCHAUFFEURS : '//${php_api_domain}/a_api_service/request/getChauffeurs',
		GETDRIVINGHOMES : '//${php_api_domain}/a_api_service/request/getDrivingHomes',
		POPUPINSERT : '//${php_api_domain}/a_api/popups/insert',
		GETPOPUPS : '//${php_api_domain}/a_api/popups/getList',
		UPDATEPOPUP : '//${php_api_domain}/a_api/popups/update',
		UPLOADPOPUPIMAGE : '//${php_api_domain}/a_api/popups/uploadPopupImage',
		DELETEPOPUP : '//${php_api_domain}/a_api/popups/delete',
		PAYMONTHLY : '//${php_api_domain}/a_api_service/monthly/pay',
		GETNORMALACCOUNTSCORP : "//${php_api_domain}/a_api/accounts/getAccountsForNormalCorp",
		CANCELREQUESTVALET : '//${php_api_domain}/a_api_valet/valet/cancel',
		REQUESTUNPARKING : '//${php_api_domain}/a_api_valet/valet/requestUnparking',
		UPDATECORPACCOUNTSTATE : "//${php_api_domain}/a_api/accounts/updateCorpAccountState",
		ADDCOUPONS : '//${php_api_domain}/a_api/coupons/createCode',
		COMPLETEVALET : '//${php_api_domain}/a_api_valet/valet/completeValet',
		GETLOCALAGENTS : '//${php_api_domain}/a_api_valet/localagents/getList',
		GETLOCALAGENT : '//${php_api_domain}/a_api_valet/localagents/getData',
		GETRECOMMENDEDPOSITIONS : '//${php_api_domain}/a_api_valet/recommended_positions/getList',
		GETRECOMMENDEDPOSITION : '//${php_api_domain}/a_api_valet/recommended_positions/getData',
		GETLOCALAGENTPOINTS : '//${php_api_domain}/a_api_valet/localagents/getPointList',
		GETLOCALAGENTPOINT : '//${php_api_domain}/a_api_valet/localagents/getPointData',
		GETREQUESTEDLOCALAGENT : '//${php_api_domain}/a_api_valet/localagents/getHistories',
		GETMONTHLYPARKINGLOTS : '//${php_api_domain}/a_api_service/monthly/getProducts',
		GETMONTHLYPARKINGLOT : '//${php_api_domain}/a_api_service/monthly/getProduct',
		GETPARKINGLOT : '//${php_api_domain}/a_api_valet/zone/getParkingLot',
		GETHOTELVALETS : '//${php_api_domain}/a_api_valet/hotelvalets/getList',
		GETHOTELVALET : '//${php_api_domain}/a_api_valet/hotelvalets/getData',
		GETHOTELVALETCOUPONS : '//${php_api_domain}/a_api_valet/hotelvalets/getCouponList',
		GETHOTELVALETCOUPON : '//${php_api_domain}/a_api_valet/hotelvalets/getCouponData',
		GETREQUESTEDHOTELVALET : '//${php_api_domain}/a_api_valet/hotelvalets/getHistories',
		GETMONTHLYRESERVATION : '//${php_api_domain}/a_api_service/monthly/getReservation',
		GETNEWSLETTERLISTS : '//${php_api_domain}/a_api/board/getNewsletters',
		NEWSLETTERINSERT : '//${php_api_domain}/a_api/board/insertNewsletter',
		UPDATENEWSLETTER : '//${php_api_domain}/a_api/board/updateNewsletter',
		SENDNEWSLETTER : '//${php_api_domain}/a_api/board/sendNewsLetter',
		SENDTESTNEWSLETTER : '//${php_api_domain}/a_api/board/sendTestNewsLetter',
	    GETREQUESTLIST : '//${php_api_domain}/a_api/developtools/request'
	};
//숫자 타입에서 쓸 수 있도록 format() 함수 추가
Number.prototype.format = function(){
    if(this==0) return 0;
 
    var reg = /(^[+-]?\d+)(\d{3})/;
    var n = (this + '');
 
    while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');
 
    return n;
};
 
// 문자열 타입에서 쓸 수 있도록 format() 함수 추가
String.prototype.format = function(){
    var num = parseFloat(this);
    if( isNaN(num) ) return "0";
 
    return num.format();
};
</script>