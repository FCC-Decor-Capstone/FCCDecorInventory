<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" type="image/ico" href="<c:url value="/Img?name=favicon"></c:url>"/>
<title>User Login</title>
<style><%@include file="/resources/css/bootstrap.min.css"%></style>
<script><%@include file="/resources/js/bootstrap.min.js" %></script>
<script><%@include file="/resources/js/jquery-3.4.1.min.js" %></script>
<script>
	$('.alert').show();
	setTimeout(function(){ $('.alert').hide(); }, 3500);
	
	
	  window.onload = function () {
		/* if (window.location.protocol == 'http:') {
		      
		    console.log("you are accessing us via "
		        +  "an insecure protocol (HTTP). "
		        + "Redirecting you to HTTPS.");
		          
		    window.location.href = 
		        window.location.href.replace(
		                   'http:', 'https:');
		}  */
		     
	}  
</script>
<style>
.logo {
	width:100%;
	height:auto;
	margin: 2em auto;
}

#imgFlex {
	display:flex;
	justify-content:space-between;
}
</style>
</head>
<body>
	<c:if test="${isLoginFailed}">
		<div class="alert alert-warning" style="margin-bottom: 0px;">
		  <strong>Login not successful! </strong> Please check your email or password. Also, make sure your user status is Active!
		</div>
	</c:if>
	
	<c:if test="${isLogoutSuccess}">
		<div class="alert alert-success" style="margin-bottom: 0px;">
		  <strong>Logout successful! </strong> Thank you!
		</div>
	</c:if>

	<div class="jumbotron jumbotron-fluid" style="margin-bottom: 0px;">
		<div class="container ">
			<div class="row" style="margin: 0 auto;">
				<div
					class="col-lg-6 col-md-8 col-sm-12 container justify-content-center">
					<form action="dologin" method="post">
						<fieldset>
						
							
							
							
							<img class="logo" src='<c:url value="/Img?name=logo"></c:url>' alt=""/>
							
							         
					
							<h2>Please Sign In</h2>
							<hr class="colorgraph">
							<div class="form-group">
								<input type="email" name="email" required id="email"
									class="form-control input-lg" placeholder="Email Address" >
							</div>
							<div class="form-group">
								<input type="password" name="password" required id="password"
									class="form-control input-lg" placeholder="Password" >
							</div>
							<hr class="colorgraph">
							<div class="row">
								<div class="col-xs-12 col-sm-12 col-md-12">
									<input type="submit" class="btn btn-lg btn-success btn-block"
										value="Sign In">
								</div>
							</div>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>

	<footer class="page-footer font-small" style="background-color: #f5f5f5;">
		<div class="footer-copyright text-center py-4" style="align-items: center;">
			© 2021 <a>Internet Explorers </a>
		</div>
	</footer>
</body>