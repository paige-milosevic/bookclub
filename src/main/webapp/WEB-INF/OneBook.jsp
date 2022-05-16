<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ page isErrorPage="true" %>  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>ReadShare</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

</head>
<body>
	<div class="container">
		<div class="row justify-content-between align-items-center">
			<h1 class="font-italic"><c:out value="${book.title}"></c:out></h1>
			<a href="/books">back to the shelves</a>
		</div>
		<div>
			<c:if test="${book.user.id != user.id}">
				<p class="font-weight-bold"><span class="text-danger"><c:out value="${book.user.name}"></c:out></span> read <span style="color: #663399"><c:out value="${book.title}"></c:out></span> by <span class="text-success"><c:out value="${book.author}"></c:out></span></p>
			</c:if>
			<c:if test="${book.user.id == user.id}">
				<p class="font-weight-bold"><span class="text-danger">You</span> read <span style="color: #663399"><c:out value="${book.title}"></c:out></span> by <span class="text-success"><c:out value="${book.author}"></c:out></span></p>
			</c:if>
			<c:if test="${book.user.id == user.id}">
				<p>Here are your thoughts:</p>
			</c:if>
			<c:if test="${book.user.id != user.id}">
				<p>Here are <c:out value="${book.user.name}"></c:out>'s thoughts:</p>
			</c:if>
		</div>
		<div class="border-top border-bottom border-dark">
			<p class="text-left"><c:out value="${book.thoughts}"></c:out></p>
		</div>
		<c:if test="${book.user.id == user.id}">
			<button><a href="/books/update/${book.id}">Edit</a></button>
		</c:if>
	</div>
</body>
</html>