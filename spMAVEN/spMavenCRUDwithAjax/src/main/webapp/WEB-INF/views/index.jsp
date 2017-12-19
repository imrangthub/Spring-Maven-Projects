<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PROJECT | HOME</title>
<!-- bootstrap -->
    <spring:url value="/resources/bootstrap/css/bootstrap.min.css" var="bootstrapCss" />
    <spring:url value="/resources/bootstrap/js/bootstrap.min.js" var="bootstrapJs" />
        <spring:url value="/resources/js/jquery-2.1.3.min.js" var="jqueryJs" />
	<link href="${bootstrapCss}" rel="stylesheet" />
	<script src="${jqueryJs}"></script>
    <script src="${bootstrapJs}"></script>
<!-- local -->
    <spring:url value="/resources/css/application.css" var="mainCss" />
	<link href="${mainCss}" rel="stylesheet" />
</head>
<body>
<h1 align="center">Welcome to Spring Hibernate CRUD</h1><hr>

<a href="/spMavenCRUDwithAjax/product">Product | Home</a><br>




<script>
 $(document).ready(function(){
	
 });
</script>
</body>
</html>