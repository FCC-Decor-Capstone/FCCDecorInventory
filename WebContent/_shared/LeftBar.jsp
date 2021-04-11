
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style><%@include file="/resources/css/style.css"%></style>
<script><%@include file="/resources/js/scripts.js" %></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

	<style><%@include file="/resources/css/bootstrap.min.css"%></style>
	<script><%@include file="/resources/js/jquery-3.4.1.min.js" %></script>
	<script><%@include file="/resources/js/bootstrap.min.js" %></script>
	<style type="text/css">
		body{
	width : 80%;
	margin-left: auto;
	margin-right : auto;
	}
	.navbar{
	width : 80%;
    background-color : #2e3436;
    color : white;
	margin-left: auto;
	margin-right : auto;
	}
	.navlink{
	text-color : white;
	}
	</style>
<%@ page import="helpers.Constants" %>
</head>
<body>
<nav class="navbar fixed-top navbar-expand-lg navbar-light bg-light">
	  <div class="collapse navbar-collapse" id="navbarNavDropdown">
	    <ul class="navbar-nav w-100">
	    <li class="nav-item dropdown"><a class="nav-link "
					id="navbarItemLink" aria-haspopup="true" aria-expanded="false">
						<c:out value="Hello ${user.name}" /><span class="blinker"> .</span> </a></li>
		  <li class="nav-item dropdown"><a class="nav-link " href="${pageContext.request.contextPath}/Supplier/"
					id="navbarItemLink" aria-haspopup="true" aria-expanded="false">
						Supplier </a></li>
		  <li class="nav-item dropdown"><a class="nav-link " href="${pageContext.request.contextPath}/readItem"
					id="navbarItemLink" aria-haspopup="true" aria-expanded="false">
						Item </a></li>					
	      <li class="nav-item dropdown ml-auto">
	        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	          Account
	        </a>
	        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
	          <a class="dropdown-item" href="./">Home</a>
	          <!-- <a class="dropdown-item" href="#editModal" data-toggle="modal">Edit User</a>-->
	          <a class="dropdown-item" href="#editModalName" data-toggle="modal">Change Name</a>
	          <a class="dropdown-item" href="#editModal" data-toggle="modal">Change Password</a>
	          <a class="dropdown-item" href="logout">Logout</a>
	        </div>
	      </li>
	    </ul>  
	  </div>
	</nav>
</body>
</html>