<%@ tag language="java" pageEncoding="UTF-8" body-content="tagdependent"   trimDirectiveWhitespaces="true"  %>
<%@include file="/WEB-INF/jsp/include/taglib.jsp"  %>
<!-- begin #sidebar -->


<c:choose>
	<c:when test="${adminType eq 'cms'}">
<!--  GENIE  어드민 메뉴 Start. -->
<div id="sidebar" class="sidebar">
	<!-- begin sidebar scrollbar -->
	<div data-scrollbar="true" data-height="100%">
		<!-- begin sidebar user -->
		<ul class="nav"><li class="nav-profile"><div class="info"> Admin </div> </li></ul>
		<!-- end sidebar user -->
		<!-- begin sidebar nav -->
		<ul class="nav">					
			<li class="nav-header">Navigation</li>
			<li class="has-sub  <c:out value="${param.mainmenu == 'm1' ? 'active' : ''}"></c:out>">
                <a href="javascript:;"><i class="fa fa-inbox"></i> <span>법인관리</span> </a>
				<ul class="sub-menu">	
					<li class="${param.mainmenu == 'm1' && param.submenu == 's1' ? 'active' : ''}"><a href="//${cms_ui_domain}/cms/corp/list?mainmenu=m1&submenu=s1"> <i class="fa fa-laptop"></i> <span>법인 목록</span></a></li>
					<li class="${param.mainmenu == 'm1' && param.submenu == 's2' ? 'active' : ''}"><a href="//${cms_ui_domain}/cms/subCorp/list?mainmenu=m1&submenu=s2"> <i class="fa fa-laptop"></i> <span>서비스공급업체 목록</span></a></li>
				</ul>
			</li>
			
			<li class="has-sub <c:out value="${param.mainmenu == 'm2' ? 'active' : ''}"></c:out>">
					<a href="javascript:;"><i class="fa fa-inbox"></i> <span>정산관리</span> </a>
				<ul class="sub-menu">	
					<li class="${param.mainmenu == 'm2' && param.submenu == 's1' ? 'active' : ''}"><a href="//${cms_ui_domain}/cms/point/list?mainmenu=m2&submenu=s1"> <i class="fa fa-laptop"></i> <span>현대자동차 블루멤버스 포인트</span></a></li>
				</ul>	
			</li>
   <!-- 
			<li class="has-sub">
					<a href="javascript:;"><i class="fa fa-inbox"></i> <span>문자관리</span> </a>
				<ul class="sub-menu">	
				</ul>	
			</li>
    -->
			
   <%-- 
			<li class="has-sub <c:out value="${param.mainmenu == 'm4' ? 'active' : ''}"></c:out>">
				<a href="javascript:;"><i class="fa fa-inbox"></i> <span>법인</span> </a>
				<ul class="sub-menu">					    	
					<li class="${param.mainmenu == 'm4' && param.submenu == 's1' ? 'active' : ''}"><a href="//${cms_ui_domain}/cor/history/period?mainmenu=m4&submenu=s1">기간별</a></li> 
					<li class="${param.mainmenu == 'm4' && param.submenu == 's2' ? 'active' : ''}"><a href="//${cms_ui_domain}/cor/history/month?mainmenu=m4&submenu=s2">월별</a></li> 
					<li class="${param.mainmenu == 'm4' && param.submenu == 's3' ? 'active' : ''}"><a href="//${cms_ui_domain}/cor/history/day?mainmenu=m4&submenu=s3">일기준</a></li>
					<li class="${param.mainmenu == 'm4' && param.submenu == 's4' ? 'active' : ''}"><a href="//${cms_ui_domain}/cor/user/list?mainmenu=m4&submenu=s4">사용자조회</a></li> 
					<li class="${param.mainmenu == 'm4' && param.submenu == 's5' ? 'active' : ''}"><a href="//${cms_ui_domain}/cor/account/inquiry?mainmenu=m4&submenu=s5">계정정보</a></li>
					<li class="${param.mainmenu == 'm4' && param.submenu == 's6' ? 'active' : ''}"><a href="//${cms_ui_domain}/cor/account/password?mainmenu=m4&submenu=s6">비밀번호 변경</a></li>  
				</ul>					
			</li>
			<li class="has-sub <c:out value="${param.mainmenu == 'm5' ? 'active' : ''}"></c:out>">
				<a href="javascript:;"><i class="fa fa-inbox"></i> <span>복수업체</span> </a>
				<ul class="sub-menu">					    	
					<li class="${param.mainmenu == 'm5' && param.submenu == 's1' ? 'active' : ''}"><a href="//${cms_ui_domain}/svc/history/period?mainmenu=m5&submenu=s1">기간별</a></li> 
					<li class="${param.mainmenu == 'm5' && param.submenu == 's2' ? 'active' : ''}"><a href="//${cms_ui_domain}/svc/history/month?mainmenu=m5&submenu=s2">월별</a></li> 
					<li class="${param.mainmenu == 'm5' && param.submenu == 's3' ? 'active' : ''}"><a href="//${cms_ui_domain}/svc/history/day?mainmenu=m5&submenu=s3">일기준</a></li>
					<li class="${param.mainmenu == 'm5' && param.submenu == 's4' ? 'active' : ''}"><a href="//${cms_ui_domain}/svc/account/inquiry?mainmenu=m5&submenu=s4">계정정보</a></li>
					<li class="${param.mainmenu == 'm5' && param.submenu == 's5' ? 'active' : ''}"><a href="//${cms_ui_domain}/svc/account/password?mainmenu=m5&submenu=s5">비밀번호 변경</a></li>  
				</ul>					
			</li>
   
    --%>
			
			<li class="nav-header">Navigation(OLD)</li>
			<li class="has-sub"><a href="//${php_web_domain}/admin/Dashboard?mainmenu=0"> <i class="fa fa-laptop"></i> <span>Dashboard</span></a></li>
			<li class="has-sub">
				<a href="javascript:;"><i class="fa fa-inbox"></i> <span>회원</span> </a>
				<ul class="sub-menu">					    	
					<li class=""><a href="//${php_web_domain}/admin/MemberAdd?mainmenu=1&submenu=0">등록</a></li> 
					<li class=""><a href="//${php_web_domain}/admin/MemberManage?mainmenu=1&submenu=1">관리</a></li> 
					<li class=""><a href="//${php_web_domain}/admin/MemberCorpManage?mainmenu=1&submenu=2">법인회원 관리</a></li> 
				</ul>					
			</li>
			<li class="has-sub "><a href="javascript:;"><i class="fa fa-suitcase"></i><span>기사</span></a>
				<ul class="sub-menu">					    	
					<li class=""><a href="//${php_web_domain}/admin/DriverAdd?mainmenu=2&submenu=0">등록</a></li> 
					<li class=""><a href="//${php_web_domain}/admin/DriverManage?mainmenu=2&submenu=1">관리</a></li> 
					<li class=""><a href="//${php_web_domain}/admin/DriverConfirm?mainmenu=2&submenu=2">승인</a></li> 
					<li class=""><a href="//${php_web_domain}/admin/DriverLocation?mainmenu=2&submenu=3">위치</a></li> 
				</ul>					
			</li>
			<li class="has-sub "><a href="javascript:;"><i class="fa fa-key"></i><span>서비스</span></a>
				<ul class="sub-menu">					    	
					<li class=""><a href="//${php_web_domain}/admin/ServiceAll?mainmenu=3&submenu=0">전체</a></li> 
					<li class=""><a href="//${php_web_domain}/admin/ServiceValet?mainmenu=3&submenu=1">발렛</a></li> 
					<li class=""><a href="//${php_web_domain}/admin/ServiceChauffeur?mainmenu=3&submenu=2">대리운전</a></li> 
					<li class=""><a href="//${php_web_domain}/admin/ServiceDrivingHome?mainmenu=3&submenu=3">카딜리버리</a></li> 
				</ul>					
			</li>
			<li class="has-sub "><a href="javascript:;"><i class="fa fa-car"></i><span>월주차</span></a>
				<ul class="sub-menu">					    	
					<li class=""><a href="//${php_web_domain}/admin/MonthlyManage?mainmenu=4&submenu=0">신청 리스트</a></li> 
					<li class=""><a href="//${php_web_domain}/admin/MonthlyAdd?mainmenu=4&submenu=1">등록</a></li> 
				</ul>					
			</li>
			<li class="has-sub "><a href="javascript:;"><i class="fa fa-star"></i><span>쿠폰</span></a>
				<ul class="sub-menu">					    	
						<li class=""><a href="//${php_web_domain}/admin/CouponAdd?mainmenu=5&submenu=0">자동쿠폰발급</a></li> 
						<li class=""><a href="//${php_web_domain}/admin/CouponManualAdd?mainmenu=5&submenu=1">수동쿠폰발급</a></li> 
						<li class=""><a href="//${php_web_domain}/admin/CouponManage?mainmenu=5&submenu=2">쿠폰관리</a></li> 
					</ul>					
			</li>
			<li class="has-sub "><a href="javascript:;"><i class="fa fa-gift"></i><span>제휴사</span></a>
				<ul class="sub-menu">					    	
					<li class=""><a href="//${php_web_domain}/admin/PartnerAdd?mainmenu=6&submenu=0">등록</a></li> 
					<li class=""><a href="//${php_web_domain}/admin/PartnerManage?mainmenu=6&submenu=1">관리</a></li> 
				</ul>					
			</li>
			<li class="has-sub "><a href="javascript:;"><i class="fa fa-star"></i><span>핫스팟</span></a>
				<ul class="sub-menu">					    	
					<li class=""><a href="//${php_web_domain}/admin/HotspotAdd?mainmenu=7&submenu=0">등록</a></li> 
					<li class=""><a href="//${php_web_domain}/admin/HotspotManage?mainmenu=7&submenu=1">관리</a></li> 
				</ul>					
			</li>
			<li class="has-sub "><a href="javascript:;"><i class="fa fa-map-marker"></i><span>주차장</span></a>
				<ul class="sub-menu">					    	
					<li class=""><a href="//${php_web_domain}/admin/ParkinglotManage?mainmenu=8&submenu=0">등록</a></li> 
					<li class=""><a href="//${php_web_domain}/admin/ParkinglotAll?mainmenu=8&submenu=1">모두</a></li> 
					<li class=""><a href="//${php_web_domain}/admin/ParkinglotMonthly?mainmenu=8&submenu=2">월주차 주차장</a></li> 
				</ul>					
			</li>
			<li class="has-sub "><a href="//${php_web_domain}/admin/mms?mainmenu=9"><i class="fa fa-th"></i><span>SMS</span></a></li>
			<li class="has-sub "><a href="//${php_web_domain}/admin/Stastics?mainmenu=10"><i class="fa fa-area-chart"></i><span>통계</span></a></li>
			<li class="has-sub "><a href="javascript:;"><i class="fa fa-align-left"></i><span>모니터링</span></a>
				<ul class="sub-menu">					    	
					<li class=""><a href="//${php_web_domain}/admin/MonitorSet?mainmenu=11&submenu=0">배정</a></li> 
					<li class=""><a href="//${php_web_domain}/admin/MonitorSituation?mainmenu=11&submenu=1">도로상황</a></li> 
				</ul>					
			</li>
			<li class="has-sub "><a href="//${php_web_domain}/admin/Version?mainmenu=12"><i class="fa fa-cubes"></i><span>Version</span></a></li>
			<li class="has-sub "><a href="javascript:;"><i class="fa fa-key"></i><span>공지사항,FAQ,팝업,뉴스레터</span></a>
				<ul class="sub-menu">					    	
					<li class=""><a href="//${php_web_domain}/admin/NoticeAdd?mainmenu=13&submenu=0">공지관리</a></li> 
					<li class=""><a href="//${php_web_domain}/admin/NoticeFaq?mainmenu=13&submenu=1">FAQ관리</a></li> 
					<li class=""><a href="//${php_web_domain}/admin/NoticePopups?mainmenu=13&submenu=2">팝업관리</a></li> 
					<li class=""><a href="//${php_web_domain}/admin/NoticeNewsletters?mainmenu=13&submenu=3">뉴스레터</a></li> 
				</ul>					
			</li>
			<li class="has-sub "><a href="//${php_web_domain}/admin/HELP?mainmenu=14"><i class="fa fa-th"></i><span>도움말</span></a></li>
			<li class="has-sub "><a href="//${php_web_domain}/admin/Reports?mainmenu=15"><i class="fa fa-cubes"></i><span>Crash Reports</span></a></li>
			<li class="has-sub "><a href="//${php_web_domain}/admin/AdminLogin?mainmenu=16"><i class="fa fa-align-left"></i><span>관리자로그인 기록</span></a></li>
			<li class="has-sub "><a href="//${php_web_domain}/admin/AdminOther?mainmenu=17"><i class="fa fa-star"></i><span>기타</span></a></li>
			<li class="has-sub "><a href="javascript:;"><i class="fa fa-star"></i><span>베타테스트</span></a>
				<ul class="sub-menu">					    	
					<li class=""><a href="//${php_web_domain}/admin/BetaAdd?mainmenu=18&submenu=0">코드받기</a></li> 
					<li class=""><a href="//${php_web_domain}/admin/BetaManage?mainmenu=18&submenu=1">코드관리</a></li> 
					<li class=""><a href="//${php_web_domain}/admin/BetaView?mainmenu=18&submenu=2">신청자보기</a></li> 
				</ul>					
			</li>
			<li class="has-sub "><a href="javascript:;"><i class="fa fa-qq"></i><span>지역 발렛파킹</span></a>
				<ul class="sub-menu">					    	
					<li class=""><a href="//${php_web_domain}/admin/LocalAgentList?mainmenu=19&submenu=0">제휴업체관리</a></li> 
					<li class=""><a href="//${php_web_domain}/admin/LocalAgentPoint?mainmenu=19&submenu=1">발렛포인트관리</a></li> 
					<li class=""><a href="//${php_web_domain}/admin/LocalAgentHistory?mainmenu=19&submenu=2">이용현황</a></li> 
				</ul>					
			</li>
			<li class="has-sub "><a href="javascript:;"><i class="fa fa-building"></i><span>호텔발렛쿠폰 관리</span></a>
				<ul class="sub-menu">					    	
					<li class=""><a href="//${php_web_domain}/admin/HotelValetList?mainmenu=20&submenu=0">호텔관리</a></li> 
					<li class=""><a href="//${php_web_domain}/admin/HotelValetCoupon?mainmenu=20&submenu=1">쿠폰관리</a></li> 
					<li class=""><a href="//${php_web_domain}/admin/HotelValetHistory?mainmenu=20&submenu=2">주문관리</a></li> 
				</ul>					
			</li>
			<li class="has-sub "><a href="//${php_web_domain}/admin/RecommendedPosition?mainmenu=21"><i class="fa fa-thumbs-o-up"></i><span>추천도착위치</span></a></li>
			<li class="has-sub "><a href="//${php_web_domain}/admin/CarWash?mainmenu=22"><i class="fa fa-align-left"></i><span>세차관리</span></a></li>
			<li class="has-sub ">
				<a href="javascript:;"><i class="fa fa-rocket"></i><span>개발도구</span></a>
				<ul class="sub-menu">					    	
					<li class=""><a href="//${php_web_domain}/admin/DevelopToolsRequest?mainmenu=23&submenu=0">요청 관리</a></li> 
					<li class=""><a href="//${php_web_domain}/admin/DevelopToolsSmsGroup?mainmenu=23&submenu=1">SMS 그룹</a></li> 
				</ul>					
			</li>
		</ul>
		<!-- end sidebar nav -->
	</div>
	<!-- end sidebar scrollbar -->
</div>
	</c:when>
	<c:when test="${adminType eq 'cor'}">
<!--  법인 메뉴 -->
<div id="sidebar" class="sidebar">
	<!-- begin sidebar scrollbar -->
	<div data-scrollbar="true" data-height="100%">
		<!-- begin sidebar user -->
		<ul class="nav"><li class="nav-profile"><div class="info"> Admin </div> </li></ul>
		<!-- end sidebar user -->
		<!-- begin sidebar nav -->
		<ul class="nav">					
			<li class="nav-header">Navigation</li>
			<li class="has-sub expand <c:out value="${param.mainmenu == 'm4' ? 'active' : ''}" />">
				<a href="javascript:;"><i class="fa fa-inbox"></i> <span>법인</span> </a>
				<ul class="sub-menu">					    	
					<li class="${param.mainmenu == 'm4' && param.submenu == 's1' ? 'active' : ''}"><a href="//${cor_ui_domain}/cor/history/period?mainmenu=m4&submenu=s1">기간별</a></li> 
					<li class="${param.mainmenu == 'm4' && param.submenu == 's2' ? 'active' : ''}"><a href="//${cor_ui_domain}/cor/history/month?mainmenu=m4&submenu=s2">월별</a></li> 
					<li class="${param.mainmenu == 'm4' && param.submenu == 's3' ? 'active' : ''}"><a href="//${cor_ui_domain}/cor/history/day?mainmenu=m4&submenu=s3">일기준</a></li>
					<li class="${param.mainmenu == 'm4' && param.submenu == 's4' ? 'active' : ''}"><a href="//${cor_ui_domain}/cor/user/list?mainmenu=m4&submenu=s4">사용자조회</a></li> 
					<li class="${param.mainmenu == 'm4' && param.submenu == 's5' ? 'active' : ''}"><a href="//${cor_ui_domain}/cor/account/inquiry?mainmenu=m4&submenu=s5">계정정보</a></li>
					<li class="${param.mainmenu == 'm4' && param.submenu == 's6' ? 'active' : ''}"><a href="//${cor_ui_domain}/cor/account/password?mainmenu=m4&submenu=s6">비밀번호 변경</a></li>  
				</ul>					
			</li>
		</ul>
		<!-- end sidebar nav -->
	</div>
	<!-- end sidebar scrollbar -->
</div>
	
	</c:when>
	<c:when test="${adminType eq 'svc'}">
	<!--  서비스 공급업체 메뉴 . -->
<div id="sidebar" class="sidebar">
	<!-- begin sidebar scrollbar -->
	<div data-scrollbar="true" data-height="100%">
		<!-- begin sidebar user -->
		<ul class="nav"><li class="nav-profile"><div class="info"> Admin </div> </li></ul>
		<!-- end sidebar user -->
		<!-- begin sidebar nav -->
		<ul class="nav">					
			<li class="nav-header">Navigation</li>
			<li class="has-sub expand <c:out value="${param.mainmenu == 'm5' ? 'active' : ''}" />">
				<a href="javascript:;"><i class="fa fa-inbox"></i> <span>메뉴</span> </a>
				<ul class="sub-menu" style="display:block;">					    	
					<li class="${param.mainmenu == 'm5' && param.submenu == 's1' ? 'active' : ''}"><a href="//${svc_ui_domain}/svc/history/period?mainmenu=m5&submenu=s1">기간별</a></li> 
					<li class="${param.mainmenu == 'm5' && param.submenu == 's2' ? 'active' : ''}"><a href="//${svc_ui_domain}/svc/history/month?mainmenu=m5&submenu=s2">월별</a></li> 
					<li class="${param.mainmenu == 'm5' && param.submenu == 's3' ? 'active' : ''}"><a href="//${svc_ui_domain}/svc/history/day?mainmenu=m5&submenu=s3">일기준</a></li>
					<li class="${param.mainmenu == 'm5' && param.submenu == 's4' ? 'active' : ''}"><a href="//${svc_ui_domain}/svc/account/inquiry?mainmenu=m5&submenu=s4">계정정보</a></li>
					<li class="${param.mainmenu == 'm5' && param.submenu == 's5' ? 'active' : ''}"><a href="//${svc_ui_domain}/svc/account/password?mainmenu=m5&submenu=s5">비밀번호 변경</a></li>  
				</ul>					
			</li>
		</ul>
		<!-- end sidebar nav -->
	</div>
	<!-- end sidebar scrollbar -->
</div>
	</c:when>
</c:choose>

<div class="sidebar-bg"></div>
<!-- end #sidebar -->