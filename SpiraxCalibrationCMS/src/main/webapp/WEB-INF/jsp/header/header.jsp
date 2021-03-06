<%@page import="com.spiraxcalibration.WebConfig.AppsPropertyFile"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Spirax Sarco</title>
<link rel="icon" href="favicon.ico" type="image/x-icon"/>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>

#searchBtnCss {
	color: white;
	font-family: Cambria;
	font-size: 16px;
	font-weight: bold;
}

#headingCSS {
	color: #20B2AA;
	font-family: Cambria;
	font-size: 22px;
}

#formtitle {
	color: black;
	font-family: Cambria;
	font-size: 22px;
	font-weight: bold;
}

#hrefCss {
	color: #48D1CC;
	font-family: Cambria;
	font-size: 16px;
	font-weight: bold;
}

#hereCss {
	color: black;
	font-family: Cambria;
	font-size: 16px;
	font-weight: bold;
}

#searchboxCss {
	color: black;
	font-family: Cambria;
	font-size: 16px;
	font-weight: bold;
}

#messageCss {
	font-family: Cambria;
	font-size: 16px;
	font-weight: bold;
}

#errorMsgCss {
	font-family: Cambria;
	font-size: 16px;
	font-weight: bold;
	color: red;
}

#successMsgCss {
	font-family: Cambria;
	font-size: 16px;
	font-weight: bold;
	color: green;
}

body {
	margin: 0;
	font-family: Arial, Helvetica, sans-serif;
}

.topnav {
	overflow: hidden;
	background-color: #e9e9e9;
}

.topnav a {
	float: left;
	display: block;
	color: black;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
	font-size: 17px;
}

.topnav a:hover {
	background-color: #ddd;
	color: black;
}

.topnav a.active {
	background-color: #20B2AA;
	color: white;
}

.topnav .search-container {
	float: right;
}

.topnav input[type=text] {
	padding: 6px;
	margin-top: 8px;
	font-size: 17px;
	border: none;
}

.topnav .search-container button {
	float: right;
	padding: 6px 10px;
	margin-top: 8px;
	margin-right: 16px;
	background: #ddd;
	font-size: 17px;
	border: none;
	cursor: pointer;
}

.topnav .search-container button:hover {
	background: #ccc;
}

@media screen and (max-width: 600px) {
	.topnav .search-container {
		float: none;
	}
	.topnav a, .topnav input[type=text], .topnav .search-container button {
		float: none;
		display: block;
		text-align: left;
		width: 100%;
		margin: 0;
		padding: 14px;
	}
	.topnav input[type=text] {
		border: 1px solid #ccc;
	}
}

#welcomeCss {
	color: black;
	font-family: Cambria;
	font-size: 22px;
	font-weight: bold;
}

#loggedinCss {
	color: #20B2AA;
	font-family: Cambria;
	font-size: 20px;
	font-weight: bold;
}

#loginbtnCss {
	color: white;
	font-family: Cambria;
	font-weight: bold;
	font-size: 16px;
	background-color: #20B2AA;
}

#homeCss {
	color: white;
	font-family: Cambria;
	font-weight: bold;
	font-size: 18px;
}
</style>
</head>


<body>

	<div class="topnav">

		<%
			AppsPropertyFile appsPropertyFile = new AppsPropertyFile();
		%>

		<a class="active"
			href=<%=appsPropertyFile.getURLForKey("homePageURL")%> id="homeCss">Home</a>


		<div class="row">
			<div class="col-sm-11" align="right">

				<h4 id="welcomeCss">
					Welcome : <b id="loggedinCss"> <security:authentication
							property="principal.username" />
					</b>
				</h4>
			</div>
			<div class="col-sm-1" align="right">
				<form:form method="post"
					action="${pageContext.request.contextPath}/logout" id="nameform">
					<input type="submit" value="Logout" class="btn btn-default"
						style="background-color: #20B2AA; margin-top: 8px;"
						id="loginbtnCss" />
				</form:form>
			</div>

		</div>
		<!--  
		<div class="search-container">
			<form action="/action_page.php">
				<input type="text" placeholder="Search.." name="search">
				<button type="submit">
					<i class="fa fa-search"></i>
				</button>
			</form>
		</div>
		-->
	</div>
</body>
</html>