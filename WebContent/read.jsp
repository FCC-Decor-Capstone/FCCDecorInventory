 <%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@ page import="models.ItemSupplier" %>
   <%
   	ItemSupplier supplier = (ItemSupplier) request.getAttribute("Supplier");
   %>
    <%@ page import="models.Item" %>
   <% Item item = (Item) request.getAttribute("Item"); %>
   <!DOCTYPE html>
<html>
    <head>
   
    <style><%@include file="/resources/css/bootstrap.min.css"%></style>
	<script><%@include file="/resources/js/jquery-3.4.1.min.js" %></script>
	<script><%@include file="/resources/js/bootstrap.min.js" %></script>

	
	<style type="text/css">
    body {
        color: #566787;
		background: #ebebeb;
		font-family: 'Varela Round', sans-serif;
		font-size: 13px;
	}
	.table-wrapper {
        background: #fff;
        padding: 20px 25px;
        margin: 0px 0;
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
		margin: 1px 0 0;
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
		padding-left:0px;
	
		vertical-align: middle;
    }
	table.table tr th:first-child {
		width: 6px;
	}
	table.table tr th:last-child {
		width: 10px;
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
    

           <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>JSP Page</title>
            <link href="style.css" rel="stylesheet" type="text/css">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
            <link rel="stylesheet" href="/${Constants.URL_PREFIX}style.css" />
            <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
             <style><%@include file="/resources/css/main.css"%></style> 
	<script src="/${Constants.URL_PREFIX}scripts.js"></script>
	
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
	
<!--      <script type="text/javascript">
function toggleSidebar(){
	document.getElementById("sidebar").classList.toggle('active');
}


</script> -->
    </head>

    <% String table = (String) request.getAttribute("table"); %>

    <body>

   <%@ include file="/_shared/LeftBar.jsp"%>
	<%@ include file="/_shared/message.jsp"%>

<h1 id="ListOfItems">List Of Items</h1>
        <!-- <div id="float"> -->
         
          <%--  <form action="AddItem" >
               <button  class="w3-btn w3-black" type="submit" value="AddItem">Add New Item</button>
            </form>
            <form  class="search" action="SearchServlet" method="POST" >
              <div class="w3-show-inline-block">
                <input type="text" name="searchVal"  placeholder="Search.." value="${requestScope.searchVal}">
                <button class="w3-btn w3-teal"  type="submit" ><i class="fa fa-search"></i></button>
               </div>
            </form> --%>
  
         </div>  
        
<!-- <div id="itemList"> -->
 <div class="container">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-5">
						<h2></h2>
					</div>
					<div class="col-sm-7">
					<form action="AddItem" >
               <button  class="btn btn-primary" type="submit" value="AddItem">Add New Item</button>
            </form>
            <form  class="search" action="SearchServlet" method="POST" >
             
                <input type="text" name="searchVal"  placeholder="Search.." value="${requestScope.searchVal}">
                <button class="btn btn-primary" type="submit" ><i class="fa fa-search"></i></button>
              
            </form>
											
					</div>
                </div>
            </div>
            <table class="table table-striped table-hover">
                <thead>
  
	 <c:choose>
		<c:when test="${not empty requestScope.ItemList}">
			<!-- <table border=1 id="items">		 -->	
			 </thead>
                <tbody>	
					<tr>
					<c:if test="${sessionScope.urole=='Administrator'}">
						<th><span>Item Name</span></th>
						<th><span>Description</span></th>
						<!-- <th><span>Size</span></th> -->
						<th><span>Colour</span></th>
						<th><span>Initial Cost</span></th>
						<!-- <th><span>Location</span></th> -->
						<!-- <th><span>Multibarcode Item</span></th> -->
						<th><span>Quantity</span></th>
						
						
						<!-- <th><span>Category</span></th> -->
						<!-- <th><span>Supplier Name</span></th> -->
						<th><span>Delete Item</span></th>
						<th><span>Update Item</span></th>
						</c:if>
						
						
					</tr>
					<c:forEach var="item" items="${requestScope.ItemList}">		
					<tr>		
						<c:if test="${sessionScope.urole=='Administrator'}">								
						<td><a id="text" href="./ItemDetails?itemGroupId=${item.itemGroupId}"><span>${item.name}</span></a></td>
						<td><a id="text" href="./ItemDetails?itemGroupId=${item.itemGroupId}"><span>${item.description}</span></a></td>
						<%-- <td><a id="text" href="./ItemDetails?itemGroupId=${item.itemGroupId}"><span>${item.size}</span></a></td> --%>
						<td><a id="text" href="./ItemDetails?itemGroupId=${item.itemGroupId}"><span>${item.colour}</span></a></td>
						<td><a id="text" href="./ItemDetails?itemGroupId=${item.itemGroupId}"><span>${item.initialCost}</span></a></td>
						<%-- <td><a id="text" href="./ItemDetails?itemGroupId=${item.itemGroupId}"><span>${item.location}</span></a></td> --%>
						<%-- <td><a id="text" href="./ItemDetails?itemGroupId=${item.itemGroupId}"><span>${item.multiBarcode}</span></a></td> --%>
						<td><a id="text" href="./ItemDetails?itemGroupId=${item.itemGroupId}"><span>${item.quantity}</span></a></td>
						<%-- <td><a id="text" href="./ItemDetails?itemGroupId=${item.itemGroupId}"><span>${item.category}</span></a></td> --%>
					<%-- 	<td><a id="text" href="./ItemDetails?itemGroupId=${item.itemGroupId}"><span>${item.supplierName}</span></a></td> --%>
						
						
						
						<td><a id="addItem"   href="./DeleteServlet?itemGroupId=${item.itemGroupId}">  Delete</a></td>
						<td><a  id="addItem" href="./UpdateServlet?itemGroupId=${item.itemGroupId}">  Update</a></td>
						</c:if>
					
			
						<%-- <td class="actionCell"><div>
							<a href="javascript:confirmGo('Are you sure you want to delete?','./Delete?id=${item.id}')"><i class="fa fa-close tablebtn" style="color:red;"> Delete</i> </a> 
	                		<a href="./Edit?id=${item.id}"><i class="fas fa-pen tablebtn" style="color:green;"> Edit</i> </a>
	                	</div></td> --%>
					</tr>
				</c:forEach>
				
				</tbody>
            </table>
			<div class="clearfix">
                <div class="hint-text"></div>
            </div>
        </div>
    </div> 
		</c:when>
		<c:otherwise>
			<p>No Item Found.</p>
		</c:otherwise>
		
		
		
	</c:choose>
	

       <%--  <h1 id="ListOfItems">List Of Items</h1>
        <div id="searchAdd">
        <form action="ItemForm.jsp" >
        <button type="submit" value="AddItem">Add New Item</button>
        </form>
        <form  class="search" action="SearchServlet" method="get">
       
        <input type="text" name="searchVal"  placeholder="Search..">
       <button type="submit" ><i class="fa fa-search"></i></button>
    
        </form>
       
    
		<c:choose>
        <c:when test="${not empty requestScope.list }">
        <table>
        <tr>
        <th><span>Select Supplier</span></th>
        </tr><select name="supplierList" >
        <c:forEach var="supplier" items="${requestScope.list}">
        
       	 <option value="${supplier.id}"><c:out value="${supplier.name}" /></option>
        
        </c:forEach>
        </select>
        </table>
        </c:when>
        <c:otherwise>
        	<p>You dont have any suppliers yet</p>
        	<a href="/Supplier/Add">Add new Supplier</a>
        	<!-- <button type="button">Add new Supplier</button> -->
        </c:otherwise>
        </c:choose>
        </div>
        <div class="container">
        <%= table%>
        
      
        </div>
        </div>  --%>
      <!--   <a href="readI">Add a new friend</a> -->
     </body>

</html> 