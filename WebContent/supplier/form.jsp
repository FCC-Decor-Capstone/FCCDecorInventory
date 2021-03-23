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
	<title>Supplier ${requestScope.action} Form</title>
	<link rel="stylesheet" href="/${Constants.URL_PREFIX}style.css" />
	<script src="/${Constants.URL_PREFIX}scripts.js"></script>
</head>
<body>
	<%@ include file="/_shared/message.jsp"%>
	
	<form action="${requestScope.action}" method="POST" class="rmdT">
		<h2>${requestScope.action} Supplier</h2>
	
		<input type="hidden" name="id" value="${requestScope.model.id}" />
		<div class="formElement">
			<label for="name">Supplier Name:</label>
			<input type="text" id="name" name="name" placeholder="Supplier Name" value="${requestScope.model.name}"/>
			<c:if test="${not empty requestScope.errName}">
				<br/><span class="err rmdT">${requestScope.errName}</span>
			</c:if>
		</div>
		<div class="formElement">
			<label for="contact">Contact Name:</label>
			<input type="text" id="contact" name="contact" placeholder="Contact" value="${requestScope.model.contact}"/>
			<c:if test="${not empty requestScope.errContact}">
				<br/><span class="err">${requestScope.errContact}</span>
			</c:if>
		</div>
		<div class="formElement">
			<label for="telephone">Contact Telephone:</label>
			<input type="text" id="telephone" name="telephone" placeholder="telephone" value="${requestScope.model.telephone}"/>
			<c:if test="${not empty requestScope.errTelephone}">
				<br/><span class="err">${requestScope.errTelephone}</span>
			</c:if>
		</div>
		<div class="formElement">
			<label for="comments">Comments:</label> <br />
			<c:if test="${not empty requestScope.errComments}">
				<br/><span class="err">${requestScope.errComments}</span>
			</c:if>
			<textarea id="comments" name="comments" placeholder="Add extra details" >${fn:trim(requestScope.model.comments)}</textarea>
		</div>
		<input type="submit" value="${requestScope.action}"/>
	</form>



</body>
</html>