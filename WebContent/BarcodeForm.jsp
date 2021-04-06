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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<title>Insert title here</title>
<script type="text/javascript">
function toggleSidebar(){
	document.getElementById("sidebar").classList.toggle('active');
}
</script>
<link href="${contextPath}/resource/bootstrap.min.css" rel="stylesheet">

</head>
<body>
<%--<%@ include file="/_shared/message.jsp"%>  --%>
 
<div id="sidebar">
<div class="toggle-btn" onclick="toggleSidebar()">
<span></span>
<span></span>
<span></span>
</div>
<ul>
<li>Home</a></li>
<li><a href="addItem">Add Item</a></li>
<li><a href="readItem"> Item List</a></li>
</ul>
</div>
 
	
	<div class="container">
	 <div class="card">
   <div class="card-body">
<h1 id="iS">Inventory Management System</h1>
<h2 id="iS">Update Item description</h2>

	<form  action="${requestScope.action}" method="POST">
	<table align ="center">
	
	<div class="form-group row">
	 <label class="col-sm-2 col-form-label">Item Name:</label>
	         <div class="col-sm-7">
			<input type="text" name="itemName" placeholder="Item Name" value="${requestScope.model.itemName}"> <BR>
			   <c:if test="${not empty requestScope.errName}">
				<br/><span>${requestScope.errName}</span>
			   </c:if>
			</div>
			 </div>
			
		
    <div class=" form-group row">

			<label  class="col-sm-2 col-form-label" >Description:</label>
			<div class="col-sm-7">	
			<textarea  rows="4" cols="30" placeholder="Enter text here..." name="description"  value="${requestScope.model.comments}" ></textarea>
			<!--  <td><input type="text" name="description"> <BR></td> -->
			<c:if test="${not empty requestScope.errComments}">
				<br/><span >${requestScope.errComments}</span>
			</c:if>
			</div>
			</div>
			<div class=" form-group row">
		  <label class="col-sm-2 col-form-label" > Condition:</label>
		  <div class="col-sm-7">
			<input type="text" name="condition" placeholder="Condition"  value="${requestScope.model.condition}" > <BR>
			<c:if test="${not empty requestScope.errCondition}">
				<br/><span >${requestScope.errCondition}</span>
			</c:if>
			</div>
			</div>
			
			
        
		<td><input type="submit" value="Update Item" id="addItem"></td><span class="SucCtlMsg">${requestScope.SucCtlMsg}</span>
		  
		
	</table> 	
	</form>
		
		
	
	</div>
	</div>
	</div>
</body>
</html>	