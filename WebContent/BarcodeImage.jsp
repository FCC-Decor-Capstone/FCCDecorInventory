<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<%@ page isELIgnored="false" %>
      <%@ page import="models.Item" %>
       <%@ page import="models.ItemsBarcode" %>
        <% ItemsBarcode listBarcode = (ItemsBarcode) request.getAttribute("barcode"); %>
       <% Item item = (Item) request.getAttribute("item"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <link href="style.css" rel="stylesheet" type="text/css">
           
            <link rel="stylesheet" href="/${Constants.URL_PREFIX}style.css" />
            <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
</head>
<body>
<form>
<h1>${requestScope.model.name} Item Details</h1>
	<form class="toolBox"> 			
		<input type="hidden" name="id" value="${requestScope.model.itemGroupId}" />
				<%-- <div>
					<button type="submit" formaction="Edit" formmethod="get"><i class="fas fa-pen tablebtn" style="color:green;"> Edit</i></button>
					<button type="button"  onClick="javascript:confirmGo('Are you sure you want to delete?','./Delete?id=${requestScope.model.itemGroupId}')"><i class="fa fa-close tablebtn" style="color:red;"> Delete</i></button>
				</div> --%>
				
				
	</form>
	<form  action="readItem" method="get" >
	<button type="submit" id="addItem"><i class="fas fa-arrow-left"> Back to List</i></button>
	</form>
	<main class="rmdT">
			<p>Item Name: ${requestScope.model.name}</p>
			<c:if test="${not empty requestScope.model.description}">
				<p>Description: ${requestScope.model.description}</p>
			</c:if>
			<c:if test="${not empty requestScope.model.quantity}">
				<p>Quantity: ${requestScope.model.quantity}</p>
			</c:if>
			<c:if test="${not empty requestScope.model.multiBarcode}">
				<p>MultiBarcode: ${requestScope.model.multiBarcode}</p>
			</c:if>
		<section class="rmdT">
		
		<span>${requestScope.count}</span>
		 <c:choose>
		<c:when test="${not empty requestScope.listBarcode}">
			<table border=1 id="items">				
					<tr>
						<th><span>Barcode Id</span></th>
						<th><span>Item name</span></th>
						<th><span>comments</span></th>
						
					</tr>
				 <c:forEach var="barcode" items="${requestScope.listBarcode}">		
					<tr> 	
					        <td>${barcode.id}</td>						
							<td>${barcode.itemName}</td>
							<td><a href="./CreateBarCode?itemGroupID=${barcode.comments}"><span>${barcode.comments}</span></a></td>
					 </tr>
				</c:forEach> 
			</table>
		</c:when>
		<c:otherwise>
			<p >No Barcode  Found!</p>
		</c:otherwise> 	
	 </c:choose> 
<a id="addItem" href="./GenerateBarcode?ItemGroupID=${requestScope.model.itemGroupId}">Add barcode number for ${requestScope.model.name} </a>
<a id="addItem" href="./ReadBarCode?ItemGroupID=${requestScope.model.itemGroupId}">List Barcode linked with ${requestScope.model.name} </a>

<%-- <form  action="CreateBarCode" method="get">
<input type="date" name="date" value="${requestScope.ItemsBarcode.purchaseDate}" />
<input type="submit" value="Add ItemsBarcode" id="addItem">
</form> --%>
			<%-- 	<table class="rmdT">				
						<tr>
							<th><span>Item</span></th>
							<th><span>Category</span></th>
							<th><span>Description</span></th>
						</tr>
			<c:choose>
			<c:when test="${not empty requestScope.list}">
						<c:forEach var="item" items="${requestScope.list}">		
						<tr>											
							<td><a href="./Details?id=${item.name}"><span>${item.name}</span></a></td>
							<td><a href="./Details?id=${item.category}"><span>${item.category}</span></a></td>
							<td><a href="./Details?id=${item.description}"><span>${item.description}</span></a></td>
						</tr>
					</c:forEach>
				
			</c:when>
			<c:otherwise>
				<tr><td colspan="3"><div>No Items Linked.</div></td></tr>
			</c:otherwise>
		</c:choose>
			</table> --%>
		</section>
	</main>
<div>

<!-- <h3>GEnerating  Barcode </h3>
Static Way<br>

<form action="CreateBarCode" method="get">
 <input type="text" name="value"  value=""> Barcode:</input>
 <input type="submit" value="Create Barcode"></input>
 
</form> -->
<!-- <img alt="my Image" src="CreateBarCode"> -->

</div>
</body>
</html>