<%@page import="javax.sound.midi.SysexMessage"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  trimDirectiveWhitespaces="true" %>
<%@include file="/WEB-INF/jsp/include/taglib.jsp" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko">
	<common:head>
		<title>ParkingOn ___Admin</title>
	</common:head>
	<common:body>
		<c:import url="${includePath}" charEncoding="UTF-8">
		<c:param name="mainmenu" value="${mainmenu}"/>
		<c:param name="submenu" value="${submenu}"/>
		<c:param name="idx" value="${idx}"/>
		</c:import>
	</common:body>
</html>  