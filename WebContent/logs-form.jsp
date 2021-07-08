<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
	<title>Logs</title>
	<meta charset="UTF-8">
	
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" type="image/ico" href="<c:url value="/Img?name=favicon"></c:url>"/>
	
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

	
	<style><%@include file="/resources/css/bootstrap.min.css"%></style>
	<script><%@include file="/resources/js/jquery-3.4.1.min.js" %></script>
	<script><%@include file="/resources/js/bootstrap.min.js" %></script>

	
	<style type="text/css">
    body {
        color: #566787;
		background: linear-gradient(90deg, rgba(122,127,133,1) 0%, rgba(228,232,237,1) 49%, rgba(122,127,133,1) 100%, rgba(88,95,102,0.975249474789916) 100%);
		font-family: 'Varela Round', sans-serif;
		font-size: 13px;
	}
	.table-wrapper {
        background: #fff;
        padding: 20px 25px;
        margin: 30px 0;
		border-radius: 3px;
        box-shadow: 0 1px 1px rgba(0,0,0,.05);
    }
	.table-title {
		padding-bottom: 15px;
		background: black;
		color: #fff;
		padding: 16px 30px;
		margin: -20px -25px 10px;
		border-radius: 3px 3px 0 0;
    }
    .table-title h2 {
		margin: 5px 0 0;
		font-size: 24px;
	}
	.table-title .btn {
		color: #566787;
		float: right;
		font-size: 13px;
		background: #fff;
		border: none;
		min-width: 50px;
		border-radius: 2px;
		border: none;
		outline: none !important;
		margin-left: 10px;
	}
	.table-title .btn:hover, .table-title .btn:focus {
        color: #566787;
		background: #f2f2f2;
	}
	.table-title .btn i {
		float: left;
		font-size: 21px;
		margin-right: 5px;
	}
	.table-title .btn span {
		float: left;
		margin-top: 2px;
	}
    table.table tr th, table.table tr td {
        border-color: #e9e9e9;
		padding: 12px 15px;
		vertical-align: middle;
		white-space:pre-wrap; 
		word-wrap:break-word;
	
		
    }
     table.table tr th:nth-of-type(4), table.table tr td:nth-of-type(4) {
		min-width: 50%;
		
    }
    



    table.table-striped tbody tr:nth-of-type(odd) {
    	background-color: #fcfcfc;
	}
	table.table-striped.table-hover tbody tr:hover {
		background: #f5f5f5;
	}
    table.table th i {
        font-size: 13px;
        margin: 0 5px;
        cursor: pointer;
    }	
    table.table td:last-child i {
		opacity: 0.9;
		font-size: 22px;
        margin: 0 5px;
    }
	table.table td a {
		font-weight: bold;
		color: #566787;
		display: inline-block;
		text-decoration: none;
	}
	table.table td a:hover {
		color: #2196F3;
	}
	table.table td a.settings {
        color: #2196F3;
    }
    table.table td a.delete {
        color: #F44336;
    }
    table.table td i {
        font-size: 19px;
    }
	table.table .avatar {
		border-radius: 50%;
		vertical-align: middle;
		margin-right: 10px;
	}
	.status {
		font-size: 30px;
		margin: 2px 2px 0 0;
		display: inline-block;
		vertical-align: middle;
		line-height: 10px;
	}
    .text-success {
        color: #10c469;
    }
    .text-info {
        color: #62c9e8;
    }
    .text-warning {
        color: #FFC107;
    }
    .text-danger {
        color: #ff5b5b;
    }
    
	</style>
	<script type="text/javascript">
	$(document).ready(function(){
		$('[data-toggle="tooltip"]').tooltip();
	});
	
	$(document).on("click", ".set-userid", function () {
	     var selectedUserId = $(this).data('tempid');
	     $(".modal-footer #userId").val( selectedUserId );
	});
	</script>

</head>
<body>
<!-- NAVBAR -->
	<nav class="navbar fixed-top navbar-expand-lg navbar-light bg-light">
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
		<div class="collapse navbar-collapse" id="navbarNavDropdown">
			<ul class="navbar-nav w-100">
				<!-- <li class="nav-item dropdown"><a class="nav-link " href="item"
					id="navbarItemLink" aria-haspopup="true" aria-expanded="false">
						Item </a></li> -->
				<li class="nav-item dropdown"><a class="nav-link " href="list"
					id="navbarItemLink" aria-haspopup="true" aria-expanded="false">
						Users </a></li>	
				<li class="nav-item dropdown"><a class="nav-link " href="#"
					id="navbarItemLink" aria-haspopup="true" aria-expanded="false">
						Logs </a></li>
				<li class="nav-item dropdown"><a class="nav-link " href="${pageContext.request.contextPath}/Supplier/"
					id="navbarItemLink" aria-haspopup="true" aria-expanded="false">
						Suppliers </a></li>
				<li class="nav-item dropdown"><a class="nav-link " href="${pageContext.request.contextPath}/Event/"
					id="navbarItemLink" aria-haspopup="true" aria-expanded="false">
						Events </a></li>	
				<li class="nav-item dropdown"><a class="nav-link " href="${pageContext.request.contextPath}/ListItem"
					id="navbarItemLink" aria-haspopup="true" aria-expanded="false">
						Items</a></li>		
				<li class="nav-item dropdown ml-auto"><a
					class="nav-link dropdown-toggle" href="#"
					id="navbarDropdownMenuLink" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> Account </a>
					<div class="dropdown-menu dropdown-menu-right"
						aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item" style="font-weight:bold; text-decoration: underline; padding-bottom: 1em">
						<c:out value="${sessionScope.uname}" /></a>
						<a class="dropdown-item" href="./">Home</a> 
						<!--<a class="dropdown-item" href="changePass">Change Password</a>-->
						<a class="dropdown-item" href="logout">Logout</a>
					</div></li>
			</ul>
		</div>
	</nav>
	<br />
	<br />



	

	
	<!-- Main Container HTML -->
    <div class="container">
        <div class="table-wrapper" style="overflow-x:auto">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-5">
						<h2>Logs</h2>
					</div>
					
                </div>
            </div>

            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                    	<th>Time</th>
                    	<th>User</th>
                        <th>Type</th>						
						<th>Activity</th>
                    </tr>
                </thead>
                <tbody>
                	<c:forEach var="log" items="${logs}">
	                    <tr>
	                    	<td><c:out value="${log.target}" /></td>
                   	         <c:set var="user">${log.user.id}</c:set>
	                    	<td><c:out value="${requestScope.listhmUsers[user]}" /></td>
	                        <td><c:out value="${log.type}" /></td>
	                        <td><c:out value="${log.activity}" /></td>
	                        
							
	                    </tr>
					</c:forEach>
                </tbody>
            </table>
			<div class="clearfix">
                <div class="hint-text">Showing <c:out value="${fn:length(logs)}" /> entries</div>
            </div>
        </div>
    </div> 
</body>
</html>