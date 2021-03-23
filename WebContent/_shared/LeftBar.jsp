
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style><%@include file="/resources/css/style.css"%></style>
<script><%@include file="/resources/js/scripts.js" %></script>
</head>
<body>
<div class= "navNavBar">
	<input type="checkbox" id="check">
	<label for="check"> <i class="fas fa-bars" id="btn"></i> 
		<i	class="fas fa-times" id="cancel"></i>
	</label>

	<div class="sidebar">
		<header>
			<c:if test="${sessionScope['uIsAdmin']}">Admin</c:if> Capstone 
			<span id="Side_uname"> 
			<c:if test="${not empty sessionScope['username']}">
					<i class="fas fa-user"></i>
          		${sessionScope['username']}</c:if>
			</span>
		</header>
		<c:choose>
			<%--
            ==========================
            	When not Signed
            ==========================
             --%>
			<c:when test="${empty sessionScope['username']}">
				<a href="../Noor"> <i class="fas fa-sign-in-alt"></i> 
					<span>Sign in</span>
				</a>
			</c:when>
			<c:otherwise>
				<c:choose>
					<%--
		            ==========================
		            	For Admin/Mellisa Only
		            ==========================
		             --%>
					<c:when test="${sessionScope['uIsAdmin']}">
						<a href="../noor/log"> <i class="fas fa-business-time"></i> 
							<span>Logs</span>
						</a>
						
						<a href="../"> <i class="far fa-file-alt"></i>
							<span>Sales</span>
						</a>     

						
					</c:when>
					
					<%--
		            ==========================
		            	For Managers & admin
		            ==========================
		             --%>
		             
				
				<c:when test="${sessionScope['uIsManager']}">
						<a href="../"> <i class="fas fa-business-time"></i> 
							<span>Products</span>
						</a>
						<a href="../noor"> <i class="far fa-id-card"></i>
							<span>List Users</span>
						</a>
						<a href="../noor"> <i class="far fa-id-card"></i>
							<span>Create User</span>
						</a>
						<a href="../noor"> <i class="far fa-id-card"></i>
							<span>Add Supplier</span>
						</a>
						
						
						
						</c:when>
												
					<%--
		            =====================
		            	For everyone
		            =====================
		             --%>
					<c:otherwise>
						<a href="../"  > <i class="far fa-file-alt"></i>
							<span>User Details</span>
						</a>
					
						<a href="../"> <i class="fas fa-business-time"></i> 
							<span>Add Event</span>
						</a>
						
						<a href="../" > <i class="fas fa-business-time"></i> 
							<span>Add Item</span>
						</a>
						<a href="../" > <i class="fas fa-business-time"></i> 
							<span>Add Category</span>
						</a>
					</c:otherwise>
				</c:choose>


				<a href="../home/redir/signout.jsp"> <i class="fas fa-sign-out-alt">
					</i> <span>Sign out</span>
				</a>
			</c:otherwise>
		</c:choose>
		<%--
            ==================
             Always show
            ==================
             --%>
		<a href="../supplier/Test.jsp"> <i class="far fa-question-circle"></i> 
			<span>About</span>
		</a>
	</div>
	</div>
</body>
</html>