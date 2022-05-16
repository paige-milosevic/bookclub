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
		<div class="row justify-content-between">
			<h1>Add a Book to Your Shelf!</h1>
			<a href="/books">back to the shelves</a>
		</div>
		<div class="row">
			<form:form action="/books/create" method="post" modelAttribute="book">
				<div>
					<form:errors path="title"/>
					<form:label path="title">Title</form:label>
					<form:input path="title" input="text"/>
				</div>
				<div>
					<form:errors path="author"/>
					<form:label path="author">Author</form:label>
					<form:input path="author" input="text"/>
				</div>
				<div>
					<form:errors path="thoughts"/>
					<form:label path="thoughts">Thoughts</form:label>
					<form:textarea path="thoughts" input="text"/>
				</div>
				<div>
					<form:errors path="user"/>
					<form:input type="hidden" path="user" value="${user.id}"/>
				</div>
				<button type="submit">Submit</button>
			</form:form>
		</div>
	</div>
</body>
</html>