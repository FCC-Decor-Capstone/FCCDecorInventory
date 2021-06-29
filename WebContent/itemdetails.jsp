<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<%@ page isELIgnored="false" %>
<%@ page import="models.Event,helpers.Constants" %>
<%@ page import="models.Item" %>
<%@ page import="models.ItemsBarcode" %>
<%@ page import="models.ItemSupplier" %>
        <%! int i; %>
<% ItemsBarcode listBarcode = (ItemsBarcode) request.getAttribute("barcode"); %>
<% Item item = (Item) request.getAttribute("item"); %>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Item Details</title>
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
		<script>
		function printPage(id) {
			
			let prt = document.getElementById("chbxPrt").checked;
            let cls = document.getElementById("chbxCls").checked;
            //alert("./ShowBarcode?barcodeId="+id+"&prt="+ prt + "&cls="+cls)
			window.open("./ShowBarcode?barcodeId="+id+"&prt="+ prt + "&cls="+cls);
		} 
	</script>
	<style>
	.table-title .btn, .table-title h1 {
		color: white;
		}
		
	.table-title .btn {
		color: white;
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
	
	.table-title * {
		color: #566787;
	}
	
	.table-title .btn:hover, .table-title .btn:focus {
        color: #566787;
		background-color: #f2f2f2;
	}
	.table-title .btn i {
		float: left;
		font-size: 21px;
		margin-right: 5px;
	}
	table.table-striped.table-hover tbody tr:hover {
		background-color: #f5f5f5;
	}
	table.table td a {
		font-weight: bold;
		color: white;
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
	
	 .brImg {
    	height:4em;
    }
    </style>
</head>
<body class="rmdB">
	<%@ include file="/_shared/LeftBar.jsp"%>
	<%@ include file="/_shared/message.jsp"%>
	
	<form class="toolBox" id="topbox"> 			
		<input type="hidden" name="itemGroupId" value="${requestScope.model.itemGroupId}" />
			<c:if test="${sessionScope.urole == 'Administrator' or sessionScope.urole == 'Manager'}">
				<div>
					<button type="submit" formaction="UpdateServlet" formmethod="get"><i class="fas fa-pen tablebtn" style="color:green;"> Edit</i></button>
					<button type="button"  onClick="javascript:confirmGo('Are you sure you want to delete?','./DeleteServlet?itemGroupId=${requestScope.model.itemGroupId}')"><i class="fa fa-close tablebtn" style="color:red;"> Delete</i></button>
				</div>
			</c:if>	
				<button type="submit" formaction="./ListItem" formmethod="get"><i class="fas fa-arrow-left"> Back to List</i></button>
	</form>
	
	
	
	<main class="rmdT">
		<section class="elements" id="topopen">
			<p><strong>Item Name:</strong> ${requestScope.model.name}</p>

			<c:if test="${not empty requestScope.model.colour}">
				<p><strong>Item Colour:</strong> ${requestScope.model.colour}</p>
			</c:if>
			<c:if test="${not empty requestScope.model.size}">
				<p><strong>Item Size:</strong> ${requestScope.model.size}</p>
			</c:if>
			<c:if test="${not empty requestScope.model.location}">
				<p><strong>Item Location:</strong> ${requestScope.model.location}</p>
			</c:if>
			<c:if test="${not empty requestScope.model.category}">
				<p><strong>Item Category:</strong> ${requestScope.model.category}</p>
			</c:if>
			<c:if test="${not empty requestScope.model.supplierID}">
				<p><strong>Item Supplier:</strong> ${requestScope.supplierName}</p>
			</c:if>
			
			<c:choose>
				<c:when test="${requestScope.model.multiBarcode == 'yes'}">
						<p><strong>Item Count Mode:</strong> Auto</p>
						<c:if test="${not empty requestScope.count}">
							<p><strong>Barcode Item Count:</strong> ${requestScope.count}</p>		
						</c:if>
						
						<c:if test="${sessionScope.urole == 'Administrator'}">
							<c:if test="${not empty requestScope.model.initialCost}">
								<p><strong>Initial Item Cost:</strong> ${requestScope.model.initialCost} CAD</p>
								<c:if test="${not empty requestScope.count}">
									<p><strong>Total Cost Involved:</strong> ${requestScope.count * requestScope.model.initialCost} CAD</p>
								</c:if>
							</c:if>
						</c:if>
				</c:when>
				<c:otherwise>
					<p><strong>Item Count Mode:</strong> Manual</p>
						<c:if test="${not empty requestScope.model.quantity}">
							<p><strong>Total Manual Item Count:</strong> ${requestScope.model.quantity}</p>		
						</c:if>
						
						<c:if test="${sessionScope.urole == 'Administrator'}">
							<c:if test="${not empty requestScope.model.initialCost}">
								<p><strong>Initial Item Cost:</strong> ${requestScope.model.initialCost} CAD</p>
								<c:if test="${not empty requestScope.model.quantity}">
									<p><strong>Total Cost Involved:</strong> ${requestScope.model.initialCost * requestScope.model.quantity} CAD</p>
								</c:if>
							</c:if>
						</c:if>
				</c:otherwise> 	
	 		</c:choose>
			<c:if test="${sessionScope.urole == 'Administrator'}">
				<c:if test="${not empty requestScope.totalCost}">
					<p><strong>Total Cost Involved:</strong> ${requestScope.totalCost} CAD</p>
				</c:if>
			
			
				<c:if test="${not empty requestScope.totalCost}">
					<p><strong>Total Item Cost:</strong> ${requestScope.totalCost} CAD</p>
				</c:if>
			</c:if>
			
			<c:if test="${not empty requestScope.model.description}">
				<p id="comments"><strong>Description:</strong> ${fn:trim(requestScope.model.description)}</p>
			</c:if>
			
		

			
			
			
		</section>
 <section class="rmdT" >
			<div class="table-wrapper">
			<div class="table-title">
				<div class="row">
					<div class="col-sm-5">
						<h1>Item Details</h1>
					</div>
					<div class="col-sm-7">
					<c:if test="${sessionScope.urole == 'Administrator' or sessionScope.urole == 'Manager'}">
				 <c:choose>
				        <c:when test="${requestScope.model.multiBarcode == 'yes'}">  
							<a class="btn btn-primary " style="padding: 1em 3em; background-color:#0069d9; color:white; font-size: 15px "  href="./GenerateBarcode?ItemGroupID=${requestScope.model.itemGroupId}">Add New Barcode </a>
						</c:when>
				      <c:otherwise>
				      		<!-- this ensures non multibarcode items can have only maximum of 1 barcode for the entire category  -->
				      		<c:if test="${requestScope.count < 1}">
								<a class="btn btn-primary"  style="padding: 1em 3em; background-color:#0069d9; color:white; font-size: 15px " href="./GenerateBarcode?ItemGroupID=${requestScope.model.itemGroupId}">Add Barcode for entire bulk</a>
							</c:if>
				         </c:otherwise>
				</c:choose>
</c:if>
             		</div>
            	</div>
            
			<div class="clearfix">
                <div class="hint-text"></div>
            </div>
        </div>
        <table class="rmdT table-striped table-hover table">
<c:choose>
		<c:when test="${not empty requestScope.listBarcode}">
			<!-- <table border=1 id="items">		 -->	
			<thead>		
					<tr>
						<th><span>Barcode Id</span></th>
						<th><span>Item name</span></th>
						<th><span>comments</span></th>
						<th><span>condition</span></th>
						
						<th><span>Actions</span></th>
						<th style="background-color:lightgrey" colspan="3">
							<span> Print Options: 
								<span><input id="chbxPrt" type="checkbox" name="prt" checked/>
								<label for="chbxPrt">Auto Print</label></span>
								
								<span><input id="chbxCls" type="checkbox" name="cls" checked/>
								<label for="chbxCls">Auto Close</label></span>
							</span>
						</th>
						
						
					</tr>
			</thead>
				 <c:forEach var="barcode" items="${requestScope.listBarcode}">		
					<tr> 	
					        <td>${barcode.id}</td>						
							<td>${barcode.itemName}</td>
							<td>${barcode.comments}</td>
							<td>${barcode.condition}</td>
						   <%--  <td>${barcode.quantity}</td> --%>
							
							
							<td><a  class="btn btn-primary"  style="color:white;" href="./DeleteBarcode?barcodeId=${barcode.id}&itemGroupId=${requestScope.model.itemGroupId}">  Delete</a></td>
							
							<c:if test="${not empty requestScope.SucCtlMsg}">
				<br/><span >${requestScope.SucCtlMsg}</span>
			</c:if>
						    <td><a  class="btn btn-primary"  style="color:white;" href="./UpdateBarcode?barcodeId=${barcode.id}&itemGroupId=${requestScope.model.itemGroupId}">  Update</a></td>
						   


						    <td><img alt="my Image" class="brImg" src="CreateBarcode?barcodeId=${barcode.id}"></a></td>
						    <td><a  class="btn btn-primary" style="color:white;" onclick="printPage(${barcode.id})">Print</a></td>
    
			
						    
						  
					 </tr>
				</c:forEach> 
			
		</c:when>
		<c:otherwise>
			<p id="addItem">No Barcode is Found!</p>
		</c:otherwise> 	
	 </c:choose> 
	 </table>
    </div> 
    
</section>

		
	</main>
	<br>
	<br>
	<br>
	<br>
	<br>
	<footer class="page-footer font-small" style="background-color: #f5f5f5;">
		<div class="footer-copyright text-center py-4" style="align-items: center;">
			<a> © 2021 Internet Explorers </a>
		</div>
	</footer>
</body>
</html>
