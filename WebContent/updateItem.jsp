<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="models.Item" %>
     <%@ page import="models.ItemSupplier" %>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@ page import="models.ItemSupplier" %>
   <%
   	ItemSupplier supplier = (ItemSupplier) request.getAttribute("Supplier");
   %>
    
   <% Item item = (Item) request.getAttribute("item"); %>
    
<!DOCTYPE html>
<html>
<head>
<title>Item Update</title>
	<meta charset="UTF-8">
	
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" type="image/ico" href="<c:url value="/Img?name=favicon"></c:url>"/>
	<link rel="stylesheet" href="https://fo	nts.googleapis.com/css?family=Roboto|Varela+Round">
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<%@ include file="/_shared/LeftBar.jsp"%>

<%-- 	<style><%@include file="/resources/css/bootstrap.min.css"%></style>
	<script><%@include file="/resources/js/jquery-3.4.1.min.js" %></script>
	<script><%@include file="/resources/js/bootstrap.min.js" %></script>
 --%>	
	<style type="text/css">
	body {
		color: #566787;

		
		font-family: 'Roboto', sans-serif;
	}
	.layout-form h1 {
		color: #fff;
	}
	.form-control {		
		min-height: 41px;
/* 		box-shadow: none; */
		border-color: #e1e4e5;
	}
	.form-control:focus {
		border-color: #49c1a2;
	}
	.form-control, .btn {        
        border-radius: 3px;
    }
	.layout-form {
		max-width: 800px;
		margin: 0 auto;
		padding: 30px 0;
	}
	.layout-form form {
		color: #9ba5a8;
		border-radius: 3px;
    	margin-bottom: 15px;
        background: #fff;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        padding: 30px;
    }
	.layout-form h2 {
		color: #333;
		font-weight: bold;
        margin-top: 0;
    }
    .layout-form hr {
        margin: 0 -30px 20px;
    }    
	.layout-form .form-group {
		margin-bottom: 20px;
	}
	.layout-form label {
		font-weight: normal;
		font-size: 13px;
	}
	.layout-form .btn {        
        font-size: 16px;
        font-weight: bold;
		background: #49c1a2;
		border: none;
		min-width: 140px;
    }
	.layout-form .btn:hover, .signup-form .btn:focus {
		background: #3cb094;
        outline: none !important;
	}
	.layout-form a {
		color: #fff;
		text-decoration: underline;
	}
	.layout-form a:hover {
		text-decoration: none;
	}
	.layout-form form a {
		color: #49c1a2;
		text-decoration: none;
	}	
	.layout-form form a:hover {
		text-decoration: underline;
	}
	
	.autocomplete {
	  /*the container must be positioned relative:*/
	  position: relative;
	  display: inline-block;
	}
	.autocomplete-items {
	  position: absolute;
	  border: 1px solid #d4d4d4;
	  border-bottom: none;
	  border-top: none;
	  z-index: 99;
	  /*position the autocomplete items to be the same width as the container:*/
	  top: 100%;
	  left: 0;
	  right: 0;
	}
	.autocomplete-items div {
	  padding: 5px;
	  cursor: pointer;
	  background-color: #fff;
	  border-bottom: 1px solid #d4d4d4;
	}
	.autocomplete-items div:hover {
	  /*when hovering an item:*/
	  background-color: #e9e9e9;
	}
	.autocomplete-active {
	  /*when navigating through the items using the arrow keys:*/
	  background-color: DodgerBlue !important;
	  color: #ffffff;
	}
		</style>
<%-- <meta charset="ISO-8859-1">
<title>Update a Book</title>
<link href="style.css" rel="stylesheet" type="text/css">
 <style><%@include file="/resources/css/main.css"%></style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script type="text/javascript">
function toggleSidebar(){
	document.getElementById("sidebar").classList.toggle('active');
}
</script>
<link href="${contextPath}/resource/bootstrap.min.css" rel="stylesheet"> --%>
</head>
<body style="background: #344a71">


<form action="ListItem" method="get">
	<input class="btn btn-primary"  type="submit" value="Back To List" id="addItem">
	</form>

<div class="layout-form">


	<form  action="UpdateItem" method="get">
	<h2 >Update Item</h2>
	
	
	<div class="form-group">
	 	<label >Item Name:</label>         
	    <input type="hidden" name="itemGroupID" value="<%= item.getitemGroupId()%>"  >
		<input type="text"  class="form-control" name="itemName" required="required" placeholder="Item Name" value="<%= item.getName()%>"> 
	</div>
	
		
	<script>
		//copypasta from w3
		 function autocomplete(inp, arr) {
			  /*the autocomplete function takes two arguments,
			  the text field element and an array of possible autocompleted values:*/
			  var currentFocus;
			  /*execute a function when someone writes in the text field:*/
			  inp.addEventListener("input", function(e) {
			      var a, b, i, val = this.value;
			      /*close any already open lists of autocompleted values*/
			      closeAllLists();
			      //if (!val) { return false;} //
			      currentFocus = -1;
			      /*create a DIV element that will contain the items (values):*/
			      a = document.createElement("DIV");
			      a.setAttribute("id", this.id + "autocomplete-list");
			      a.setAttribute("class", "autocomplete-items");
			      /*append the DIV element as a child of the autocomplete container:*/
			      this.parentNode.appendChild(a);
			      /*for each item in the array...*/
			      for (i = 0; i < arr.length; i++) {
			        /*check if the item starts with the same letters as the text field value:*/
			        if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
			          /*create a DIV element for each matching element:*/
			          b = document.createElement("DIV");
			          /*make the matching letters bold:*/
			          b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
			          b.innerHTML += arr[i].substr(val.length);
			          /*insert a input field that will hold the current array item's value:*/
			          b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
			          /*execute a function when someone clicks on the item value (DIV element):*/
			              b.addEventListener("click", function(e) {
			              /*insert the value for the autocomplete text field:*/
			              inp.value = this.getElementsByTagName("input")[0].value;
			              /*close the list of autocompleted values,
			              (or any other open lists of autocompleted values:*/
			              closeAllLists();
			          });
			          a.appendChild(b);
			        }
			      }
			  });
			 
			          
			  /*execute a function presses a key on the keyboard:*/
			  inp.addEventListener("keydown", function(e) {
			      var x = document.getElementById(this.id + "autocomplete-list");
			      if (x) x = x.getElementsByTagName("div");
			      if (e.keyCode == 40) {
			        /*If the arrow DOWN key is pressed,
			        increase the currentFocus variable:*/
			        currentFocus++;
			        /*and and make the current item more visible:*/
			        addActive(x);
			      } else if (e.keyCode == 38) { //up
			        /*If the arrow UP key is pressed,
			        decrease the currentFocus variable:*/
			        currentFocus--;
			        /*and and make the current item more visible:*/
			        addActive(x);
			      } else if (e.keyCode == 13) {
			        /*If the ENTER key is pressed, prevent the form from being submitted,*/
			        e.preventDefault();
			        if (currentFocus > -1) {
			          /*and simulate a click on the "active" item:*/
			          if (x) x[currentFocus].click();
			        }
			      }
			  });
			  function addActive(x) {
			    /*a function to classify an item as "active":*/
			    if (!x) return false;
			    /*start by removing the "active" class on all items:*/
			    removeActive(x);
			    if (currentFocus >= x.length) currentFocus = 0;
			    if (currentFocus < 0) currentFocus = (x.length - 1);
			    /*add class "autocomplete-active":*/
			    x[currentFocus].classList.add("autocomplete-active");
			  }
			  function removeActive(x) {
			    /*a function to remove the "active" class from all autocomplete items:*/
			    for (var i = 0; i < x.length; i++) {
			      x[i].classList.remove("autocomplete-active");
			    }
			  }
			  function closeAllLists(elmnt) {
			    /*close all autocomplete lists in the document,
			    except the one passed as an argument:*/
			    var x = document.getElementsByClassName("autocomplete-items");
			    for (var i = 0; i < x.length; i++) {
			      if (elmnt != x[i] && elmnt != inp) {
			      x[i].parentNode.removeChild(x[i]);
			    }
			  }
			}
			/*execute a function when someone clicks in the document:*/
			document.addEventListener("click", function (e) {
			    closeAllLists(e.target);
			});
			} 
			 var categories = [
				 <c:forEach var="cat" items="${requestScope.CatList}">
				 "${cat}",
 				 </c:forEach>
				 ]
		</script>
		
		
		<div class="form-group">
			 <label>Category:     Hint: Space and Back to see the list</label>	         
         	 <input class="form-control" id="CatAutoCompl" type="text" name="category" placeholder="Type Category" value="${item.category}">
		</div>
		
		<script>
		autocomplete(document.getElementById("CatAutoCompl"), categories);
		</script>
		
		<div class="form-group">
	 		<label >Description:</label>
			<textarea  rows="4" class="form-control"  name="description" ><%= item.getdescription()%></textarea>		
		</div>
			
		<div class="form-group"
		<c:choose>
				<c:when test="${sessionScope.urole == 'Administrator'}">
					
				</c:when>
				<c:otherwise>
					style="display:none" 
				</c:otherwise>
				</c:choose>
		>
		  <label> Initial Cost:</label>
			<input class="form-control"  
				<c:choose>
				<c:when test="${sessionScope.urole == 'Administrator'}">
					type="text" 
				</c:when>
				<c:otherwise>
					type="hidden" 
				</c:otherwise>
				</c:choose>
			name="initialCost" value="<%= item.getinitialCost()%>"> <BR>
			<span style="color:red" id="errinitialCost"></span>
			<c:if test="${not empty requestScope.errCost}">
				<br/><span>${requestScope.errCost}</span>
			   </c:if>
			</div>
			
			
			<script>
				function verifyCost() {
					let n = document.getElementsByName('initialCost')[0].value;
					let input = document.getElementsByName('initialCost')[0];
					let errLbl = document.getElementById('errinitialCost');
					if (document.getElementsByName('initialCost')[0].value === '') return true;
					if (!isNaN(parseFloat(n)) && isFinite(n)) {
						errLbl.innerText = '';
						input.style.backgroundColor = '#fff';
						return true;
					} else {
						errLbl.innerText = 'Invalid Input, Decimal Number Expected'
						input.style.backgroundColor = 'mistyrose';
						return false;
					};
				};
				document.getElementsByName('initialCost')[0].onblur = verifyCost;

			</script>
			
			<div class="form-group">
				 <label >Size:</label>    
				 <input class="form-control"  type="text"  value="<%= item.getsize()%>" name="size" > 
			</div>
			
			<div class="form-group">
		 		<label >Color:</label>
				<input class="form-control"  type="text" value="<%= item.getColour()%>" name="color" > 
			</div>
			
			<div class="form-group">
	 			<label>Location:</label>
			 	<input class="form-control" type="text"  value="<%= item.getLocation()%>" name="Location" >
			</div>

			
			<div class="form-group" >
	 			<label >Auto Count (Edit will Delete Exisitng Barcodes):</label>
	       		<div class="form-control" >
		       		<input type="hidden" name="oldMultibarcode" value="${item.multiBarcode}" />
				 	yes<input type="radio" id="yes" value="yes" name="multiBarcode" onclick="toggleQuant('yes')" <c:if test="${item.multiBarcode == 'yes'}"> checked</c:if>>
				    no<input type="radio" id="no"  value="no" name="multiBarcode" onclick="toggleQuant('no')" <c:if test="${item.multiBarcode == 'no'}"> checked</c:if>>
				</div>
			</div>

			<div class="form-group" id="grpQty" style="display:none;">
				<label>Quantity:</label>
				<input class="form-control" type="hidden" min="0" id="inpQty" value="${item.getQuantity()}" name="quantity" value="-1"> <BR>
				<span style="color:red" id="errinpQty"></span>
				<c:if test="${not empty requestScope.errQuantity}">
					<br/><span>${requestScope.errQuantity}</span>
			   	</c:if>
			</div>
			
			<script>
				function  toggleQuant(clicked) {
					let grpQty = document.getElementById("grpQty");
					let inpQty = document.getElementById("inpQty");
					
					if (clicked !== "${item.multiBarcode}"){
						let answer = confirm("Changing Multibarcode type will erase currently linked barcodes",'Changing Item Barcode Purpose')
						if (!answer) {
							${item.multiBarcode}.checked = 'checked';
						}
					}
					
					if (document.getElementById("yes").checked){
						grpQty.style.display = "none";
						inpQty.value = "-1";
						inpQty.type = "hidden";
					} else {
						grpQty.style.display = "";
						inpQty.value = "1";
						inpQty.type = "number";
					}
				}
				
				<c:if test="${item.multiBarcode == 'no'}"> 
					grpQty.style.display = "";
					inpQty.type = "number";
				</c:if>
				function verifyQty() {
					let n = document.getElementById('inpQty').value;
					let input = document.getElementById('inpQty');
					let errLbl = document.getElementById('errinpQty');
					
					if (!isNaN(parseInt(n)) && isFinite(n)) {
						errLbl.innerText = '';
						input.style.backgroundColor = '#fff';
						return true;
					} else {
						errLbl.innerText = 'Invalid Input, Number Expected'
						input.style.backgroundColor = 'mistyrose';
						return false;
					};
				};
				document.getElementById('inpQty').onblur = verifyQty;
				
				
				
			</script>
		<c:choose>
        <c:when test="${not empty requestScope.list }">
       
       <div class=" form-group">
			<label >Select Supplier:</label>
			
	        <select class="form-control" name="supplierList" id="supplierSelect">
		        <c:forEach var="supplier" items="${requestScope.list}">
		       	 <option value="${supplier.id}">${supplier.name}</option>
		        </c:forEach>
	        </select>
       
	        <script>
	        	if (${requestScope.supplierAvailable}) {
	        		document.getElementById("supplierSelect").value =  ${item.supplierID};	
	        	} else {
	        		document.getElementById("supplierSelect").value =  2;
	        	}
	
	        </script>
		</div>
		
        </c:when>
        <c:otherwise>
        	<p>You dont have any suppliers yet</p>
        	<a href="/Supplier/Add">Add new Supplier</a>
        	<!-- <button type="button">Add new Supplier</button> -->
        </c:otherwise>
        </c:choose>
			
				
		<input class="btn btn-primary btn-block btn-lg" type="submit" value="Update Item" id="addItem">
		
		
	</form>
	</div>


	<footer class="page-footer font-small" style="background-color: #f5f5f5;">
		<div class="footer-copyright text-center py-4" style="align-items: center;">
			<a> © 2021 Internet Explorers </a>
		</div>
	</footer>

</body>
</html>