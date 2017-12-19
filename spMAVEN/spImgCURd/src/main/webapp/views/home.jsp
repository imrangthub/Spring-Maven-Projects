<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome | Page</title>
<!-- bootstrap -->
    <spring:url value="/resources/bootstrap/css/bootstrap.min.css" var="bootstrapCss" />
    <spring:url value="/resources/bootstrap/js/bootstrap.min.js" var="bootstrapJs" />
        <spring:url value="/resources/js/jquery-2.1.3.min.js" var="jqueryJs" />
	<link href="${bootstrapCss}" rel="stylesheet" />
	<script src="${jqueryJs}"></script>
    <script src="${bootstrapJs}"></script>
<!-- local -->
    <spring:url value="/resources/css/application.css" var="mainCss" />
    <spring:url value="/resources/imgFolder/been.jpg" var="been" />
	<link href="${mainCss}" rel="stylesheet" />
</head>
<body>

<h1 align="center">welcome Page</h1></hr>
${msg }
<br>


<div class="row well">  <!-- Start row -->

 <div class="col-md-4 col-md-offset-4">
  <div>
    <form action="/spImgCURd/uploadImage" method="POST" enctype="multipart/form-data" class="form-horizontal" id="postForms">
   
    <div class="form-group">  
     <label class="control-label">Title:</label>
     <input type="text" id="title" name="title" class="form-control" title="Here will your post title."> 
     <span class="msg" id="title"></span>       
    </div>   
    
    <div class="form-group">  
    <label class="control-label">Image:</label>
    <input type="file" id="file" name="file" class=" ">
    </div>
    
    <div class="form-group">
    <input type="submit" value="Save now" class="btn btn-success btn-lg btn-block">
    </div>
   </form>
 
 </div> 
 </div>
  
  
</div> <!-- End Blog body row -->



<script>
$(document).ready(function(){
    $("#btn1").click(function(){
        alert("You Click the Botton.");
    });
});
</script>

</body>
</html>