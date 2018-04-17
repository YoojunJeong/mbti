<%@ tag language="java" pageEncoding="UTF-8" body-content="tagdependent"   trimDirectiveWhitespaces="true"  %>
<%@include file="/WEB-INF/jsp/include/taglib.jsp"  %>
<!-- begin #header -->
<div id="header" class="header navbar navbar-default navbar-fixed-top">
	<!-- begin container-fluid -->
	<div class="container-fluid">
		<!-- begin mobile sidebar expand / collapse button -->
		<div class="navbar-header">
  
<c:choose>
	<c:when test="${adminType eq 'cms'}">
	   <a href="//${php_web_domain}/admin/Dashboard?mainmenu=0" class="navbar-brand"><span class="navbar-logo"></span> ParkingOn Admin</a>
    </c:when>
	<c:when test="${adminType eq 'cor'}">
	   <a href="//${cor_ui_domain}/cor/history/period?mainmenu=m4&submenu=s1" class="navbar-brand"><span class="navbar-logo"></span> ParkingOn Admin</a>
    </c:when>
	<c:when test="${adminType eq 'svc'}">
	   <a href="//${svc_ui_domain}/sub_cor/history/sub_period?mainmenu=m5&submenu=s1" class="navbar-brand"><span class="navbar-logo"></span> ParkingOn Admin</a>
    </c:when>
</c:choose>
  
			<button type="button" class="navbar-toggle" data-click="sidebar-toggled">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
		</div>
		<!-- end mobile sidebar expand / collapse button -->
		<ul class="nav navbar-nav navbar-right">					
			<li class="dropdown navbar-user">
				<c:choose>
					<c:when test="${adminType eq 'cms'}">
						<a href="//${cms_ui_domain}/auth/${adminType}/logout"><span class="hidden-xs">로그아웃</span></a>						
					</c:when>
					<c:when test="${adminType eq 'cor'}">
						<a href="//${cor_ui_domain}/auth/${adminType}/logout"><span class="hidden-xs">로그아웃</span></a>						
					</c:when>
					<c:when test="${adminType eq 'svc'}">
						<a href="//${svc_ui_domain}/auth/${adminType}/logout"><span class="hidden-xs">로그아웃</span></a>						
					</c:when>
				</c:choose>
			</li>
		</ul>
	</div>
	<!-- end container-fluid -->
</div>
<!-- end #header -->
