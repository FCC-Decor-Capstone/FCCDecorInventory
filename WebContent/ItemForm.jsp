<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="style.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
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
	<form  action="addItem" method="get">
	<div id="Header">
<h1 id="iS">Inventory Management System</h1>
<h2 id="iS">Add Items</h2>
</div> 
	
	<table align ="center">
	<tr>
	<td id="Text"> Item Name:</td>
			<td> <input type="text" name="itemName" placeholder="Item Name"> <BR></td>
			</tr>
			<tr>
			<td id="Text">Category:</td>
			
			<td>
	<select name="category" id="category" >

  <option value="Master">Master</option>
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

</td>
			</tr>
			<tr>
			<td><label id="Text" >Description:</label></td>
			<td><textarea  rows="4" cols="30" name="description" >Enter text here...</textarea></td>
			<!--  <td><input type="text" name="description"> <BR></td> -->
			 </tr>
			 <tr>
			<td>Initial Cost:</td>
			 <td><input type="text" name="initialCost"> <BR></td>
			 </tr>
			 <tr>
			<td>Size:</td>
			 <td><input type="text" name="size"> <BR></td>
			 </tr>
			 <tr>
			<td>Colour:</td>
			 <td><input type="text" name="color"> <BR></td>
			 </tr>
			 <tr>
			<td>Location:</td>
			 <td><input type="text" name="Location"> <BR></td>
			 </tr>
		  <tr>
			<td>Multibarcode Group:</td>
			 <td>yes<input type="radio" id="yes" name="multiBarcode" value="yes">
			no<input type="radio" id="no" name="multiBarcode" value="no"> <BR></td>
			 </tr> 
			 <tr>
			<td>Quantity:</td>
			 <td><input type="text" name="quantity"> <BR></td>
			 </tr>
			 <tr>		
		<td><input type="submit" value="Add Item" id="addItem"></td>
		</tr>
	</table> 	
	</form>
	</div>
</body>
</html>	