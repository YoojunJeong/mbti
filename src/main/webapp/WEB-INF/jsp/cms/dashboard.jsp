<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  trimDirectiveWhitespaces="true" %>
<%@include file="/WEB-INF/jsp/include/taglib.jsp" %>
<c:set var="DOLLER" value="$"></c:set>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko">
 	<common:head> 
 		<title>ParkingOn ___Admin</title> 
 	</common:head> 
	<common:body>
	<div class="content">
		<div class="page-header"> 외부HTML 컨텐츠 Include Sample 입니다. </div>
		<pre>
		
// 아래와 같이 Controller 에서 ModelAndView 설정 
ModelAndView mav = new ModelAndView();
mav.setViewName("cms/dashboard");

// include 하고싶은 외부 http URL을 includePath 프로퍼티로 설정..
mav.addObject("includePath", "http://192.168.0.52:8080/admin/mms");

// JSP 에서는.. url property 에 ${DOLLER}{includePath}
&lt;c:import url="${DOLLER}{includePath}" charEncoding="UTF-8"&gt;&lt;/c:import&gt;
		</pre>
	</div>

		<c:import url="${includePath}" charEncoding="UTF-8"></c:import>
	</common:body>

</html>  