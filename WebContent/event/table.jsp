<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<%@ page isELIgnored="false" %>
<%@ page import="models.Event,java.util.List,helpers.Constants" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Event List</title>

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" type="image/ico" href="<c:url value="/Img?name=favicon"></c:url>"/>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
	
	<script>
	function resetForm(e) {
	  document.getElementById('search').value = ""
	  document.forms.searchBox.submit();
	}
	</script>
</head>
<body class="rmdB">
	<%@ include file="/_shared/LeftBar.jsp"%>
	<%@ include file="/_shared/message.jsp"%>
	
	<div class="table-wrapper">
	<div class="table-title">
				<div class="row">
					<div class="col-sm-5">
						<h1>Event List</h1>
					</div>
					<div class="col-sm-7">
					<form action="" Method="GET" id="searchBox" class="table-title"> 
							<div class="searchItem">
								<c:if test="${not empty requestScope.search}">
									<button id="clearButton" onmousedown="resetForm(this)"><i class="fa fa-close tablebtn"></i></button>
								</c:if>
								<input type="text" placeholder="Type a keyword" name="search" id="search" value="${requestScope.search}"/>
								<button type="submit"><i class="fa fa-search"></i></button>
							</div>
							
							<c:if test="${sessionScope.urole == 'Administrator' or sessionScope.urole == 'Manager'}">
								<button type="submit" formaction="./Add" formmethod="get"><i class="fas fa-plus"> Add New</i></button>
							</c:if>
					</form>
					</div>
				</div>
			</div>
		
	<c:choose>
		<c:when test="${not empty requestScope.list}">
			<table class="rmdT table-striped table-hover">				
					<tr>
						<th><span>Name</span></th>
						<th><span>Date</span></th>
						<th><span>Client</span></th>
						<th><span>Location</span></th>
						<c:if test="${sessionScope.urole == 'Administrator' or sessionScope.urole == 'Manager'}">
							<th><span>Actions</span></th>
						</c:if>
					</tr>
					<c:forEach var="event" items="${requestScope.list}">		
					<tr>											
						<td><a href="${pageContext.request.contextPath}/Event/Details?id=${event.id}"><span>${event.name}</span></a></td>
						<td><a href="${pageContext.request.contextPath}/Event/Details?id=${event.id}"><span>${event.eventDate}</span></a></td>
						<td><a href="${pageContext.request.contextPath}/Event/Details?id=${event.id}"><span>${event.client}</span></a></td>
						<td><a href="${pageContext.request.contextPath}/Event/Details?id=${event.id}"><span>${event.location}</span></a></td>
						<c:if test="${sessionScope.urole == 'Administrator' or sessionScope.urole == 'Manager'}">
							<td class="actionCell"><div>
								<a href="javascript:confirmGo('Are you sure you want to delete?','${pageContext.request.contextPath}/Event/Delete?id=${event.id}')"><i class="fa fa-close" style="color:red;"></i> </a> 
		                		<a href="${pageContext.request.contextPath}/Event/Edit?id=${event.id}"><i class="fas fa-pen" style="color:green;"></i> </a>
		                	</div></td>
	                	</c:if>
					</tr>
				</c:forEach>
				</table>
		</c:when>
		<c:otherwise>
			<p>No Events Found.</p>
		</c:otherwise>
	</c:choose>
	</div>
	<footer class="page-footer font-small" style="background-color: #f5f5f5;">
		<div class="footer-copyright text-center py-4" style="align-items: center;">
			<a> © 2021 Internet Explorers </a>
		</div>
	</footer>
</body>
</html>
