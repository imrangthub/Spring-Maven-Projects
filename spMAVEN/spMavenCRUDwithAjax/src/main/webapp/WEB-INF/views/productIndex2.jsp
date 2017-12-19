<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product | Home</title>
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
<div id="container" class="col-md-8 col-md-offset-2">
<h1>Product List</h1>

<a href="/spMavenCRUDwithAjax/create">Add Product</a></br>
<!-- Trigger the modal with a button -->
<button type="button" class="btn btn-info btn-lg pull-right" data-toggle="modal" data-target="#myModal">Add new</button>


<div>
<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
   <form id="create-form" class="form-horizontal">
   <input type="hidden" name="id" id="id" />
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Create Product</h4>
      </div>
      <div class="modal-body">
        <div>
	      <div class="col-sm-10">
	      <div class="form-group">
	        <label class="control-label col-sm-4">Name</label>
	        <div class="col-sm-8">
	          <input type="text" id="productName" class="form-control" name="productName" value="${product.productName}" />
	        </div>
	      </div>
	       <div class="form-group">
	        <label class="control-label col-sm-4">Decription</label>
	        <div class="col-sm-8">
	          <input type="text" id="description" class="form-control" name="description" value="${product.description}" />
	        </div>
	      </div>
	       <div class="form-group">
	        <label class="control-label col-sm-4">Price</label>
	        <div class="col-sm-8">
	          <input type="text" id="price" class="form-control" name="price" value="${product.price}" />
	        </div>
	      </div>
	      <div class="form-group">
	        <label class="control-label col-sm-4">Quantity</label>
	        <div class="col-sm-8">
	          <input type="text" id="qty" class="form-control"  name="qty" value="${product.qty}" />
	        </div>
	      </div>
	    </div>
	       <div class="form-group"> 
	        <div class="col-sm-offset-2 col-sm-8">
	        </div>
	      </div>
      </div>               
      </div>
      <div class="modal-footer">
        <button type="button" id="submitBtn" class="btn btn-success" data-dismiss="modal">Save</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </form>
  </div>
</div>
</div>


<div style="width:500px; margin:auto" id="list-table">
	<table align="left" border="1" id="productTable">
		<tr>
			<th>Product ID</th>
			<th>Product Name</th>
			<th>Description</th>
			<th>Product price</th>
			<th>Product Quantity</th>
			<th> Action </th>
		</tr>
	</table>
</div>
</div>
<script>
 $(document).ready(function(){
	 
	load();
	 
	 $("#submitBtn").click(function(e){ 
		 $.ajax({
			 url:'add',
			 type:'POST',
			 data:$("#create-form").serialize(),
			 success: function(data){
				 alert(data.successMsg);
			 }
			 
		 });
		 e.preventDefault();
	 });
	 $('#list-table').on('click', 'a.delete-reference', function (e) {
         var control = this;
         var referenceId = $(control).attr('referenceId');
         $.ajax({
        	 url:"delete/"+referenceId,
        	 type:"GET",
             success:function(data){
            	 alert(data.successMsg);
             } 
         });
     
     e.preventDefault();
      });
	 
	 $('#list-table').on('click', 'a.edit-reference', function (e) {
             var control = this;
             var referenceId = $(control).attr('referenceId');
             $.ajax({
            	 url:"edit/"+referenceId,
            	 type:"GET",
                 success:function(data){
                	 $("#id").val(data.product.id);
                	 $('#productName').val(data.product.productName);
                	 $("#description").val(data.product.description);
                	 $("#price").val(data.product.price);
                	 $("#qty").val(data.product.qty);
                	 $("#myModal").modal('show');
                 } 
             });
         
         e.preventDefault();
     });
	
 });
 var load = function(){
	 $.ajax({
		 url:'list',
		 type:'POST',
		 success: function(data){
			 for(i=0; i<data.products.length; i++){
				  $("#productTable").append(
					"<tr><td>"+data.products[i].id+"</td><td>"+data.products[i].productName+"</td><td>"+data.products[i].price+"</td><td>"+data.products[i].qty+"</td><td>"+data.products[i].productName+"</td><td>"+data.products[i].productName+"</td></tr>"	  
				  );
			  }
		 }
		 
	 });
	 
	  
 }
</script>
</body>
</html>