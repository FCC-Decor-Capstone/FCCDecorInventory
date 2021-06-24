<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="models.Item" %>
     <%@ page import="models.ItemSupplier" %>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@ page import="models.ItemSupplier" %>
   <%
   	ItemSupplier supplier = (ItemSupplier) request.getAttribute("Supplier");
   %>
    
   <% Item item = (Item) request.getAttribute("item"); %>
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

	<style><%@include file="/resources/css/bootstrap.min.css"%></style>
	<script><%@include file="/resources/js/jquery-3.4.1.min.js" %></script>
	<script><%@include file="/resources/js/bootstrap.min.js" %></script>
	
	<style type="text/css">
	body {
		color: #fff;
		background: #344a71;
		font-family: 'Roboto', sans-serif;
	}
	.form-control {		
		min-height: 41px;
		box-shadow: none;
		border-color: #e1e4e5;
	}
	.form-control:focus {
		border-color: #49c1a2;
	}
	.form-control, .btn {        
        border-radius: 3px;
    }
	.layout-form {
		width: 600px;
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
<%-- <meta charset="ISO-8859-1">
<title>Update a Book</title>
<link href="style.css" rel="stylesheet" type="text/css">
 <style><%@include file="/resources/css/main.css"%></style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script type="text/javascript">
function toggleSidebar(){
	document.getElementById("sidebar").classList.toggle('active');
}
</script>
<link href="${contextPath}/resource/bootstrap.min.css" rel="stylesheet"> --%>
</head>
<body>


<form action="ListItem" method="get">
	<input class="btn btn-primary"  type="submit" value="Back To List" id="addItem">
	</form>

<div class="layout-form">

<h1 >Update Items</h1>
	<form  action="UpdateItem" method="get">
	
	
	
	


	
	<div class="form-group" style="display:none;">
	 <label>Item Id:</label>
	         <div class="col-sm-7">
			<input type="hidden" name="itemGroupID" value="<%= item.getitemGroupId()%>"  > 
			</div>
			 </div>
	<div class="form-group">
	 <label >Item Name:</label>
	         <div class="col-sm-7">
		<input type="text" name="itemName" required="required" placeholder="Item Name" value="<%= item.getName()%>"> 
		</div>
		</div>
			<div class="form-group">
	 <label class="col-sm-2 col-form-label">Category:</label>
	         <div class="col-sm-7">
	<select name="category" id="category">
	<option value="<%=item.getCategory()%>"><%= item.getCategory()%></option>
	
	<option value="Accessories">Accessories</option>
	<option value="Catering">Catering</option>
	<option value="Centerpieces & Vases">Centerpieces & Vases</option>
	<option value="Charger Plates & Misc">Charger Plates & Misc</option>
  	<option  value="Decor Props">Decor Props</option>
  	<option  value="Equipment">Equipment</option>
  	<option  value="Fabrics & Panels">Fabrics & Panels</option>
  	<option  value="Florals">Florals</option>
  	<option  value="Furnitures & Misc">Furnitures & Misc</option>
  	<option  value="Indian Props">Indian Props</option>
  	<option  value="Maint & Supply">Maint & Supply</option>
  	<option  value="Office Supplies & Equipment">Office Supplies & Equipment</option>
  	<option  value="Pipe & Drape">Pipe & Drape</option>
  	<option  value="Private Dishware">Private Dishware</option>
  	<option  value="Promotional Items">Promotional Items</option>
  	<option  value="Sashes, Runners, and Chair Covers">Sashes, Runners, and Chair Covers</option>
  	<option  value="Skirting">Skirting</option>
  	<option  value="Supply - Florals">Supply - Florals</option>
  	<option  value="Table Cloth">Table Cloth</option>

</select>
</div>
</div>

<div class="form-group">
	 <label class="col-sm-2 col-form-label">Description:</label>
	         <div class="col-sm-7">
			<textarea  rows="4" cols="30" name="description" ><%= item.getdescription()%></textarea>		
			</div>
			</div>
			<div class="form-group">
	 <label class="col-sm-2 col-form-label">Initial Cost:</label>
	         <div class="col-sm-7">
			
			 <input type="text" value="<%= item.getinitialCost()%>" name="initialCost" > 
			</div>
			</div>
			<div class="form-group">
	 <label class="col-sm-2 col-form-label">Size:</label>
	         <div class="col-sm-7">
			 <input type="text"  value="<%= item.getsize()%>" name="size" > 
			</div>
			</div>
			<div class="form-group">
	 <label class="col-sm-2 col-form-label">Color:</label>
	         <div class="col-sm-7">
			 <input type="text" value="<%= item.getColour()%>" name="color" > 
			</div>
			</div>
			<div class="form-group">
	 <label class="col-sm-2 col-form-label">Location:</label>
	         <div class="col-sm-7">
			 <input type="text"  value="<%= item.getLocation()%>" name="Location" >
			</div>
			</div>
			<div class="form-group" >

	 <label class="col-sm-7 col-form-label">Auto Count (Edit Not Allowed, Delete item and recreate new if needed):</label>
	         <div class="col-sm-7">
	       
			 yes<input type="radio" id="yes" value="yes" name="multiBarcode" <c:if test="${item.multiBarcode == 'yes'}"> checked</c:if><c:if test="${item.multiBarcode == 'no'}"> disabled</c:if>>
			     no<input type="radio" id="no"  value="no" name="multiBarcode" <c:if test="${item.multiBarcode == 'no'}"> checked</c:if><c:if test="${item.multiBarcode == 'yes'}"> disabled</c:if>>
			</div>

			</div>
			<div class="form-group" id="grpQty">
	 <label class="col-sm-2 col-form-label">Quantity:</label>
	         <div class="col-sm-7">
			 <td><input type="number" min="0"  value="<%= item.getQuantity()%>" name="quantity" > <BR></td>
			</div>
			</div>
			<script>
					let grpQty = document.getElementById("grpQty");

					if (document.getElementById("yes").checked){
						grpQty.style.display = "none";
					} else {
						grpQty.style.display = "";
					}
				
			</script>
		<c:choose>
        <c:when test="${not empty requestScope.list }">
       <div class=" form-group">
			<label  class="col-sm-2 col-form-label" >Select Supplier:</label>
			<div class="col-sm-7">
        <select name="supplierList" id="supplierSelect">
	        <c:forEach var="supplier" items="${requestScope.list}">
	       	 <option value="${supplier.id}">${supplier.name}</option>
	        </c:forEach>
        </select>
        <p></p>
        <script>
        	if (${requestScope.supplierAvailable}) {
        		document.getElementById("supplierSelect").value =  ${item.supplierID};	
        	} else {
        		document.getElementById("supplierSelect").value =  2;
        	}
        	
        	
        </script>
       </div>
			</div>
        </c:when>
        <c:otherwise>
        	<p>You dont have any suppliers yet</p>
        	<a href="/Supplier/Add">Add new Supplier</a>
        	<!-- <button type="button">Add new Supplier</button> -->
        </c:otherwise>
        </c:choose>
			
				
		<input class="btn btn-primary" type="submit" value="Update Item" id="addItem">
		
		
	</form>
	</div>
	</div>
	</div>
	</div>


</body>
</html>