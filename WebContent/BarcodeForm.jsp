<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	
	 <%@ page isELIgnored="false" %>
	 <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
  
   <%@ page import="models.ItemsBarcode,helpers.Constants" %>
    <% ItemsBarcode itemBarcode = (ItemsBarcode) request.getAttribute("itemBarcode"); %>
	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Edit Barcode</title>
	<meta charset="UTF-8">
	
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" type="image/ico" href="<c:url value="/Img?name=favicon"></c:url>"/>
	

	
	
	<style type="text/css">
	body {
		color: #566787;
		background-color: #344a71;
		background: #344a71;
		font-family: 'Roboto', sans-serif;
	}
	.form-control {		
		min-height: 41px;
/* 		box-shadow: none; */
		border-color: #e1e4e5;
	}
	.form-control:focus {
		border-color: #49c1a2;
	}
	.form-control, .btn {        
        border-radius: 3px;
    }
	.layout-form {
		max-width: 800px;
		margin: 0 auto;
		padding: 30px 0;
	}
	.layout-form form {
		color: #9ba5a8;
		border-radius: 3px;
    	margin-bottom: 15px;
        background: #fff;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        padding: 30px;
    }
	.layout-form h2 {
		color: #333;
		font-weight: bold;
        margin-top: 0;
    }
    .layout-form hr {
        margin: 0 -30px 20px;
    }    
	.layout-form .form-group {
		margin-bottom: 20px;
	}
	.layout-form label {
		font-weight: normal;
		font-size: 13px;
	}
	.layout-form .btn {        
        font-size: 16px;
        font-weight: bold;
		background: #49c1a2;
		border: none;
		min-width: 140px;
    }
	.layout-form .btn:hover, .signup-form .btn:focus {
		background: #3cb094;
        outline: none !important;
	}
	.layout-form a {
		color: #fff;
		text-decoration: underline;
	}
	.layout-form a:hover {
		text-decoration: none;
	}
	.layout-form form a {
		color: #49c1a2;
		text-decoration: none;
	}	
	.layout-form form a:hover {
		text-decoration: underline;
	}
		</style>
<%-- <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="style.css" rel="stylesheet" type="text/css">
<style><%@include file="/resources/css/main.css"%></style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<title>Insert title here</title> --%>
<script type="text/javascript">

</script>
<link href="${contextPath}/resource/bootstrap.min.css" rel="stylesheet">

</head>
<body style="background: #344a71">
	<%@ include file="/_shared/LeftBar.jsp"%>
	<form action="ItemDetails" method="get" >
		<input type="hidden" name="itemGroupId" value="${requestScope.itemGroupId}" />
		<button type="submit" class="btn btn-primary">Back to the Item</button>
	</form>
	<div class="layout-form">



	<form action="${requestScope.action}" method="POST">
		<h2>Update Barcode Piece</h2>
		<input type="hidden" name="barcodeId" value="${requestScope.model.id}" />
		<input type="hidden" name="itemGroupId" value="${requestScope.itemGroupId}" />
		<div class="form-group">
		 	<label>Name:</label>
			<input type="text" class="form-control" name="itemName" placeholder="Item Name" value="${requestScope.model.itemName}"> <BR>
		   <c:if test="${not empty requestScope.errName}">
			<br/><span>${requestScope.errName}</span>
		   </c:if>
		</div>
				
			
		
    	<div class=" form-group">

			<label>Description:</label>
			<textarea  rows="4" class="form-control" placeholder="Enter text here..." name="description" >${requestScope.model.comments}</textarea>
			<!--  <td><input type="text" name="description"> <BR></td> -->
			<c:if test="${not empty requestScope.errComments}">
				<br/><span >${requestScope.errComments}</span>
			</c:if>
		</div>

		<div class=" form-group">
		  	<label >Condition:</label>
		 	<input type="text" class="form-control" name="condition" placeholder="Condition"  value="${requestScope.model.condition}" > <BR>
			<c:if test="${not empty requestScope.errCondition}">
				<br/><span >${requestScope.errCondition}</span>
			</c:if>
		</div>
		
			
			
        
		<input type="submit" value="Update Item" class="btn btn-primary btn-block btn-lg">
	</form>
		
		
	
	</div>
	<footer class="page-footer font-small" style="background-color: #f5f5f5;">
		<div class="footer-copyright text-center py-4" style="align-items: center;">
			<a> © 2021 Internet Explorers </a>
		</div>
	</footer>
</body>
</html>	