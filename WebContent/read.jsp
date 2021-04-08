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
           <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>JSP Page</title>
            <link href="style.css" rel="stylesheet" type="text/css">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
            <link rel="stylesheet" href="/${Constants.URL_PREFIX}style.css" />
            <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<script src="/${Constants.URL_PREFIX}scripts.js"></script>
	
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
	
     <script type="text/javascript">
function toggleSidebar(){
	document.getElementById("sidebar").classList.toggle('active');
}


</script>
    </head>

    <% String table = (String) request.getAttribute("table"); %>

    <body>

    <div id="sidebar">
<div class="toggle-btn" onclick="toggleSidebar()">
<span></span>
<span></span>
<span></span>
</div>
<ul>
<li>Home</li>
<li><a href="addItem">Add Item</a></li>
<!--  -->
<li><a href="readItem"> Item List</a></li>
</ul>
</div>

<h1 id="ListOfItems">List Of Items</h1>
        <div id="float">
         
           <form action="addItem" >
               <button  class="w3-btn w3-black" type="submit" value="AddItem">Add New Item</button>
            </form>
            <form  class="search" action="SearchServlet" method="POST" >
              <div class="w3-show-inline-block">
                <input type="text" name="searchVal"  placeholder="Search.." value="${requestScope.searchVal}">
                <button class="w3-btn w3-teal"  type="submit" ><i class="fa fa-search"></i></button>
               </div>
            </form>
  
         </div>  
        
<div id="itemList">
  
	 <c:choose>
		<c:when test="${not empty requestScope.ItemList}">
			<table border=1 id="items">				
					<tr>
						<th><span>Item Name</span></th>
						<th><span>Description</span></th>
						<th><span>Size</span></th>
						<th><span>Colour</span></th>
						<th><span>Initial Cost</span></th>
						<th><span>Location</span></th>
						<th><span>Multibarcode Item</span></th>
						<th><span>Quantity</span></th>
						<th><span>Category</span></th>
						<th><span>Supplier Name</span></th>
						<th><span>Delete Item</span></th>
						<th><span>Update Item</span></th>
						
					</tr>
					<c:forEach var="item" items="${requestScope.ItemList}">		
					<tr>		
														
						<td><a href="./ItemDetails?itemGroupId=${item.itemGroupId}"><span>${item.name}</span></a></td>
						<td><a href="./ItemDetails?itemGroupId=${item.itemGroupId}"><span>${item.description}</span></a></td>
						<td><a href="./ItemDetails?itemGroupId=${item.itemGroupId}"><span>${item.size}</span></a></td>
						<td><a href="./ItemDetails?itemGroupId=${item.itemGroupId}"><span>${item.colour}</span></a></td>
						<td><a href="./ItemDetails?itemGroupId=${item.itemGroupId}"><span>${item.initialCost}</span></a></td>
						<td><a href="./ItemDetails?itemGroupId=${item.itemGroupId}"><span>${item.location}</span></a></td>
						<td><a href="./ItemDetails?itemGroupId=${item.itemGroupId}"><span>${item.multiBarcode}</span></a></td>
						<td><a href="./ItemDetails?itemGroupId=${item.itemGroupId}"><span>${item.quantity}</span></a></td>
						<td><a href="./ItemDetails?itemGroupId=${item.itemGroupId}"><span>${item.category}</span></a></td>
						<td><a href="./ItemDetails?itemGroupId=${item.itemGroupId}"><span>${item.supplierName}</span></a></td>
						
						
						<td><a id="addItem"   href="./deleteServlet?itemGroupId=${item.itemGroupId}">  Delete</a></td>
						<td><a  id="addItem" href="./UpdateServlet?itemGroupId=${item.itemGroupId}">  Update</a></td>
						
			
						<%-- <td class="actionCell"><div>
							<a href="javascript:confirmGo('Are you sure you want to delete?','./Delete?id=${item.id}')"><i class="fa fa-close tablebtn" style="color:red;"> Delete</i> </a> 
	                		<a href="./Edit?id=${item.id}"><i class="fas fa-pen tablebtn" style="color:green;"> Edit</i> </a>
	                	</div></td> --%>
					</tr>
				</c:forEach>
				</table>
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