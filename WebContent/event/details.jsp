<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<%@ page isELIgnored="false" %>
<%@ page import="models.Supplier,helpers.Constants" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Event ${requestScope.action} Details</title>
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
	
	
</head>
<body>
	<%@ include file="/_shared/LeftBar.jsp"%>
	<%@ include file="/_shared/message.jsp"%>
	<h1>${requestScope.model.name} Event Details</h1>
	<form class="toolBox"> 			
		<input type="hidden" name="id" value="${requestScope.model.id}" />
				<div>
					<button type="submit" formaction="Edit" formmethod="get"><i class="fas fa-pen tablebtn" style="color:green;"> Edit</i></button>
					<button type="button"  onClick="javascript:confirmGo('Are you sure you want to delete?','./Delete?id=${requestScope.model.id}')"><i class="fa fa-close tablebtn" style="color:red;"> Delete</i></button>
				</div>
				
				<button type="submit" formaction="./." formmethod="get"><i class="fas fa-arrow-left"> Back to List</i></button>
	</form>
	<main class="rmdT">
			<p>Supplier Name: ${requestScope.model.name}</p>
			<c:if test="${not empty requestScope.model.contact}">
				<p>Contact Name: ${requestScope.model.contact}</p>
			</c:if>
			<c:if test="${not empty requestScope.model.telephone}">
				<p>Contact Telephone: ${requestScope.model.telephone}</p>
			</c:if>
			<c:if test="${not empty requestScope.model.comments}">
				<p>Comments: ${fn:trim(requestScope.model.comments)}</p>
			</c:if>
		<section class="rmdT">

				<table class="rmdT">				
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
			</table>
		</section>
	</main>
</body>
</html>