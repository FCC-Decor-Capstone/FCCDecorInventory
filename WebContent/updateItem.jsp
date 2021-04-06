<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="model.Item" %>
     <%@ page import="model.Supplier" %>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@ page import="model.Supplier" %>
   <% Supplier supplier = (Supplier) request.getAttribute("Supplier"); %>
    
   <% Item item = (Item) request.getAttribute("item"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update a Book</title>
<link href="style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script type="text/javascript">
function toggleSidebar(){
	document.getElementById("sidebar").classList.toggle('active');
}
</script>
<link href="${contextPath}/resource/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div id="sidebar">
<div class="toggle-btn" onclick="toggleSidebar()">
<span></span>
<span></span>
<span></span>
</div>
<ul>
<li>Home</a></li>
<li><a href="ItemForm.jsp">Add Item</a></li>
<li><a href="readItem"> Item List</a></li>
</ul>
</div>
<form action="readItem" method="get">
	<input style="margin-left:200px;" type="submit" value="Back To List" id="addItem">
	</form>

<div class="container">
	 <div class="card">
   <div class="card-body">
	<form  action="updateItem" method="get">
	<div id="Header">
	
	
	
<h1 id="iS">Inventory Management System</h1>
<h2 id="iS">Add Items</h2>
</div> 
	
	<div class="form-group row">
	 <label class="col-sm-2 col-form-label">Item Id:</label>
	         <div class="col-sm-7">
			<input type="text" name="itemGroupID" value="<%= item.getitemGroupId()%>"  > 
			</div>
			 </div>
	<div class="form-group row">
	 <label class="col-sm-2 col-form-label">Item Name:</label>
	         <div class="col-sm-7">
		<input type="text" name="itemName" placeholder="Item Name" value="<%= item.getName()%>"> 
		</div>
		</div>
			<div class="form-group row">
	 <label class="col-sm-2 col-form-label">Category:</label>
	         <div class="col-sm-7">
	<select name="category" id="category"  >
	<option ><%= item.getCategory()%></option>
	
  <option value="<%= item.getCategory()%>">Master</option>
  <option value="<%= item.getCategory()%>"> Maint $ Supply</option>
  <option value="<%= item.getCategory()%>"> serveware catering</option>
  <option value="<%= item.getCategory()%>"> indian statues and props</option>
  <option value="<%= item.getCategory()%>"> florals</option>
  <option value="<%= item.getCategory()%>">Centerpiece & Glass Vase	</option>
    <option value="<%= item.getCategory()%>">Furniture & Misc</option>
     <option value="<%= item.getCategory()%>">Kissing Balls</option>
     <option value="<%= item.getCategory()%>">Charger Plate and Misc</option>
     <option value="<%= item.getCategory()%>">Sashes Runners Chair Cover</option>
     <option value="<%= item.getCategory()%>">tablecloth</option>
     <option value="<%= item.getCategory()%>">Skirting</option>
     <option value="<%= item.getCategory()%>">Backdrop Fabrics</option>
     <option value="<%= item.getCategory()%>">Pipe and Drape</option>
</select>
</div>
</div>

<div class="form-group row">
	 <label class="col-sm-2 col-form-label">Description:</label>
	         <div class="col-sm-7">
			<textarea  rows="4" cols="30" textareaObject.value="<%= item.getdescription()%>" name="description" ><%= item.getdescription()%></textarea>
						<!--  <td><input type="text" name="description"> <BR></td> -->
			</div>
			</div>
			<div class="form-group row">
	 <label class="col-sm-2 col-form-label">Initial Cost:</label>
	         <div class="col-sm-7">
			
			 <input type="text" value="<%= item.getinitialCost()%>" name="initialCost" > 
			</div>
			</div>
			<div class="form-group row">
	 <label class="col-sm-2 col-form-label">Size:</label>
	         <div class="col-sm-7">
			 <input type="text"  value="<%= item.getsize()%>" name="size" > 
			</div>
			</div>
			<div class="form-group row">
	 <label class="col-sm-2 col-form-label">Color:</label>
	         <div class="col-sm-7">
			 <input type="text" value="<%= item.getColour()%>" name="color" > 
			</div>
			</div>
			<div class="form-group row">
	 <label class="col-sm-2 col-form-label">Location:</label>
	         <div class="col-sm-7">
			 <input type="text"  value="<%= item.getLocation()%>" name="Location" >
			</div>
			</div>
			<div class="form-group row">
	 <label class="col-sm-2 col-form-label">Multibarcode Group:</label>
	         <div class="col-sm-7">
			 yes<input type="radio" id="yes"  value="<%= item.getmultiBarcode()%>" name="multiBarcode"  >
			     no<input type="radio" id="no"   value="<%= item.getmultiBarcode()%>" name="multiBarcode">
			</div>
			</div>
			<div class="form-group row">
	 <label class="col-sm-2 col-form-label">Quantity:</label>
	         <div class="col-sm-7">
			 <td><input type="text" value="<%= item.getQuantity()%>" name="quantity" > <BR></td>
			</div>
			</div>
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
			
				
		<input type="submit" value="Update Item" id="addItem">
		
		
	</form>
	
	</div>
	</div>
	</div>

	
	

</body>
</html>