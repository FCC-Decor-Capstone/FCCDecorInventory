<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@ page import="models.ItemSupplier" %>
   <%
   	ItemSupplier supplier = (ItemSupplier) request.getAttribute("Supplier");
   %>
	
	 <%@ page isELIgnored="false" %>
	 <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
  
   <%@ page import="models.Item,helpers.Constants" %>
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
<h2 id="iS">Add Items</h2>

	<form  action="${requestScope.action}" method="POST">
	<table align ="center">
	
	<div class="form-group row">
	 <label class="col-sm-2 col-form-label">Item Name:</label>
	         <div class="col-sm-7">
			<input type="text" name="itemName" placeholder="Item Name" value="${requestScope.model.itemName}"> <BR>
			   <c:if test="${not empty requestScope.errName}">
				<br/><span class="err rmdT">${requestScope.errName}</span>
			   </c:if>
			</div>
			 </div>
			
		 <div class=" form-group row">
		<label class="col-sm-2 col-form-label">Category:</label>	
			
			
		<div class="col-sm-7">	
	<select name="category" id="category"  >
  <option  value="Master">Master</option>
  <option value="Maint $ Supply">Maint $ Supply</option>
  <option value="serveware catering">serveware catering</option>
  <option value="indian statues and props">indian statues and props</option>
  <option value="florals">florals</option>
  <option value="Centerpiece & Glass Vase">Centerpiece & Glass Vase	</option>
    <option value="Furniture & Misc">Furniture & Misc</option>
     <option value="Kissing Balls">Kissing Balls</option>
     <option value="Charger Plate and Misc">Charger Plate and Misc</option>
     <option value="Sashes Runners Chair Cover">Sashes Runners Chair Cover</option>
     <option value="tablecloth">tablecloth</option>
     <option value="Skirting">Skirting</option>
     <option value="Backdrop Fabrics">Backdrop Fabrics</option>
     <option value="Pipe and Drape">Pipe and Drape</option>
</select>
</div>
</div>
    <div class=" form-group row">

			<label  class="col-sm-2 col-form-label" >Description:</label>
			<div class="col-sm-7">	
			<textarea  rows="4" cols="30" placeholder="Enter text here..." name="description"  value="${requestScope.model.description}" ></textarea>
			<!--  <td><input type="text" name="description"> <BR></td> -->
			</div>
			</div>
			<div class=" form-group row">
		  <label class="col-sm-2 col-form-label" > Initial Cost:</label>
		  <div class="col-sm-7">
			<input type="text" name="initialCost" value="${requestScope.model.initialCost}" > <BR>
			</div>
			</div>
			<div class=" form-group row">
			<label  class="col-sm-2 col-form-label" >Size:</label>
			<div class="col-sm-7">
			<input type="text" name="size" value="${requestScope.model.size}"> <BR>
			</div>
			</div>
			<div class=" form-group row">
			<label class="col-sm-2 col-form-label" >Colour:</label>
			<div class="col-sm-7">
			 <input type="text" name="color" value="${requestScope.model.colour}"> <BR>
			</div>
			</div>
			<div class=" form-group row">
			<label  class="col-sm-2 col-form-label" >Location:</label>
			<div class="col-sm-7">
			<input type="text" name="Location" value="${requestScope.model.location}"> <BR>
			</div>
			</div>
			<div class=" form-group row">
			<label  class="col-sm-2 col-form-label" >Multibarcode Group:</label>
			<div class="col-sm-7">
			yes<input type="radio" id="yes" name="multiBarcode" value="yes">
			 no<input type="radio" id="no" name="multiBarcode" value="no"> <BR>
			</div>
			</div>
			<div class=" form-group row">
			<label  class="col-sm-2 col-form-label" >Quantity:</label>
			<div class="col-sm-7">
			<input type="text" name="quantity" value="${requestScope.model.quantity}"> <BR>
			</div>
			</div>
			<%-- <c:choose>
        <c:when test="${not empty requestScope.list }">
       <div class=" form-group row">
			<label  class="col-sm-2 col-form-label" >Select Supplier:</label>
			<div class="col-sm-7">
        <select name="supplierID" >
        <c:forEach var="supplier" items="${requestScope.list}">
       	 <option value="${supplier.id}">${supplier.name}</option>
      
        </c:forEach>
        </select>
       </div>
			</div>
        </c:when>
        <c:otherwise>
        	<p>You dont have any suppliers yet</p>
        	<a href="/Supplier/Add">Add new Supplier</a>
        	<!-- <button type="button">Add new Supplier</button> -->
        </c:otherwise>
        </c:choose>  --%>
			<c:choose>
        <c:when test="${not empty requestScope.list }">
       <div class=" form-group row">
			<label  class="col-sm-2 col-form-label" >Select Supplier:</label>
			<div class="col-sm-7">
        <select name="supplierList" >
        <c:forEach var="supplier" items="${requestScope.list}">
       	 <option value="${supplier.name}">${supplier.name}</option>
        </c:forEach>
        </select>
       </div>
			</div>
        </c:when>
        <c:otherwise>
        	<p>You dont have any suppliers yet</p>
        	<a href="/Supplier/Add">Add new Supplier</a>
        	<!-- <button type="button">Add new Supplier</button> -->
        </c:otherwise>
        </c:choose> 
			
        
		<td><input type="submit" value="Add Item" id="addItem"></td>
		  
		
	</table> 	
	</form>
		
		
	
	</div>
	</div>
	</div>
</body>
</html>	