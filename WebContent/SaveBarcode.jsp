<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="model.ItemsBarcode" %>
        <% ItemsBarcode barcode = (ItemsBarcode) request.getAttribute("barcode"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<p>Item id:${requestScope.list.id} </p>
<a href="./SaveBarCode?ItemGroupID=${requestScope.list.id}"> Generate Barcode  </a>

</body>
</html>