<%@ tag language="java" pageEncoding="UTF-8" body-content="scriptless"   trimDirectiveWhitespaces="true"  %>
<%@include file="/WEB-INF/jsp/include/taglib.jsp"  %>
<body data-dotifysource="/admin/dotifytest">
	<div data-dotify="did"></div>
	<!-- begin #page-loader -->
	<div id="page-loader" ><span class="spinner"></span></div>
	<!-- end #page-loader -->

	<!-- begin #page-container -->
	<div id="page-container" class="page-sidebar-fixed page-header-fixed">
		<common:header></common:header>
		<common:sidebar></common:sidebar>
		
		<!-- 여기에 내용이 추가됩니다. -->
		<jsp:doBody />

		<!-- begin scroll to top btn -->
		<a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i class="fa fa-angle-up"></i></a>
		<!-- end scroll to top btn -->
	</div>
	<!-- end page container -->


	<script type="text/javascript">
	$(document).ready( function() {
		App.init();
	});
	</script>
</body>

