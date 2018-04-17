<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="common" tagdir="/WEB-INF/tags/common" %>

<%-- using application.properties in jsp --%>
<spring:eval expression="@environment.getProperty('assets.static.domain')" var="asset_static_domain" />
<spring:eval expression="@environment.getProperty('parkingon.php.api.domain')" var="php_api_domain" />
<spring:eval expression="@environment.getProperty('parkingon.php.web.domain')" var="php_web_domain" />
<spring:eval expression="@environment.getProperty('parkingon.cms.api.domain')" var="cms_api_domain" />
<spring:eval expression="@environment.getProperty('parkingon.cms.ui.domain')" var="cms_ui_domain" />
<spring:eval expression="@environment.getProperty('parkingon.cor.ui.domain')" var="cor_ui_domain" />
<spring:eval expression="@environment.getProperty('parkingon.svc.ui.domain')" var="svc_ui_domain" />
<spring:eval expression="@environment.getProperty('parkingon.partner.ui.domain')" var="partner_ui_domain" />