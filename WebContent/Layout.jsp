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
<li>Home</li>
<li><a href="addItem">Add Item</a></li>
<li><a href="readItem"> Item List </a></li>

</ul>
</div>
 <div><img id="imageInventory"src="InventoryControl.png" alt="Flowers in Chania"/></div>
	 <!-- <form>
	<table align ="center">
	<tr>
	<td> Item Name:</td>
			<td> <input type="text" name="itemName"> <BR></td>
			</tr>
			<tr>
			<td>Category:	
	<select name="category" id="category">
  <option value="volvo">Volvo</option>
  <option value="saab">Saab</option>
  <option value="mercedes">Mercedes</option>
  <option value="audi">Audi</option>
</select>
</td>
</tr>
		
			<tr>
			<td>Description:</td>
			 <td><input type="text" name="description"> <BR></td>
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
			 <td><input type="text" name="Multibarcode Group"> <BR></td>
			 </tr>
			 <tr>		
		<td><input type="submit" value="Add" ></td>
		</tr>
	</table> 	
	</form>  -->
</body>
</html>	