<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="style.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
<script type="text/javascript">
function toggleSidebar(){
	document.getElementById("sidebar").classList.toggle('active');
}
var close = document.getElementsByClassName("closebtn");
var i;

for (i = 0; i < close.length; i++) {
  close[i].onclick = function(){
    var div = this.parentElement;
    div.style.opacity = "0";
    setTimeout(function(){ div.style.display = "none"; }, 600);
  }
}
</script>

<link href="${contextPath}/resource/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="alert">
<span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
 <h3>Item is added successfully!</h3>
 </div>
<div id="sidebar">
<div class="toggle-btn" onclick="toggleSidebar()">
<span></span>
<span></span>
<span></span>
</div>
<ul>
<li>Home</a></li>
<li><a href="ItemForm.jsp">Add Item</a></li>
<li> <a href="readItem"> Item List</a></li>
</ul>
</div>


	<div class="container">
	 <div class="card">
   <div class="card-body">
<h1 id="iS">Inventory Management System</h1>
<h2 id="iS">Add Items</h2>

	<form  action="<%=request.getContextPath()%>/addItem" method="get">
	<table align ="center">
	
	<div class="form-group row">
	 <label class="col-sm-2 col-form-label">Item Name:</label>
	         <div class="col-sm-7">
			<input type="text" name="itemName" placeholder="Item Name" > <BR>
			</div>
			 </div>
			
		 <div class=" form-group row">
		<label class="col-sm-2 col-form-label">Category:</label>	
			
			
		<div class="col-sm-7">	
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
</div>
</div>
    <div class=" form-group row">

			<label  class="col-sm-2 col-form-label" >Description:</label>
			<div class="col-sm-7">	
			<textarea  rows="4" cols="30" name="description" >Enter text here...</textarea>
			<!--  <td><input type="text" name="description"> <BR></td> -->
			</div>
			</div>
			<div class=" form-group row">
		  <label class="col-sm-2 col-form-label" > Initial Cost:</label>
		  <div class="col-sm-7">
			<input type="text" name="initialCost"> <BR>
			</div>
			</div>
			<div class=" form-group row">
			<label  class="col-sm-2 col-form-label" >Size:</label>
			<div class="col-sm-7">
			<input type="text" name="size"> <BR>
			</div>
			</div>
			<div class=" form-group row">
			<label class="col-sm-2 col-form-label" >Colour:</label>
			<div class="col-sm-7">
			 <input type="text" name="color"> <BR>
			</div>
			</div>
			<div class=" form-group row">
			<label  class="col-sm-2 col-form-label" >Location:</label>
			<div class="col-sm-7">
			<input type="text" name="Location"> <BR>
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
			<input type="text" name="quantity"> <BR>
			</div>
			</div>	
		<td><input type="submit" value="Add Item" id="addItem"></td>
		
	</table> 	
	</form>
	</div>
	</div>
	</div>
</body>
</html>	