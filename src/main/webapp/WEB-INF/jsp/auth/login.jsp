<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/include/taglib.jsp"  %>
<%-- viewType 에 따라 타이틀 및 loginActionPath 를 변경한다.  --%>
<!DOCTYPE>
<html>
<head>
		<meta charset="utf-8">
		<title>${title}</title>
		<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport">
		<meta content="" name="description">
		<meta content="" name="author">
		
		<!-- ================== BEGIN BASE CSS STYLE ================== -->
		<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
		<link href="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/jquery-ui/themes/base/minified/jquery-ui.min.css" rel="stylesheet">
		<link href="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link href="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
		<link href="//${asset_static_domain}${pageContext.request.contextPath}/assets/css/animate.min.css" rel="stylesheet">
		<link href="//${asset_static_domain}${pageContext.request.contextPath}/assets/css/style.min.css" rel="stylesheet">
		<link href="//${asset_static_domain}${pageContext.request.contextPath}/assets/css/style-responsive.min.css" rel="stylesheet">
		<link href="//${asset_static_domain}${pageContext.request.contextPath}/assets/css/theme/default.css" rel="stylesheet" id="theme">
		<link href="//${asset_static_domain}${pageContext.request.contextPath}/assets/css/custom.css" rel="stylesheet">
		<link href="//${asset_static_domain}${pageContext.request.contextPath}/assets/css/jquery.fileupload.css" rel="stylesheet">
		<!-- ================== END BASE CSS STYLE ================== -->
		
		<!-- ================== BEGIN PAGE LEVEL STYLE ================== -->
		<link href="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/jquery-jvectormap/jquery-jvectormap-1.2.2.css" rel="stylesheet">
		<link href="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/bootstrap-datepicker/css/datepicker.css" rel="stylesheet">
		<link href="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/bootstrap-datepicker/css/datepicker3.css" rel="stylesheet">
	    <link href="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/gritter/css/jquery.gritter.css" rel="stylesheet">
	    <link href="//${asset_static_domain}${pageContext.request.contextPath}/assets/css/bootstrap-datetimepicker.css" rel="stylesheet">
		<!-- ================== END PAGE LEVEL STYLE ================== -->
		<script src="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/jquery/jquery-1.9.1.min.js"></script>
		
	<style id="style-1-cropbar-clipper">/* Copyright 2014 Evernote Corporation. All rights reserved. */
.en-markup-crop-options {
    top: 18px !important;
    left: 50% !important;
    margin-left: -100px !important;
    width: 200px !important;
    border: 2px rgba(255,255,255,.38) solid !important;
    border-radius: 4px !important;
}

.en-markup-crop-options div div:first-of-type {
    margin-left: 0px !important;
}
</style></head>
<body>
	<script>mixpanel.track("login");</script>

	
	<div class="login-cover">
	    <div class="login-cover-image"><img src="//${asset_static_domain}${pageContext.request.contextPath}/assets/img/login-bg/bg-1.jpg" data-id="login-cover-image"></div>
	    <div class="login-cover-bg"></div>
	</div>
	<!-- begin #page-container -->
	<div id="page-container" class="fade in">
	    <!-- begin login -->
        <div class="login login-v2 animated fadeIn" data-pageload-addclass="animated fadeIn">
            <!-- begin brand -->
            <div class="login-header">
                <div class="brand">
                    <span class="logo"></span> ${title} 
                    <small>This is ${title}!</small>
                </div>
                <div class="icon">
                    <i class="fa fa-sign-in"></i>
                </div>
            </div>
            <!-- end brand -->
            <div class="login-content">
				<form   action="${pageContext.request.contextPath}${actionPath}" 
						name="loginForm" method="POST" class="margin-bottom-0" onsubmit="document.loginForm.submit();return false;">
						<input type="hidden" name="redirectUrl" value="${redirectUrl}"/>
                    <div class="form-group m-b-20">
                        <input 	type="text" 
                        		name="username" 
                        		class="form-control input-lg" 
                        		placeholder="id" 
                        		required="required"  
                        		oninvalid="this.setCustomValidity('<spring:message code="parameter.required" arguments="아이디"></spring:message>')" 
                        		oninput="setCustomValidity('')">
                    </div>
                    <div class="form-group m-b-20">
                        <input type="password" 
                        		name="password" 
								class="form-control input-lg" 
                        		placeholder="Password" required="required"
                        		oninvalid="this.setCustomValidity('<spring:message code="parameter.required" arguments="비밀번호"></spring:message>')" 
                        		oninput="setCustomValidity('')">
                    </div>                    
                    <c:if test="${not empty ___LOGIN_ERROR_MSG_KEY___}">
						<div class="form-group m-b-20">
							<span>${___LOGIN_ERROR_MSG_KEY___}</span>
						</div>                    
                    </c:if>
                    <div class="login-buttons">
                        <button type="submit" class="btn btn-success btn-block btn-lg">Login</button>
                    </div>                    
                </form>
            </div>
        </div>
        <!-- end login -->
        
	</div>
	<!-- end page container -->	
	<script src="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/jquery/jquery-migrate-1.1.0.min.js"></script>
	<script src="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/jquery-ui/ui/minified/jquery-ui.min.js"></script>
	<script src="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script src="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<script src="//${asset_static_domain}${pageContext.request.contextPath}/assets/plugins/jquery-cookie/jquery.cookie.js"></script>
	<!-- ================== BEGIN PAGE LEVEL JS ================== -->
	<script src="//${asset_static_domain}${pageContext.request.contextPath}/assets/js/login-v2.demo.min.js"></script>
	<script src="//${asset_static_domain}${pageContext.request.contextPath}/assets/js/apps.min.js"></script>
	<!-- ================== END PAGE LEVEL JS ================== -->
	<script>
		$(document).ready(function() {
			App.init();
			LoginV2.init();
		});
	</script>
	
</body>
</html>