<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<%@ page isELIgnored="false" %>
<%@ page import="models.Supplier,java.util.List,helpers.Constants" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Supplier List</title>
	
	<link rel="stylesheet" href="/${Constants.URL_PREFIX}style.css" />
	<script src="/${Constants.URL_PREFIX}scripts.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
	
	
</head>
<body>
	<%@ include file="/_shared/message.jsp"%>
	
	<h1>Suppliers' List</h1>	
		<form action="/${Constants.URL_PREFIX}Supplier/" Method="POST" class="searchBox"> 
				<div class="searchItem">
					<input type="text" placeholder="Type a keyword" name="search" value="${requestScope.search}"/>
					<button type="submit"><i class="fa fa-search"></i></button>
				</div>
				
				<button type="submit" formaction="Add" formmethod="get"><i class="fas fa-plus"> Add New</i></button>
		</form>
	<c:choose>
		<c:when test="${not empty requestScope.list}">
			<table class="rmdT">				
					<tr>
						<th><span>Name</span></th>
						<th><span>Contact</span></th>
						<th><span>Telephone</span></th>
						<th><span>Actions</span></th>
					</tr>
					<c:forEach var="supplier" items="${requestScope.list}">		
					<tr>											
						<td><a href="./Details?id=${supplier.id}"><span>${supplier.name}</span></a></td>
						<td><a href="./Details?id=${supplier.id}"><span>${supplier.contact}</span></a></td>
						<td><a href="./Details?id=${supplier.id}"><span>${supplier.telephone}</span></a></td>
						
						<td class="actionCell"><div>
							<a href="javascript:confirmGo('Are you sure you want to delete?','./Delete?id=${supplier.id}')"><i class="fa fa-close tablebtn" style="color:red;"> Delete</i> </a> 
	                		<a href="./Edit?id=${supplier.id}"><i class="fas fa-pen tablebtn" style="color:green;"> Edit</i> </a>
	                	</div></td>
					</tr>
				</c:forEach>
				</table>
		</c:when>
		<c:otherwise>
			<p>No Supplier Found.</p>
		</c:otherwise>
	</c:choose>
		
</body>
</html>