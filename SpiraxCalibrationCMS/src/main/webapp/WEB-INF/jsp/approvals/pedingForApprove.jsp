<%@page import="java.util.List"%>
<%@page import="com.spiraxcalibration.controllers.PrController"%>
<%@page import="com.spiraxcalibration.WebConfig.AppsPropertyFile"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<!-- Bootstrap CSS CDN -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">

<!-- Our Custom CSS -->
<link rel="stylesheet" href="customcss/style.css">
<link rel="stylesheet" href="customcss/search.css">
<link rel="stylesheet" href="customcss/equipmentList.css">
<link rel="stylesheet" href="customcss/htmltable.css">

<!-- Scrollbar Custom CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">

<!-- Font Awesome JS -->
<script defer
	src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js"></script>

<script defer
	src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script src="static/bootstrap/js/jquery-3.3.1.js"></script>
<script src="static/bootstrap/js/bootstrap.min.js"></script>
<script src="static/bootstrap/js/jquery-1.7.1.min.js"></script>

<spring:url value="bootstrap/css/bootstrap.min.css"
	var="bootstrapCssURL"></spring:url>
<link href="${bootstrapCssURL}" rel="stylesheet">


</head>
<body>

	<div id="header">
		<jsp:include page="/WEB-INF/jsp/header/header.jsp" />
	</div>
	<div class="container-fluid">
		<span>You are here : </span>
		<%
			AppsPropertyFile appsPropertyFile = new AppsPropertyFile();
		%>
		<span><a href=<%=appsPropertyFile.getURLForKey("homePageURL")%>>Home</a></span><span>
			/</span> <span><a
			href=<%=appsPropertyFile.getURLForKey("ApprovalList")%>>Approval
				List</a></span>
						<h3 align="center"><b>Approval List</b></h3>
				 <br>
		<div class="row">
			<form method="Post" action="/search_Active_Product">
				<div class="container">
					<div class="row">
						<div class="col-md-auto">
							<label for="usr">IdentiFication Number :</label> <select class="form-control"
								name="identificationNum" style="height: 33px; width: 300px;">
								<option value="" style="display: none">-- Select
									Identification Number --</option>
								<c:forEach items="${productList}" var="product">
									<option value="${product.calibIdentificationNo}">${product.calibIdentificationNo}</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-md-auto">
							<label for="usr">Serial Number:</label> <select
								class="form-control" name="serialNum"
								style="height: 33px; width: 300px;">
								<option value="" style="display: none">-- Select
									Serial Number --</option>
								<c:forEach items="${productList}" var="product">
									<option value="${product.calibSerialNumber}">${product.calibSerialNumber}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					
					<div class="row">
						<div class="col">
							<br> <input type=submit value="Search" class="btn btn-info"
								class="form-control"> <input type="button"
								class="btn btn-warning" name="reset_form" value="Clear"
								onclick="this.form.reset();">
						</div>
						<div class="col-12"></div>

					</div>
				</div>
				
			</form>
		</div>
		
		
		<br>
		<div align="center">
			<b style="color: green; font-size: 15px;">${msg}</b>
		</div>
		<div style="overflow-x: auto;">
			<spring:url value="/calibrationlist" var="listURL" />
			<display:table name="productList" id="displaytable"
				requestURI="${listURL}" pagesize="10" class="table">

				<display:column title="Action">
					<spring:url value="/calibApprovalPage/${displaytable.calibId}"
						var="CalibrateURL"></spring:url>
					<a href="${CalibrateURL}"><button type="button"
							class="btn btn-primary">Approve / Reject</button></a>
				</display:column>
				<display:column title="Sr. no.">
					<c:out value="${displaytable_rowNum}" />
				</display:column>
				<display:column property="calibIdentificationNo"
					title="Identification Number"></display:column>
				<display:column property="calibSerialNumber" title="Serial Number"></display:column>
				<display:column property="calibSupplierName" title="Supplier Name"></display:column>
				<display:column property="calibCalibStatus"
					title="Calibration Status"></display:column>

			</display:table>

			<spring:url value="bootstrap/js/bootstrap.min.js" var="boostrapJsURL"></spring:url>
			<spring:url value="bootstrap/js/jquery-1.7.1.min.js"
				var="jqueryJsURL"></spring:url>
			<script src="${boostrapJsURL}"></script>
			<script src="${jqueryJsURL}"></script>
		</div>
	</div>
</body>
</html>