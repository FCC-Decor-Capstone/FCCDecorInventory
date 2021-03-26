<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="model.Item" %>
     <%@ page import="model.Supplier" %>
    
    <% Item item = (Item) request.getAttribute("item"); %>
     <% Supplier supplier = (Supplier) request.getAttribute("Supplier"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update a Book</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function toggleSidebar(){
	document.getElementById("sidebar").classList.toggle('active');
}
</script>
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
<div id="form">
	<form  action="updateItem" method="get">
	<div id="Header">
<h1 id="iS">Inventory Management System</h1>
<h2 id="iS">Add Items</h2>
</div> 
	
	<table align ="center">
	<tr>
	<td id="Text"> Item ID:</td>
			<td><input type="text" name="itemGroupID" value="<%= item.getitemGroupId()%>"  > <BR></td>
			</tr>
	<tr>
	<td id="Text"> Item Name:</td>
			<td> <input type="text" name="itemName" placeholder="Item Name" value="<%= item.getName()%>"> <BR></td>
			</tr>
			<tr>
			<td id="Text">Category:</td>
			
			<td>
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

</td>
			</tr>
			<tr>
			<td><label id="Text" >Description:</label></td>
			<td><textarea  rows="4" cols="30" textareaObject.value="<%= item.getdescription()%>" name="description" ><%= item.getdescription()%></textarea></td>
			<!--  <td><input type="text" name="description"> <BR></td> -->
			 </tr>
			 <tr>
			<td>Initial Cost:</td>
			 <td><input type="text" value="<%= item.getinitialCost()%>" name="initialCost" > <BR></td>
			 </tr>
			 <tr>
			<td>Size:</td>
			 <td><input type="text"  value="<%= item.getsize()%>" name="size" > <BR></td>
			 </tr>
			 <tr>
			<td>Colour:</td>
			 <td><input type="text" value="<%= item.getColour()%>" name="color" > <BR></td>
			 </tr>
			 <tr>
			<td>Location:</td>
			 <td><input type="text"  value="<%= item.getLocation()%>" name="Location" > <BR></td>
			 </tr>
		  <tr>
			<td>Multibarcode Group:</td>
			 <td>yes<input type="radio" id="yes"  value="<%= item.getmultiBarcode()%>" name="multiBarcode"  >
			     no<input type="radio" id="no"   value="<%= item.getmultiBarcode()%>" name="multiBarcode"> <BR></td>
			 </tr> 
			 <tr>
			<td>Quantity:</td>
			 <td><input type="text" value="<%= item.getQuantity()%>" name="quantity" > <BR></td>
			 </tr>
			 <tr>		
		<td><input type="submit" value="Update Item" id="addItem"></td>
		</tr>
	</table> 	
	</form>
	</div>

</body>
</html>