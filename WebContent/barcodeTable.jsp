<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
    <%@ page import="models.ItemsBarcode" %>
        <% ItemsBarcode barcode = (ItemsBarcode) request.getAttribute("barcode"); %>
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
<c:choose>
		<c:when test="${not empty requestScope.listBarcode}">
			<table border=1 id="items">				
					<tr>
						<th><span>Barcode Id</span></th>
						<th><span>Item name</span></th>
						<th><span>comments</span></th>
						<th><span>condition</span></th>
						<th><span>Actions</span></th>
						
					</tr>
				 <c:forEach var="barcode" items="${requestScope.listBarcode}">		
					<tr> 	
					        <td>${barcode.id}</td>						
							<td>${barcode.itemName}</td>
							<td>${barcode.comments}</td>
							<td>${barcode.condition}</td>
							
							<td><a  id="addItem" href="./DeleteBarcode?barcodeId=${barcode.id}">  Delete</a></td>
						    <td><a  id="addItem" href="./UpdateBarcode?barcodeId=${barcode.id}">  Update</a></td>
						    <td><a  id="addItem" href="./CreateBarcode?barcodeId=${barcode.id}">Get Barcode</a></td>
						   
					 </tr>
				</c:forEach> 
			</table>
		</c:when>
		<c:otherwise>
			<p id="addItem">No Barcode is Found!</p>
		</c:otherwise> 	
	 </c:choose> 
<%-- <p>Item id:${requestScope.list.id} </p>
<a href="./SaveBarCode?ItemGroupID=${requestScope.list.id}"> Generate Barcode  </a> --%>

</body>
</html>